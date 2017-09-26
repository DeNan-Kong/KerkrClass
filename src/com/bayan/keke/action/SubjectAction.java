package com.bayan.keke.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.qiniu.util.Auth;
import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.FeedbackService;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.ReportService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.service.TeaSubService;
import com.bayan.keke.service.UserService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeDaily;
import com.bayan.keke.vo.KeDailyOpt;
import com.bayan.keke.vo.KeFeedback;
import com.bayan.keke.vo.KeHistoryInfo;
import com.bayan.keke.vo.KeMark;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KePhotoResult;
import com.bayan.keke.vo.KeReport;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeUser;
import com.bayan.keke.vo.KeWeekInfo;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;


import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * @author zx
 *
 */
public class SubjectAction extends BaseAction 
    implements ModelDriven<KeSubject>, Preparable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 2299778301374382990L;

    private static final Logger logger = Logger.getLogger(SubjectAction.class);

    //
    private KeSubject keSubject;
    private Auth auth = null;
    
    @Resource
    private TeaSubService teaSubService;
    @Resource
    private SubjectService subjectService;
    @Resource
    private FeedbackService feedbackService;
    @Resource
    private PayService payService;
    /* */
	@Resource
	private ReportService reportService;
	
	@Resource
	private UserService userService;
	
    @Override
    public void prepare() throws Exception {
        keSubject = new KeSubject();
    }

    @Override
    public KeSubject getModel() {
        return keSubject;
    }

    /**
     * 作业上传
     */
    public void upload() {
    	
    	printStartLog("方法开始upload", logger);
    	printParamsLog("用户上传图片参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType(), 
				keSubject.getPhotoCount())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
    	
		// 参数合法验证
		if(!CheckUtil.isNumber(keSubject.getPhotoCount())){
			printErrorLog("图片件数错误", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}else if(!CheckUtil.isSubjectType(keSubject.getSubjectType())){
			printErrorLog("科目种类错误", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}else if(!CheckUtil.isUserId(keSubject.getUserId())){
			printErrorLog("================用户ID错误=====================", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		
    	// 已经上传件数check
    	try {
/*    		//检查油量是否为0L,如果为0L则不可以上传作业
    		//查看当前剩余油量    		
    		KePay kp = new KePay();
    		kp.setUserId(keSubject.getUserId());
			String nowOil = payService.remainCntOil(kp);
			if (Integer.parseInt(nowOil) < Integer.parseInt(keSubject.getPhotoCount())) {
				// 油量变为0时，不可以再上传作业
	            print("{\"code\":\"1002\",\"message\":\"油量不足,请先加油\"}");
        		printDebugLog("油量不足,拍不了照片", logger);
	            return;
			}*/
    		
			// 判断该用户是否已注册
    		KeUser keUser = new KeUser();
    		keUser.setUserId(keSubject.getUserId());
    		keUser.setPhoneNumber(keSubject.getUserId());
			KeUser reg = userService.regist(keUser);
			if (reg != null) {
				
				if( "0".equals(reg.getOrgId()) ){
					// 用户登录失败
					print("{\"code\":\"1001\",\"message\":\"您还没有加入任何一个机构哦\"}");
					printDebugLog("您还没有加入任何机构", logger);
					return;
				}
			}else{
				// 用户登录失败
				print("{\"code\":\"1001\",\"message\":\"请先注册\"}");
				printDebugLog("没有注册", logger);
				return;
			}
			
        	// 上传时间没有设定的话，默认当天
        	if(keSubject.getCreateTime() == null || "".equals(keSubject.getCreateTime())){
        		String sysDateYMD = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
        		keSubject.setCreateTime(sysDateYMD);
        		printDebugLog("上传时间没有设定，默认当天", logger);
        	}
/*			Integer photoCountDb = subjectService.getPhotoCount(keSubject);
			
			if(photoCountDb > 0){
	            // 服务器内部错误
	            print("{\"code\":\"1001\",\"message\":\"一天只能上传一次哦  上传不能超过3张照片\"}");
        		printDebugLog("超过上传次数", logger);
	            return;
			}*/
		} catch (Exception e1) {
			printSysErr(e1, logger);
			return;
		}
    	
    	int photoCount = 0;
		if (keSubject.getPhotoCount() == null || "".equals(keSubject.getPhotoCount())) {

            // 服务器内部错误
            print("{\"code\":\"1001\",\"message\":\"没有设置上传作业图片张数\"}");
            return;
		}else{
//			photoCount = Integer.parseInt(keSubject.getPhotoCount());
//			if(photoCount > 3){
//	            // 服务器内部错误
//	            print("{\"code\":\"1001\",\"message\":\"一天只能上传一次哦  上传不能超过3张照片\"}");
//	            return;
//			}
			photoCount = Integer.parseInt(keSubject.getPhotoCount());
			//去掉上传限制
			/*if(photoCount > 9){
				// 服务器内部错误
				print("{\"code\":\"1001\",\"message\":\"一次最多只能上传9张作业哦\"}");
				return;
			}*/
		}

		// 4位随机数
		String randomCode = SendCodeUtil.random(4);
		// 系统时间
		String systemTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS);
		// 组ID
		String groupId = systemTime.substring(0, 8) + keSubject.getSubjectType() + randomCode;
		// 根据图片个数，生成对应的token
		auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
		String photoId = "";
		String key = "";
		String token = "";
		String photoSort = "";

		List<HashMap<String,String>> resultList = new ArrayList<HashMap<String,String>>();
		
		for (int i = 0; i < photoCount; i++) {
			
			token = auth.uploadToken(KeCommon.QINIU_BUCKET);

			photoId = systemTime + String.valueOf(i) + randomCode;
			key = createKey(keSubject.getUserId(), groupId, photoId);
			photoSort = KeConstant.ZERO + String.valueOf(i + 1);

			// 上传情报更新
			keSubject.setGroupId(groupId);
			keSubject.setQiniuKey(key);
			keSubject.setPhotoId(photoId);
			keSubject.setTaskStatus(KeConstant.UNCORRECTED);
			keSubject.setPhotoSort(photoSort);
			
			
			HashMap<String,String> resultMap = new HashMap<String,String>();
			resultMap.put("token", token);
			resultMap.put("qiniuKey", key);
			resultMap.put("photoId", keSubject.getPhotoId());
			resultMap.put("photoSort", keSubject.getPhotoSort());
			resultMap.put("groupId", keSubject.getGroupId());		
			resultMap.put("taskStatus", KeConstant.UNCORRECTED);
			resultList.add(resultMap);
		}


		JSONArray resultJsonArray = JSONArray.fromObject(resultList);
		
		JSONObject json = new JSONObject();
		json.element("result", resultJsonArray);
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "作业上传成功");
		print(json);
		
		// 请求结束log
		printEndLog("用户上传结束返回值:", json.toString(), logger);
    }

    /**
     * 上传照片成功，插入数据到DB
     */
    public void uploadOK(){
    	printStartLog("方法开始upLoadOK", logger);
    	printParamsLog("用户上传图片参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getPhotoId(),
				keSubject.getPhotoSort(),
				keSubject.getWidth(),
				keSubject.getHeight(),
				keSubject.getGroupId(),
				keSubject.getSubjectType(), 
				keSubject.getQiniuKey())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			keSubject.setTaskStatus(KeConstant.UNCORRECTED);
			// 上传情报更新
			subjectService.addTask(keSubject);
			
//			// 扣1L油量
//			KeCommon.minusOil(keSubject.getUserId(), KeConstant.ONE_OIL, payService);
			
			// 给老师推送消息,只有第一张推送
			if("01".equals(keSubject.getPhotoSort())){
				//分半查找试用和充值用户上传的未批改作业，给相应的老师推送消息
				pushTaskMsg(keSubject.getUserId());
			}
			print("{\"code\":\"1000\",\"message\":\"上传作业成功\"}");		
			printEndLog(KeConstant.KE_SUCCESS, "上传照片成功，插入数据到DB成功！", logger);
		} catch (APIConnectionException  e1) {
			print("{\"code\":\"1000\"}");
			printSysErrServer(e1, logger);
			return;
		} catch (APIRequestException  e2) {
			print("{\"code\":\"1000\"}");
			printSysErrServer(e2, logger);
			return;
		} catch (Exception e) {
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErrServer(e, logger);
			return;
		}		
    }

	/**
	 * 判断作业池无作业有新作业上传时或者作业上传5分钟内没有被批改时就提示给老师推送消息
	 * @throws APIRequestException 
	 * @throws APIConnectionException 
	 * @throws Exception
	 */
    private void pushTaskMsg(String userId) throws APIConnectionException, APIRequestException, Exception {
		
		// 检索老师
		Map<String,Object> Parm = new HashMap<String,Object>();
		Parm.put("userId", userId);
		List<String> Devices = subjectService.selDevices(Parm);
		
		// 给老师推送消息
		if(Devices.size() > 0){
			boolean result = KeCommon.pushMsgToTea(Devices, "有学生上传作业啦，快去批改吧。", "有作业上传");
			if(!result){
				printErrorLog("给老师推送消息失败", logger);
				return;
			}
		}
		
//		// 判断DB有未批改作业的话，给所有老师推送消息
//		//查找数据库未批改的作业份数	
//		KeTeaSub teaSub = new KeTeaSub();
//		teaSub.setType(type);// 充值用户
//		String uncorrectedCount = teaSubService.taskActive(teaSub);
//		
//		//取得当前时间的时分
//		String sysDate = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMS);
//		String sysDateHH = sysDate.substring(14,16);
//		//取得当前最新一张未批改作业的上传时间
//		String newTime = teaSubService.upTime(teaSub);
//		//计算取得当前最新一张未批改作业的上传时间与当前系统时间之间的差值
//		int mini = 0;
//		if(!CheckUtil.isNullOrEmpty(newTime)){
//			newTime = newTime.substring(14, 16);
//			//计算与当前时间的差值
//			mini = Integer.parseInt(sysDateHH)-Integer.parseInt(newTime);
//			mini = Math.abs(mini);
//		}
//		int uncreCntInt = Integer.parseInt(uncorrectedCount);
//		// 充值用户作业件数超过0份未批改的时候
//		if((0 < uncreCntInt && uncreCntInt < 4) || mini > 5){			
//			// 检索普通老师
//			Map<String,Object> Parm = new HashMap<String,Object>();
//			Parm.put("type", type);
//			List<String> Devices = subjectService.selDevices(Parm);
//			
//			// 给老师推送消息
//			if(Devices.size() > 0){
//				boolean result = KeCommon.pushMsgToTea(Devices, "有学生上传作业啦，快去批改吧。", "有作业上传");
//				if(!result){
//					printErrorLog("给老师推送消息失败", logger);
//					return;
//				}
//			}
//		}
	}
    
    /**
     * 模糊图片回传
     */
    public void postBack() {

    	printStartLog("方法开始postBack", logger);
    	printParamsLog("模糊图片回传参数。", logger);

		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType(), 
				keSubject.getPhotoId(),
				keSubject.getGroupId()
				)) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
    	// 获取模糊图片顺序
    	KeSubject keSubjectOld = null;
    	
		try {
			
			// 查找模糊图片信息
			keSubjectOld = subjectService.getPhotoInfo(keSubject);
	    	if(keSubjectOld == null){
	            print("{\"code\":\"1001\",\"message\":\"没有找到对应的作业图片\"}");
	    		return;
	    	}
		} catch (Exception e) {
            printSysErr(e, logger);
            print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}


        auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
        String token = auth.uploadToken(KeCommon.QINIU_BUCKET);
        
		// 系统时间
		String systemTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS);
		// 4位随机数
		String randomCode = SendCodeUtil.random(4);
        String photoId = systemTime + KeConstant.PHOTO_END + randomCode;
        
        // 组ID
        String groupId = keSubject.getGroupId();
        String key = createKey(keSubject.getUserId(), groupId, photoId);

        JSONObject json = new JSONObject();
        json.element("token", token);
        json.element("qiniuKey", key);
        json.element("photoId", photoId);
        json.element("groupId", groupId);
        json.element("photoSort", keSubjectOld.getPhotoSort());
        json.element("oldPhotoId", keSubjectOld.getPhotoId());
        json.element("taskStatus", KeConstant.UNCORRECTED);
        json.element("code", KeConstant.KE_SUCCESS);
        print(json);

		// 请求结束log
		printEndLog("模糊图片回传结束返回值:", json.toString(), logger);
    }
    
    /**
     * 模糊图片上传照片成功，插入数据到DB
     */
    public void postOk(){
    	printStartLog("方法开始postOK", logger);
    	printParamsLog("用户上传图片参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getPhotoId(),
				keSubject.getPhotoSort(),
				keSubject.getWidth(),
				keSubject.getHeight(),
				keSubject.getGroupId(),
				keSubject.getSubjectType(), 
				keSubject.getQiniuKey(),
				keSubject.getOldPhotoId()
				)) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			
        	// 模糊图片删除
        	subjectService.delBlurImgTask(keSubject);
			
			keSubject.setTaskStatus(KeConstant.UNCORRECTED);
			// 上传情报更新
			subjectService.addTask(keSubject);
			
			// 扣1L油量
			// free
