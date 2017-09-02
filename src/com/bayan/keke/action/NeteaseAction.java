package com.bayan.keke.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.ManageService;
import com.bayan.keke.service.NeteaseService;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.service.TeaUsService;
import com.bayan.keke.service.UserService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.vo.KeNetease;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeUser;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import net.sf.json.JSONObject;

/**
 * 
 * @author zx
 *
 */
public class NeteaseAction extends BaseAction 
    implements ModelDriven<KeNetease>, Preparable {

	/**
     * serialVersionUID
     */
	private static final long serialVersionUID = 5381694953702347712L;

    private static final Logger logger = Logger.getLogger(NeteaseAction.class);
    
    //支付对象
	private KePay kePay;
	
    // 云信对象
    private KeNetease keNetease;
    @Resource
	private UserService userService;
    @Resource
	private NeteaseService neteaseService;
    @Resource
	private TeaUsService teaUsService;
    @Resource
	private PayService payService;
	@Resource
	private ManageService manageService;
    @Resource
    private SubjectService subjectService;
    @Override
    public void prepare() throws Exception {
    	keNetease = new KeNetease();
    	kePay = new KePay();
    }

    @Override
    public KeNetease getModel() {
        return keNetease;
    }

    /**
     * 举手答疑
     * 
     * @return 后台计算生成的通话记录ID和可通话时间
     */
    public void handsUp(){
    	
    	printStartLog("方法开始handsUp", logger);
    	printParamsLog("获取云信ID参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keNetease.getUserId(),
				keNetease.getTeacherId(),
				keNetease.getAccStatus())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		try {
			Map<String, String> map = new HashMap<String, String>();
			//0:前端云信未登录 
	    	if ("0".equals(keNetease.getAccStatus())) {
	    		//返回生成的云信ID和token
	    		map = getAccId();
			}
			//	
			kePay.setUserId(keNetease.getUserId());
			//获取当前的油量

			int oilInt = 100;
			
			//获取当前通话人数（老师和学生一样）
			String cnt = neteaseService.callingCnt();
			int cntInt = Integer.valueOf(cnt);
			//取得云信老师相关的信息
			Map<String, Object> accTea = neteaseService.TeaRegist(keNetease);
			

			//计算正在通话的人数，超过10人的话，提示系统繁忙
			if (cntInt >= 10) {
				//正在通话的人数，超过10人
				printErrorLog("正在通话的人数，超过10人", logger);
				print("{\"code\":\"3003\",\"message\":\"当前同时在线人数过多，请排排队哦。\"}");
				return;
			}
			//取得对应老师的云信ID
			String accId = accTea.get("yunxin_id").toString();
			//判断老师是否在线
			String teaStatus = accTea.get("status").toString();
			//判断老师是否在通话
			if ("1".equals(teaStatus)) {
				//通话中
				printErrorLog("老师正在通话中", logger);
				print("{\"code\":\"3002\",\"message\":\"老师在忙 请稍后举手\"}");
				return;					
			}else {
				//离线老师
				printErrorLog("老师状态为离线", logger);
				
				//计算油量能够答疑时间
				String answerTime = String.valueOf(60 * oilInt);
				//生成记录ID("Kerkr"+四位随机数+当前系统时间后8位)，通话结束后返回后台
				//当前时间 yyyyMMddHHmmssSSS  
				String currTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS); 
				//8位日期  
				String strTime = currTime.substring(0, currTime.length());
				String strRandom = KeCommon.createRandom(4) + "";
				String record = "kk" + strRandom + strTime;
				
				//返回前端值
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("busyMsg", "老师可能在忙 小课先帮您联系。");
				obj.element("message", "答疑功能正在维护中");// 答疑功能不能使用时提示
				//答疑时间少于5分钟的时候提示
				obj.element("lowOilMsg", "油量过低 答疑可能会中途断开");

				obj.element("answerTime", answerTime);
				obj.element("accid", map.get("accid"));
				obj.element("token", map.get("token"));		
				obj.element("teaAccId", accId);
				obj.element("recordId", record );
				print(obj);
				
				// 将老师状态改为在线防止其他学生同时呼叫进来
				keNetease.setServiceStatus("1");
				neteaseService.upStuStatusYX(keNetease);// 学生状态改为通话
				neteaseService.upTeaStatusYX(keNetease);// 老师状态改为通话
				
				// 推送通知呼叫老师
				Map<String, Object> deviceMap = new HashMap<String, Object>();
				deviceMap.put("userId", keNetease.getTeacherId());// 用户id
				deviceMap.put("flag", '1'); // 老师
				List<Map<String, Object>> teaList = manageService.selDevices(deviceMap);
				if (teaList.size() == 1) {
					List<String> aliasTea = new ArrayList<String>();
					aliasTea.add(teaList.get(0).get("device_id").toString());
					boolean result = KeCommon.pushMsgToTea(aliasTea, "亲，有学生请求答疑", "学生答疑", "yunxin.caf");
					if (!result) {
						printDebugLog("老师消息推送失败", logger);
					}
				}else{
					printErrorLog("没有找到老师设备", logger);
				}
				
				printEndLog("举手答疑", obj.toString(), logger);			
			}
		} catch (Exception e) {
			//系统出错
			printSysErr(e, logger);
			return;
		}
    }
    
    /**
     * 老师接听请求
     * 
     * @return 从老师开始接听起计算答疑的开始时间
     */
	public void callStatus(){
    	
    	printStartLog("方法开始callStatus", logger);
    	printParamsLog("获取云信ID参数:", logger);    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keNetease.getUserId(),
				keNetease.getTeacherId(),
				keNetease.getRecordId(),
				keNetease.getFlag())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		try {

			List<String> strDevices = new ArrayList<String>();
			//取得老师的类型对应的设备号
			String teaDevice = neteaseService.selTeaDevice(keNetease);
			strDevices.add(teaDevice);

			//请求超时没老师接听自动挂断，给老师推送消息
			if ("0".equals(keNetease.getFlag())) {
				try {
					//插入一条云信消息推送记录
					keNetease.setSendFlagTea("1");// 已推送
					keNetease.setSendFlagStu("0");// 未推送
					keNetease.setHangUp("0");// 超时挂断
					Integer yxMegRcd0 = neteaseService.addMSGYunxin(keNetease);
					if (yxMegRcd0 > 0 ) {					
						//取得老师的设备号
						strDevices.add(teaDevice);
						//推送消息到老师端
						boolean result2 = KeCommon.pushMsgToTea(strDevices, "有家长向您请求答疑服务，请尽快上线等待家长再次呼叫", "有家长请求答疑");
						if(!result2){
							printErrorLog("超时自动挂断推送老师端消息失败", logger);
							//return;
						}
					}
				} catch (APIConnectionException  e1) {
					printSysErrServer(e1, logger);
				} catch (APIRequestException  e2) {
					printSysErrServer(e2, logger);
				}
			}
			
			//老师主动挂断：前端提示家长，后端记录老师主动挂断
			if ("2".equals(keNetease.getFlag())) {
				
				//插入一条云信消息推送记录
				keNetease.setSendFlagTea("0");// 未推送,直接提醒老师在忙
				keNetease.setSendFlagStu("0");// 未推送
				keNetease.setHangUp("2");// 老师挂断
				
				//插入一条云信消息推送记录
				Integer yxMegRcd2 = neteaseService.addMSGYunxin(keNetease);
				if (yxMegRcd2 > 0 ) {
					printDebugLog("老师主动挂断电话", logger);
				}
			}

			// 学生挂断3，老师挂断2，超时挂断0，状态都改为离线
			if ("0".equals(keNetease.getFlag()) || "2".equals(keNetease.getFlag()) || "3".equals(keNetease.getFlag())) {

				// 状态离线
				keNetease.setServiceStatus("0");
				neteaseService.upStuStatusYX(keNetease);// 学生状态改为离线
				neteaseService.upTeaStatusYX(keNetease);// 老师状态改为离线
			} else if ("1".equals(keNetease.getFlag())) {
				// 老师接听进行答疑服务
				// 老师接听后才插入一条当次通话的记录
				neteaseService.addCallYunxin(keNetease);
			} else {
				print("{\"code\":\"1001\",\"message\":\"答疑请求失败\"}");
				printErrorLog("请求答疑连接失败", logger);
				return;
			}
			
			print("{\"code\":\"1000\"}");
			
	    } catch (Exception e) {
	    	//服务器内部错误
			printSysErr(e, logger);
			return;
		}	
		
    }
    
    /**
     * 请求答疑结束
     * 
     */
    public void finish(){
    	
    	printStartLog("方法开始finish", logger);
    	printParamsLog("获取云信ID参数:", logger);    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keNetease.getUserId(),
				keNetease.getTeacherId(),
				keNetease.getRecordId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		try {
			
	    	//取得当前系统时间
			String currTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMS);
			//根据记录ID来找到对应记录的通话：开始时间
			Map<String, Object> callInfo = neteaseService.getRecordInfo(keNetease);
			String startTime = callInfo.get("start_time").toString();
			
			//计算通话时间（秒）
			long minutes = DateUtil.getOffectSeconds(startTime);
			//答疑时间不足10秒，不扣除学生费用，不给老师加钱
			int minuten = (int) minutes;
			if (minuten < 10) {
				//更新老师和学生的状态为：离线
				keNetease.setServiceStatus("0");
				//更新学生云信通话状态为离线
				neteaseService.upStuStatusYX(keNetease);
				//更新学生云信通话状态为离线
				neteaseService.upTeaStatusYX(keNetease);
				print("{\"code\":\"1000\",\"message\":\"本次答疑不足10秒\"}");
				printErrorLog("通话时间不超过10秒，没有扣除任何费用", logger);
				return;
			}
			
			//计算出答疑分钟数
			int min = (int)minutes/60;
			long mod = (minutes)%60;
			//不足1分钟的也按照1分钟计算
			if(mod >0){
				min = min + 1;
			}
			//答疑结束时间
			keNetease.setEndTime(currTime);
			//时间消耗
			String costTime = String.valueOf(min);
			keNetease.setCostTime(costTime);
			//根据通话时间计算消耗的油量:1L/1分钟
			String costOil = String.valueOf(min);
			keNetease.setCostOil(costOil);
			
			//更新学生的油量和记录表里的结束时间、时间消耗，油量消耗
			Integer upResultInfo = neteaseService.upAnswerInfo(keNetease);
			if (!(upResultInfo > 0)) {
				print("{\"code\":\"1001\",\"message\":\"答疑结束信息插入失败\"}");
				printErrorLog("更新通话记录表里的结束时间、时间消耗，油量消耗成功", logger);
				return;
			}
			
			//更新老师和学生的状态为：离线
			keNetease.setServiceStatus("0");
			//更新学生云信通话状态为离线
			Integer stuStatus = neteaseService.upStuStatusYX(keNetease);
			//更新学生云信通话状态为离线
			Integer teaStatus = neteaseService.upTeaStatusYX(keNetease);
			if (stuStatus > 0 && teaStatus > 0) {
				//返回前端值
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("message", "执行成功");
				print(obj);
				printEndLog("请求答疑连接成功", obj.toString(), logger);
			}else {
				print("{\"code\":\"1003\",\"message\":\"答疑请求连接失败。\"}");
				printErrorLog("请求答疑连接失败", logger);
				return;
			}    	
		} catch (Exception e) {
			//服务器内部错误
			printSysErr(e, logger);
			return;
		}
    }
    
    /**
     * 给老师答疑服务的评价
     * 
     */
    public void evaluate(){
    	
    	printStartLog("方法开始getAccId", logger);
    	printParamsLog("获取云信ID参数:", logger);    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keNetease.getRecordId(),
				keNetease.getComment())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			
			//给答疑老师评价
			Integer upCmm = neteaseService.upAnswerComment(keNetease);
			if (upCmm > 0) {
				//返回前端评价成功
				print("{\"code\":\"1000\",\"message\":\"评价成功\"}");	
				printDebugLog("给答疑老师评价成功", logger);
			}else{
				print("{\"code\":\"1001\",\"message\":\"评价失败\"}");
				printErrorLog("答疑评价更新失败", logger);
				return;
			}
		} catch (Exception e) {
			//服务器内部错误
			printSysErr(e, logger);
			return;
		}
    }
    
    /**
     * 家长端取得生成的云信ID和token
     */
    private Map<String, String> getAccId(){
    	
    	printStartLog("方法开始getAccId", logger);
    	printParamsLog("获取云信ID参数:", logger);    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keNetease.getUserId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return null;
		}
		
		try {
			//定义返回值
			Map<String, String> map = new HashMap<String, String>();
			//取出用户的Accid和token,判断用户是否注册过云信id
			Map<String, Object> acc = neteaseService.stuRegist(keNetease);
			if (acc == null) {
				KeUser keUser = new KeUser();
				keUser.setPhoneNumber(keNetease.getUserId());

				// 云信ID
				String systemTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS);
				String accId = "u" + systemTime;
				
				keNetease.setYunxinId(accId);
				//取得云信id和token
				String token = KeCommon.createAccid(accId);
				if(CheckUtil.isNullOrEmpty(token)){
					printErrorLog("云信ID生成失败", logger);
					print("{\"code\":\"1001\",\"message\":\"云信ID生成失败\"}");
					return null;
				}
				
				keNetease.setYunxinToken(token);
				//将云信数据插入DB
				Integer result = neteaseService.addStuYunxin(keNetease);
				if (result > 0) {
					//返回登录云信用信息
					map.put("accid", accId);
					map.put("token", token);
					printDebugLog("请求云信的返回值:", logger);
				}
			}else{
				//返回登录云信用信息
				//返回登录云信用信息
				map.put("accid", acc.get("yunxin_id").toString());
				map.put("token", acc.get("yunxin_token").toString());
				printDebugLog("请求云信的返回值:", logger);
			}
			//返回云信用信息
			return map;
		} catch (Exception e) {
			//系统错误
			printSysErr(e, logger);
			return null;
		}		
    }
    
/*	*//**
	 * 生成云信ID
	 * @param accid
	 *//*
    private String createAccid(String accid){
    	
    	// 云信基本参数
        String url = "https://api.netease.im/nimserver/user/create.action";
        String appKey = "d7e8297e43ab64f5c8966318288b33be";// 开发者平台appKey
        String appSecret = "4b058e50a8d4";
        String nonce =  String.valueOf(KeCommon.createRandom(6));// 随机数
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//计算CheckSum
        
        // 设置请求的header
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        httpPost.addHeader("AppKey", appKey);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        
        // 生成一个云信ID
        nvps.add(new BasicNameValuePair("accid", accid));
        
        CloseableHttpResponse response = null;
        try {
			
			// 执行请求
        	httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
			response = httpClient.execute(httpPost);
			
			// 云信返回值
			HttpEntity entity = response.getEntity();
			String accInfo = EntityUtils.toString(entity, "utf-8");
			
			// 关闭HttpEntity流
			EntityUtils.consume(entity);
			
			printDebugLog("云信返回值"+accInfo, logger);
			printDebugLog("云信状态Line"+response.getStatusLine(), logger);
			
			// 判断云信code
			if(CheckUtil.isNullOrEmpty(accInfo)){
				return "";
			}
			
			JSONObject json=JSONObject.fromObject(accInfo);
			
			//注册失败
			if(!"200".equals(json.getString("code"))){
				printErrorLog("云信注册失败"+json.getString("code"), logger);
				return "";
			}
			
			String token = json.getJSONObject("info").getString("token");
			return token;
		} catch (UnsupportedEncodingException e) {
			printSysErr(e, logger);
		} catch (IOException e) {
			printSysErr(e, logger);
		}finally {
	    	try {
	    		if(response != null){
	    			response.close();
	    		}
			} catch (IOException e) {
				printSysErr(e, logger);
			}
	    }
        //
        return null;
    }*/
    
}