//			KeCommon.minusOil(keSubject.getUserId(), KeConstant.ONE_OIL, payService);
			
			// 给老师推送消息,只有第一张推送
//			if("01".equals(keSubject.getPhotoSort())){
				//分半查找试用和充值用户上传的未批改作业，给相应的老师推送消息
				pushTaskMsg(keSubject.getUserId());
//			}
			print("{\"code\":\"1000\",\"message\":\"上传成功\"}");
			printEndLog(KeConstant.KE_SUCCESS, "模糊图片上传照片成功，插入数据到DB成功！", logger);
		} catch (Exception e) {
			//服务器错误
			printSysErr(e, logger);
			return;
		}		
    }
    
    /**
     * 作业结果确认
     */
    public void confirm(){
        
    	printStartLog("方法开始confirm", logger);
    	printParamsLog("作业结果确认参数。", logger);
    	//低评分时传入：keSubject.getReason();
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType(), 
				keSubject.getGroupId(),
				keSubject.getResult())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
        try {
        	
        	// 上传时间没有设定的话，默认当天
        	if(keSubject.getCreateTime() == null || "".equals(keSubject.getCreateTime())){
        		String sysDateYMD = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
        		keSubject.setCreateTime(sysDateYMD);
        	}
        	//查询当前是否未完成的作业，如果有则不可以评分（处理模糊图片回传的问题）
        	Integer uncorrectedCount = 0;
        	
        	//查询作业是否已经确认过了，防止重复确认
        	Integer correctedCount = 0;
            try {
            	// 判断是否还有未批改完成的作业
                uncorrectedCount = subjectService.selUncorrected(keSubject);
                
                // 判断是否已确认
                //correctedCount = subjectService.selCorrected(keSubject);
                correctedCount = 0;
            } catch (Exception e1) {
                printSysErr(e1, logger);
    			return;
            }
            
            // 有未批改完成的作业
            if(uncorrectedCount > 0){
                
            	printDebugLog("日报请求有未批改完成的作业。", logger);
            	
                JSONObject json = new JSONObject();
                // 有未批改完成的作业
                json.element("code", KeConstant.KE_UNCORRECTED);
                json.element("message", "这份作业未批改完成");
                print(json);
                return;
            }
            
            // 作业已确认
            if(correctedCount > 0){
            	
            	printDebugLog("作业重复确认。", logger);
            	
            	JSONObject json = new JSONObject();
            	// 有未批改完成的作业
            	json.element("code", KeConstant.KE_UNCORRECTED);
            	json.element("message", "您已经评分过啦");
            	print(json);
            	return;
            }
            
            //取得不满意的图片的photoId
        	List<String> photoLst1 = new ArrayList<String>();
        	List<String> photoLst2 = new ArrayList<String>();        	
        	String photos = keSubject.getPhotoIdList();
        	if (!CheckUtil.isNullOrEmpty(photos)) {				
        		String[] strLst = photos.split("/");
        		for (String ph : strLst) {
        			photoLst1.add(ph);
        		}          
			}
            //3颗星以下取得用户不满意原因
            if (!photoLst1.isEmpty()) {
            	//取得日报的全部图片的photoIdList
            	photoLst2 = subjectService.selPhotos(keSubject);
            	KeSubject sub = new KeSubject();
            	sub.setUserId(keSubject.getUserId());
            	sub.setGroupId(keSubject.getGroupId());
            	sub.setSubjectType(keSubject.getSubjectType());
            	sub.setCreateTime(keSubject.getCreateTime());
            	
            	for (String photoId : photoLst2) {					
            		// 判断是否被举报图片
            		if(photoLst1.contains(photoId)){
            			sub.setPhotoId(photoId);
            			sub.setResult(keSubject.getResult());
            			//更新被评分作业的状态
            			subjectService.confirmOne(sub);	
            			printDebugLog("低评分的照片状态更新成功", logger);
            		}else{            			
            			sub.setPhotoId(photoId);
            			sub.setResult("5");
            			//更新被评分作业的状态
            			subjectService.confirmOne(sub);
            			printDebugLog("低评分未被选择的照片默认5分更新成功", logger);
            		}
				}
            	
            	//截取低分原因内容不超过50个字
            	String rea = keSubject.getReason();
            	if (rea.length() > 50) {
            		rea = rea.substring(0,50);
        		}
            	keSubject.setReason(rea);
            	
            	//设定参数
            	KeFeedback keFeedback = new KeFeedback();
            	keFeedback.setUserId(keSubject.getUserId());
            	keFeedback.setContent(keSubject.getReason());
            	//学生反馈:0,老师反馈:1,低分评价：2
            	keFeedback.setType("2");
            	//将低分原因录入
				Integer res = feedbackService.insertQuestions(keFeedback);
				if (res <= 0) {
					//用户注册失败
					print("{\"code\":\"1001\",\"message\":\"评分失败\"}");// 添加失败
					printParamsJSON(logger);
					return;
				}
			}else {
				//作业结果确认为4、5分的时候直接插入星星值
            	subjectService.confirmSubject(keSubject);
			}
            //计算学分和老师收益
            getPointMoney(keSubject);
            //更新作业状态为：1已评分完成
        	subjectService.upConfirmStatus(keSubject);
        	//获得学分
        	//检查油量是否为0L,如果为0L则不可以上传作业
        	//查看当前剩余油量    		
        	KePay kp = new KePay();
        	kp.setUserId(keSubject.getUserId());
        	String nowOil = payService.remainCntOil(kp);        			
        	
        	JSONObject json = new JSONObject();
        	json.element("remainOil", nowOil);
        	json.element("taskStatus", KeConstant.CORRECTED);
        	json.element("code", KeConstant.KE_SUCCESS);
        	json.element("message", "评分成功");
        	print(json);
        	
        	// 请求结束log
        	printEndLog("作业结果确认结束返回值:", json.toString(), logger);
        } catch (Exception e) {
        	print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            printSysErr(e, logger);
			return;
        }		
    }
    /**
     * 获得学分和给老师计算收益
     */
    private void getPointMoney(KeSubject keSubject){
    	try {
        	List<Map<String,Object>> rstList = subjectService.getErrorResult(keSubject);
        	List<String> teacherList = new ArrayList<String>();
        	int countRight = 0;
        	String photoIdTmp = "";
        	for (Map<String,Object> rst : rstList) {
        		
        		int rightNum = Integer.parseInt(rst.get("result").toString());
        		countRight = countRight + rightNum;
        		
        		if(!photoIdTmp.equals(rst.get("photoId").toString())){
        			teacherList.add(rst.get("teacherId").toString());
        		}
        		photoIdTmp = rst.get("photoId").toString();
			}
        	Integer point = KeCommon.getPoint(countRight, rstList.size());
        	
        	// 更新学分
        	if(point > 0 ){
            	//作业结果确认
        		keSubject.setPointAll(point);
                subjectService.updatePointAll(keSubject);
        	}
        	
	    	for (String teacherId : teacherList) {
	        	// 给老师加0.5
	    		keSubject.setTeacherId(teacherId);
	    		keSubject.setAmount(KeConstant.MONEY_DOT_FIVE);
	        	subjectService.addConfirmMoney(keSubject);
	
				// 添加收入记录
				KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
				teaIncomeRcd.setTeacherId(teacherId);
				teaIncomeRcd.setAmount(KeConstant.MONEY_DOT_FIVE);
				teaIncomeRcd.setType(KeConstant.TYPE_IN);
				teaIncomeRcd.setComment(KeConstant.PGZY);
				subjectService.insTeaIncomeRcd(teaIncomeRcd);
			}
        			
        } catch (Exception e) {
        	print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            printSysErr(e, logger);
			return;
        }
    	
    }
    
    /**
     * 日报请求
     */
    public void dayList(){
        
    	printStartLog("方法开始dayList", logger);
    	printParamsLog("日报请求参数。", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		String sysDateYMD = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
    	// 判断是否是周报记录查询
    	if(CheckUtil.isNullOrEmpty(keSubject.getCreateTime())){
    		printDebugLog("时间没有设定，默认当天", logger);
    		keSubject.setCreateTime(sysDateYMD);
    	}
        boolean isToday = true;
    	if(!sysDateYMD.equals(keSubject.getCreateTime())){
    		isToday = false;
    	}
        
       
        // 获取日报信息
        List<KeDaily> keDailyList = null;
        
        try {
            keDailyList = subjectService.dayListSubject(keSubject);
        } catch (Exception e) {
            printSysErr(e, logger);
            return;
        }
        
        if(keDailyList==null || keDailyList.size() == 0){
    		printDebugLog("没有对应的日报", logger);
    		
            JSONObject json = new JSONObject();
            json.element("code", KeConstant.NO_DAILY);
            print(json);
            return;
        }
        
        // 返回前台数据
        KeDailyOpt keDailyOpt = new KeDailyOpt();
        StringBuilder commentBld = new StringBuilder();
        String beforePhotoId = "";
        String beforeCreateTime = "";
        String beforeUpdateTime = "";
        int countRight = 0;
        int countError = 0;
        int title = 1;
        KePhotoResult photoRst = null;
        List<KeMark> pointsRstList = null;
        List<KePhotoResult> photoResultList = new ArrayList<KePhotoResult>();;
        for (int i = 0; i< keDailyList.size(); i++) {
            KeDaily keDaily = keDailyList.get(i);
            
            // 批改作业信息
            KeMark keMark = new KeMark();
            keMark.setPointx(keDaily.getPointx());
            keMark.setPointy(keDaily.getPointy());
            keMark.setDirection(keDaily.getDirection());
            keMark.setContent(keDaily.getReason());
            keMark.setResult(keDaily.getResult());
            
            if(KeConstant.ERROR.equals(keDaily.getResult())){
                countError++;
            }else{
                countRight++;
            }
            
            // 判断是否同一张图片
            if(beforePhotoId.equals(keDaily.getPhotoId())){
            	
            	// 同一张图片只统计错误题目
                pointsRstList.add(keMark);
                
            }else{
                
            	// 下一张图片的信息统计
                if( i == 0){
                	
                	// 第一张图片
                    beforeCreateTime = keDaily.getCreateTime();
                    beforeUpdateTime = keDaily.getUpdateTime();
                }else{
                    photoRst.setPointsResult(pointsRstList);
                    photoResultList.add(photoRst);
                    
                    if(beforeCreateTime.compareTo(keDaily.getCreateTime()) < 0){
                        beforeCreateTime = keDaily.getCreateTime();
                    }
                    
                    if(beforeUpdateTime.compareTo(keDaily.getUpdateTime()) > 0){
                        beforeUpdateTime = keDaily.getUpdateTime();
                    }
                }

                photoRst = new KePhotoResult();
                photoRst.setTeacherId(keDaily.getTeacherId());
                photoRst.setTeacherName(keDaily.getTeacherName());
                photoRst.setPhotoId(keDaily.getPhotoId());
                photoRst.setPhotoUrl(KeCommon.getUrlSign(keDaily.getPhotoUrl()));
                photoRst.setTaskStatus(keDaily.getTaskStatus());
                photoRst.setTeacherHeadUrl(KeCommon.getUrlSign(keDaily.getTeacherHeadUrl()));
                //图片的宽和高
                photoRst.setWidth(keDaily.getWidth());
                photoRst.setHeight(keDaily.getHeight());
                //作业是否被举报（0否、1是）
                KeReport keReport = new KeReport();
                keReport.setUserId(keSubject.getUserId());
                keReport.setPhotoId(keDaily.getPhotoId());
                //查找举报的照片对应的作业信息
                try {
                	String rep = reportService.selRep(keReport);
                	int repInt = Integer.parseInt(rep);
                	if (repInt > 0) {
                		//已被举报过
                		photoRst.setHasReported("1");
                	}else {
                		//没有被举报过
                		photoRst.setHasReported("0");
                	}
                } catch (Exception e) {
                	printSysErr(e, logger);
                	return;
                }                
                //模糊图片取得退回的理由,模糊的时候将评论信息显示在模糊图片上
                pointsRstList = new ArrayList<KeMark>();
                if ("INVALID".equals(photoRst.getTaskStatus())){
                	//返回退回理由
                	photoRst.setCause(keDaily.getComment());
                	commentBld.append(String.valueOf(title) + "." + "作业无效" + "\n");
                	title = title + 1;
				}else{					
					if (CheckUtil.isNullOrEmpty(keDaily.getComment())) {
						keDaily.setComment("无");
					}
                	commentBld.append(String.valueOf(title) + "." + keDaily.getComment() + "\n");
                	title = title + 1;
                	pointsRstList.add(keMark);
				}

                beforePhotoId = keDaily.getPhotoId();
            }
        }
        
        photoRst.setPointsResult(pointsRstList);
        photoResultList.add(photoRst);
        
        // 作业组ID
        keDailyOpt.setGroupId(keDailyList.get(0).getGroupId());
        
        // 本组作业总的错误题数
        keDailyOpt.setCountError(String.valueOf(countError));
        // 本组作业总的正确题数
        keDailyOpt.setCountRight(String.valueOf(countRight));
        //图片信息
        keDailyOpt.setPhotoResult(photoResultList);
        // 该份作业的评级（A，B,C,D,E）
        keDailyOpt.setLevel(getClassInfo(countRight, countError));
        // 老师评语
        keDailyOpt.setComment(commentBld.toString());
        // 上传作业时间
        keDailyOpt.setCreateTime(beforeCreateTime);
        // 作业批改完成时间
        keDailyOpt.setUpdateTime(beforeUpdateTime);
        
        JSONObject json = JSONObject.fromObject(keDailyOpt);
        json.element("code", KeConstant.KE_SUCCESS);
        //是否为当天 
        json.element("isToday", isToday);
        print(json);
        
		// 请求结束log
		printEndLog("日报请求结束返回值:", json.toString(), logger);
    }


    /**
     * 日报分享
     */
    public void getShareId(){

        printStartLog("方法开始shareDayList", logger);
        printParamsLog("日报请求参数。", logger);

        // 参数验证
        if (CheckUtil.checkNulls(
                keSubject.getUserId(),
                keSubject.getSubjectType(),
                keSubject.getCreateTime())) {

            printErrorLog("传入的参数为空值,请参考参数日志", logger);
            print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            return;
        }
        try {
            String sysDateYMD = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
            // 判断是否是周报记录查询
            if(CheckUtil.isNullOrEmpty(keSubject.getCreateTime())){
                printDebugLog("时间没有设定，默认当天", logger);
                keSubject.setCreateTime(sysDateYMD);
            }

            //生成分享ID("KK"+四位随机数+当前系统时间后8位)
            //当前时间 yyyyMMddHHmmssSSS
            String currTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS);
            String strRandom = KeCommon.createRandom(4) + "";
            String shareID = "kk" + strRandom + currTime;
            keSubject.setShareId(shareID);
            Integer insInfo = subjectService.shareInfo(keSubject);
            if (insInfo < 1) {
                print("{\"code\":\"1001\",\"message\":\"插入信息失败\"}");
                printDebugLog("日报分享插入信息失败", logger);
                return;
            }
            //返回前端ShareID
            JSONObject json = new JSONObject();
            json.element("code", KeConstant.KE_SUCCESS);
            json.element("message", "取得分享ID成功");
            json.element("shareId", shareID);
            print(json);

            // 请求结束log
            printEndLog("取得分享ID请求结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 周报疑难:本周疑难
     */
    public void thisWeekList(){
        
    	printStartLog("方法开始thisWeekList", logger);
    	printParamsLog("本周疑难请求参数。", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
        // 获取本周一
        String firstDayOfWeek = DateUtil.getFirstDayOfWeek(DateUtil.dateFormatYMD) + KeConstant.TIME_DAY_START;
        
        // 获取本周日
        String lastDayOfWeek = DateUtil.getLastDayOfWeek(DateUtil.dateFormatYMD) + KeConstant.TIME_DAY_END;
        keSubject.setFirstDayOfWeek(firstDayOfWeek);
        keSubject.setLastDayOfWeek(lastDayOfWeek);
        
        List<KeWeekInfo> thisWeekList = null;
        try {
        	thisWeekList = subjectService.thisWeekList(keSubject);
        	
        } catch (Exception e) {
            printSysErr(e, logger);
			return;
        }

        JSONArray jsonArray = JSONArray.fromObject(thisWeekList);
        JSONObject json = new JSONObject();
        json.element("result", jsonArray);
        json.element("code", KeConstant.KE_SUCCESS);
        print(json);
        
		// 请求结束log
		printEndLog("本周疑难请求结束返回值:", json.toString(), logger);
    }
    
    /**
     * 周报疑难:历史周疑难
     */
    public void historyWeekList(){
        
    	printStartLog("方法开始historyWeekList", logger);
    	printParamsLog("历史周疑难参数。", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType(), 
				keSubject.getStartIndex(),
				keSubject.getEndIndex())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
        // 获取本周一
        String firstDayOfWeek = DateUtil.getFirstDayOfWeek(DateUtil.dateFormatYMD);
        keSubject.setFirstDayOfWeek(firstDayOfWeek);
        
        // 设置limit
        int selectCount=Integer.parseInt(keSubject.getEndIndex()) - Integer.parseInt(keSubject.getStartIndex());
        keSubject.setSelectIndex(Integer.valueOf(keSubject.getStartIndex()));
        keSubject.setSelectCount(selectCount);
        
        List<KeHistoryInfo> historyWeekList = null;
        try {
        	historyWeekList = subjectService.historyWeekList(keSubject);
        	
        } catch (Exception e) {
            printSysErr(e, logger);
			return;
        }
        
        JSONArray jsonArray = JSONArray.fromObject(historyWeekList);
        JSONObject json = new JSONObject();
        json.element("result", jsonArray);
        json.element("code", KeConstant.KE_SUCCESS);
        print(json);
        
		// 请求结束log
		printEndLog("历史周疑难结束返回值:", json.toString(), logger);
    }
    
    /**
     * 已解决
     */
    public void resolved(){

    	printStartLog("方法开始resolved", logger);
    	printParamsLog("周报已解决参数。", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keSubject.getUserId(), 
				keSubject.getSubjectType(), 
				keSubject.getCreateTime())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
    	try {
    		// 已解决
    		subjectService.resolved(keSubject);
    		
    	} catch (Exception e) {
    		printSysErr(e, logger);
			return;
    	}
    	
    	JSONObject json = new JSONObject();
    	json.element("code", KeConstant.KE_SUCCESS);
    	print(json);
    	
		// 请求结束log
		printEndLog("周报已解决结束返回值:", json.toString(), logger);
    }
    
    /**
     * 获取评级
     * @param countRight
     * @param countError
     * @return
     */
    private String getClassInfo(int countRight,int countError){
    	
    	if(countError == 0){
    		return "A+";
    	}else if(countError <= 3){
    		return "A";
    	}else if(countError <= 6){
    		return "B";
    	}else {
    		return "C";
    	}
    }
    
    /**
     * 创建七牛存储key
     * @param userId 用户ID
     * @param groupId 上传一份作业的组ID
     * @param photoId 上传的每张作业的ID
     * @return 七牛存储key
     */
    private String createKey(String userId, String groupId, String photoId){
        
        StringBuilder key = new StringBuilder();
        key.append(userId);
        key.append(KeConstant.DELIMITER);
        key.append(groupId);
        key.append(KeConstant.DELIMITER);
        key.append(photoId);
        
        return key.toString();
    }

    /**
     * 日报状态(三门作业状态一起返回)
     * 
     */
    public void statusList(){
    	
    	try {
	    	printStartLog("statusList方法开始", logger);
	    	printParamsLog("日报状态参数。", logger);
			// 参数验证
			if (CheckUtil.checkNulls(
					keSubject.getUserId() 
					//keSubject.getSubjectType()
				)) {			
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}
			//设置三门课程的状态
			List<String> list1 = new ArrayList<>();
			list1.add("01");
			list1.add("02");
			list1.add("03");
			//取得状态变量
			String sta = "";	    	
			//科目类别
			String sType = "";
			//作业状态
			String status = "";
			//状态结果
			JSONObject obj = new JSONObject();
			for (int i = 0; i < list1.size(); i++) {
				sType = list1.get(i);
				keSubject.setSubjectType(sType);			
				//取得该学生当天的作业
				List<KeSubject> regStatus = subjectService.getStatus(keSubject);
					//为空时,提示未上传作业
					if (regStatus.isEmpty()) {
						//今天还没上传作业！
						obj.element(sType, "NOTUPLOAD");
						obj.element("upload"+sType, "9");
						printEndLog(KeConstant.KE_FALSE,"今天还没上传作业！",logger);						
					}else {
						//状态值判断
						int statusUncorrected = 0;
						int statusCorrecting = 0;
						int statusFinish = 0;
						int statusCorrected = 0;
						int statusInvalid = 0;
						int subCount = regStatus.size();
						for(int j=0;j<subCount;j++){
							sta = regStatus.get(j).getTaskStatus();
							switch (sta) {
							case "UNCORRECTED":
								statusUncorrected++;
								break;
							case "CORRECTING":
								statusCorrecting++;
								break;
							case "FINISH":
								statusFinish++;
								break;
							case "CORRECTED":
								statusCorrected++;
								break;
							case "INVALID":
								statusInvalid++;
								break;
							}
						}
						
						//查看该科目已上传的有效作业数
						keSubject.setSubjectType(sType);
						Integer upLoadCnt = subjectService.getUploadCnt(keSubject);
						// 状态赋值
						if(statusUncorrected > 0 && statusCorrecting == 0){
							//msg = "等待检查！";
							status = "UNCORRECTED";
						}else if((statusFinish > 0 || statusInvalid > 0) 
								&& (statusFinish + statusInvalid + upLoadCnt) == subCount){
							//msg = "检查完成.模糊图片也算检查完成";
							status = "FINISH";
						}else if(statusCorrecting > 0){
							//msg = "正在检查！";
							status = "CORRECTING";
						}else if(statusCorrected > 0){
							//msg = "已完成！";
							status = "CORRECTED";
						}else{
							//msg = "正在检查！";
							status = "CORRECTING";
						}
						
						//检查油量是否为0L,如果为0L则不可以上传作业
			    		//查看当前剩余油量    		
			    		KePay kp = new KePay();
			    		kp.setUserId(keSubject.getUserId());
						String nowOil = payService.remainCntOil(kp);
						if ("0".equals(nowOil)) {
							upLoadCnt = 9;
						}
						//还能继续上传 的作业张数
						Integer canUpload = 9-upLoadCnt;
						//添加状态到JSON
						obj.element(sType, status);
						obj.element("upload"+sType, canUpload.toString());
					}
				}
				//检查油量是否为0L,如果为0L则不可以上传作业
	        	//查看当前剩余油量    		
	        	KePay kp = new KePay();
	        	kp.setUserId(keSubject.getUserId());
	        	String remainOil = payService.remainCntOil(kp);   
        	
				//一次性返回三门课的状态
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("remainOil", remainOil);
				print(obj);				
				
				// 请求结束log
				printEndLog("日报状态结束返回值:", obj.toString(), logger);
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
		}		
    }
    
}
