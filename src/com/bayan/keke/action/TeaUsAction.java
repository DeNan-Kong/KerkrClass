package com.bayan.keke.action;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.CommonService;
import com.bayan.keke.service.NeteaseService;
import com.bayan.keke.service.SalesService;
import com.bayan.keke.service.TeaSubService;
import com.bayan.keke.service.TeaUsService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeNetease;
import com.bayan.keke.vo.KeSales;
import com.bayan.keke.vo.KeTeaSub;
import com.bayan.keke.vo.KeTeaUs;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.qiniu.util.Auth;

import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TeaUsAction extends BaseAction implements
	ModelDriven<KeTeaUs>, Preparable{

	/* */
	private static final long serialVersionUID = -2630800740556018819L;
	//输出日志
	private static final Logger logger = Logger.getLogger(TeaUsAction.class);
	//
	private KeTeaUs keTeaUs;
	@Resource
	private SalesService salesService;
	@Resource
	private TeaUsService teaUsService;
	@Resource
	private TeaSubService teaSubService;
	@Resource
	private CommonService commonService;
    @Resource
	private NeteaseService neteaseService;
	@Override
	public void prepare() throws Exception {	
		keTeaUs = new KeTeaUs();
	}
	@Override
	public KeTeaUs getModel() {
		return keTeaUs;
	}
	
	/**
	 * 获取key和token返回给前端传教师资格证照片到七牛上存储
	 * 
	 */	
	public void getToken(){
		
		printStartLog("getToken方法开始", logger);
		printParamsLog("请求参数。", logger);
		//七牛授权
		String token = "";
		//存教师证KEY
		String key = "";
		if (CheckUtil.checkNulls(
				keTeaUs.getPhoneNumber())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		//将证书照片上传七牛云
		Auth auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
		token = auth.uploadToken(KeCommon.QINIU_BUCKET_CERTIFICATE);
		key = createKey(keTeaUs.getPhoneNumber());
		
		//将数据库查询出来的所有数据做成Json对象
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "获取上传图片权限成功");
		json.element("token", token);
		json.element("key", key);
		print(json);
		printEndLog("返回key+token给前端存储照片", json.toString(), logger);
	}
	
	/**
	 * 老师注册
	 */
	public void add() {
		try {
			printStartLog("add方法开始", logger);
			printParamsLog("请求参数。", logger);
			
			//首次注册,添加一个假头像地址判断
			keTeaUs.setHeadUrl("kerkr999");
			//设置设备的用途：0学生,1老师
			keTeaUs.setFlag("1");
			//注册用户进来默认为：注册老师类型(0:内部,1:外部)
			keTeaUs.setType("1");
			if(CheckUtil.isNullOrEmpty(keTeaUs.getDeviceId())){
				keTeaUs.setDeviceId("nodeviceid");
				printErrorLog("取不到deviceId", logger);
			}
			if (CheckUtil.checkNulls(
					keTeaUs.getPhoneNumber(),
					keTeaUs.getPassword(),
					keTeaUs.getDeviceId(),
					keTeaUs.getDeviceType(),
					keTeaUs.getUserName(),
					keTeaUs.getSex(),
					keTeaUs.getGrade(),
					keTeaUs.getSubjectType(),
					keTeaUs.getCityCode(),
					keTeaUs.getProvinceCode(),
					keTeaUs.getCertificateUrl()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> reg = teaUsService.teaRegist(keTeaUs);			
				if (reg == null) {					
					//第一次注册，审查教师证状态为：NEW(新申请)
					keTeaUs.setApproveStatus("NEW");
					//老师注册立即变为在线状态,只有点击退出当前账户时才会更新状态为离线
					keTeaUs.setActiveStatus("ONLINE");
					//初始化机构：0
					keTeaUs.setOrgId("0");
					//将信息注册
					Integer result = teaUsService.teaAdd(keTeaUs);
					if (result > 0) {
						KeSales keSales = new KeSales();
						// 取得老师ID
						keSales.setPhoneNumber(keTeaUs.getPhoneNumber());
						// 优惠码对应金额,第一次注册：30元,往后跟据老师的推广效益来改变优惠码的金额
						keSales.setMoney("30");
						// 优惠使用次数限制：500次
						keSales.setCount("500");
						// 注册成功后,生成一个SID,判断是否存在，如果存在重新生成一个。循环10次都重复的话，报错误提示
						// 10000个以内基本不会重复
						for (int j = 0; j < 11; j++) {
							// 10次都有重复，系统错误
							if (j == 10) {
								printErrorLog("★★★SID生成有错★★★", logger);
								print("{\"code\":\"1002\",\"message\":\"SID生成重复，请重新请求\"}");// 添加失败
								return;
							}							
							// 生成唯一ID
							String sid = KeCommon.createSid();
							if(sid.length() != 6){
								continue;
							}
							keSales.setSIDCode(sid);
							// 判断SID码是否已经存在
							String sidStr = salesService.getSid(keSales);
							if (CheckUtil.isNullOrEmpty(sidStr)) {
								// 将SID码注册,注册使用有效期限
								Integer res = salesService.salAddSid(keSales);
								if (res <= 0) {
									printErrorLog("★★★SID码注册不成功★★★", logger);
									print("{\"code\":\"1003\",\"message\":\"SID码注册失败\"}");// 添加失败
									return;
								}
								// 注册成功之后跳出循环
								break;
							}
						}

						//登录查询数据
						Map<String, Object> teaUs = teaUsService.teaLogin(keTeaUs);						
						//取得用户ID,插入设备管理表中
						keTeaUs.setTeacherId(teaUs.get("teacherId").toString());
						//查找是否有了学生的设备号
						String dev = teaUsService.selectDevice(keTeaUs);			
						if (CheckUtil.isNullOrEmpty(dev)) {
							//添加设备号，将设备号插入到数据库中
							teaUsService.addDevice(keTeaUs);
						}
						//将数据库查询出来的所有数据做成Json对象
						JSONObject teaObj = new JSONObject();
						teaObj.element("code", KeConstant.KE_SUCCESS);
						teaObj.element("teacherId", teaUs.get("teacherId").toString());
						teaObj.element("userName", teaUs.get("userName").toString());
						teaObj.element("cityCode", teaUs.get("cityCode").toString());
						teaObj.element("provinceCode", teaUs.get("provinceCode").toString());
						teaObj.element("grade", teaUs.get("grade").toString());
						teaObj.element("subjectType", teaUs.get("subjectType").toString());
						teaObj.element("headUrl", keTeaUs.getHeadUrl());
						print(teaObj);	
						printEndLog(KeConstant.KE_SUCCESS, teaObj.toString(), logger);
					} else {
						//用户注册失败
						print("{\"code\":\"1004\",\"message\":\"信息注册失败\"}");
						printErrorLog("信息注册失败", logger);
						return;
					}
				} else {
					//用户登录失败
					print("{\"code\":\"1001\",\"message\":\"手机号已被注册过\"}");
					printDebugLog("手机号已注册过", logger);
					return;
				}				
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 老师端登录
	 */
	public void login(){		
		try {
			printStartLog("loginTeaUs方法开始", logger);
			printParamsLog("请求参数。", logger);
			if(CheckUtil.isNullOrEmpty(keTeaUs.getDeviceId())){
				keTeaUs.setDeviceId("nodeviceid");
				printErrorLog("取不到deviceId", logger);
			}
			if (CheckUtil.checkNulls(
					keTeaUs.getPhoneNumber(), 
					keTeaUs.getPassword(),
					keTeaUs.getDeviceId(),
					keTeaUs.getDeviceType())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> reg = teaUsService.teaRegist(keTeaUs);
				if (reg == null) {
					// 登录失败
					print("{\"code\":\"1001\",\"message\":\"手机号还未注册\"}");
					printDebugLog("手机号还未注册", logger);
					return;
				} else {					
					//取得密码
					String password = reg.get("password").toString();
					if (keTeaUs.getPassword().equals(password)) {
						//七牛云下载头像
						String headKey = reg.get("head_url").toString();
						String url = KeCommon.getHeadUrlSign(headKey);
						//登录查询数据
						Map<String, Object> teaUs = teaUsService.teaLogin(keTeaUs);
						if (teaUs == null) {
							// 登录失败
							print("{\"code\":\"1002\",\"message\":\"登录失败\"}");
							printErrorLog("登录查询失败", logger);
							return;
						}else {
							//更新设备ID
							keTeaUs.setTeacherId(teaUs.get("teacherId").toString());
							keTeaUs.setFlag("1");
							//查找是否有了老师的设备号
							String dev = teaUsService.selectDevice(keTeaUs);			
							if (!CheckUtil.isNullOrEmpty(dev)) {
								//更新设备ID
								Integer dv = teaUsService.updateDevice(keTeaUs);
								if (dv > 0) {
									printEndLog(KeConstant.KE_SUCCESS, "更新设备ID成功", logger);
								} 
							}else {
								// 登录设备
								teaUsService.addDevice(keTeaUs);
								printDebugLog("插入设备信息成功", logger);
							}
							
							// TODO 前端改好后取消下面注释
//							// 判断是否首次批改
//							KeTeaSub keTeaSub = new KeTeaSub();
//							keTeaSub.setTeacherId(teaUs.get("teacherId").toString());
//							String firstSub = teaSubService.selFirstSub(keTeaSub);
//							
//							// 首次批改的时候
							String firstFlag = "0";
//							if("0".equals(firstSub)){
//								// 首次批改
//								firstFlag = "1";
//							}
							
							//将数据库查询出来的所有数据做成Json对象
							JSONObject teaObj = new JSONObject();
							teaObj.element("code", KeConstant.KE_SUCCESS);
							teaObj.element("teacherId", teaUs.get("teacherId").toString());
							teaObj.element("userName", teaUs.get("userName").toString());
							teaObj.element("cityCode", teaUs.get("cityCode").toString());
							teaObj.element("provinceCode", teaUs.get("provinceCode").toString());
							teaObj.element("grade", teaUs.get("grade").toString());
							teaObj.element("subjectType", teaUs.get("subjectType").toString());
							teaObj.element("headUrl", url);
							teaObj.element("firstFlag", firstFlag);
							print(teaObj);	
							printEndLog("用户上传结束返回值:", teaObj.toString(), logger);
						}
					}else {
						//输入密码错误
						print("{\"code\":\"1004\",\"message\":\"输入密码错误\"}");
						printDebugLog("输入密码错误", logger);
						return;
					}
				}
			} 
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}		
	}
	
	/**
	 * 用户注册发送验证码
	 */
	public void sendCodeS() {
		try {
			printStartLog("sendCodeS方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getPhoneNumber())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> user = teaUsService.teaRegist(keTeaUs);
				if (user == null) {
					
					// 验证码发送间隔少于60秒
					if(!SendCodeUtil.checkSendRcd(keTeaUs.getPhoneNumber(), commonService)){
						// 发送失败
						printDebugLog("验证码发送时间少于60秒", logger);
						print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
						printParamsJSON(logger);
						return;
					}
					
					//subMail短信服务验证码
					String sms = SendCodeUtil.random(4);
					keTeaUs.setVerifyCode(sms);
					boolean flag = SendCodeUtil.sendCode(keTeaUs.getPhoneNumber(),keTeaUs.getVerifyCode());
					if (flag) {
						//添加验证码
						teaUsService.addCode(keTeaUs);
						JSONObject json = new JSONObject();
						json.element("code", KeConstant.KE_SUCCESS);// 完善个人消息
						json.element("message", "获取成功");
						json.element("verifyCode", sms);
						print(json);// 验证码已发送
						printEndLog("验证码获取成功", json.toString(), logger);
					} else {
						// 发送失败
						print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
						printErrorLog("发送验证码失败", logger);
						return;
					}				
				} else {
					// 手机号已注册
					print("{\"code\":\"1002\",\"message\":\"手机号已注册过账号\"}");
					printDebugLog("手机号已注册过账号", logger);
					return;
				}				
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 用户重置密码发送验证码
	 */
	public void sendCodeRS() {
		try {
			printStartLog("sendCodeRS方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getPhoneNumber())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> user = teaUsService.teaRegist(keTeaUs);
				if (user == null) {
					print("{\"code\":\"1002\",\"message\":\"手机号还未注册\"}");
					printDebugLog("手机号还未注册", logger);
					return;
				} else {
					// 验证码发送间隔少于60秒
					if(!SendCodeUtil.checkSendRcd(keTeaUs.getPhoneNumber(), commonService)){
						// 发送失败
						printDebugLog("验证码发送时间少于60秒", logger);
						print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
						printParamsJSON(logger);
						return;
					}
					
					//subMail短信服务验证码
					String sms = SendCodeUtil.random(4);
					keTeaUs.setVerifyCode(sms);
					boolean flag = SendCodeUtil.sendCode(keTeaUs.getPhoneNumber(),keTeaUs.getVerifyCode());
					if (flag) {
						//添加验证码
						teaUsService.addCode(keTeaUs);
						JSONObject json = new JSONObject();
						json.element("code", KeConstant.KE_SUCCESS);// 完善个人消息
						json.element("message", "获取成功");
						json.element("verifyCode", sms);
						print(json);
						printEndLog("验证码获取成功！", json.toString(), logger);
					} else {
						// 发送失败
						print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
						printErrorLog("发送验证码失败", logger);
						return;
					}					
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 忘记密码
	 */
	public void forgerPassword(){
		try {
			printStartLog("forgerPassword方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getPhoneNumber(),
					keTeaUs.getPassword())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> reg = teaUsService.teaRegist(keTeaUs);		
				if (reg == null) {
					print("{\"code\":\"1002\",\"message\":\"用户还未注册\"}");
					printDebugLog("用户还未注册！", logger);
					return;
				}else{
					//重新设置密码
					Integer result = teaUsService.reSetPW(keTeaUs);
					if (result > 0) {
						print("{\"code\":\"1000\",\"message\":\"密码重置成功\"}");// 修改成功
						printEndLog(KeConstant.KE_SUCCESS, "密码重置成功！", logger);
					} else {
						// 登录失败
						print("{\"code\":\"1001\",\"message\":\"密码重置失败\"}");
						printErrorLog("密码重置失败！", logger);
						return;
					}
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * TODO 下个版本前端更新后调用此方法
	 * 用户上传头像取得授权
	 */
	public void getHeadTeaToken(){
		
		printStartLog("getHeadTeaToken方法开始", logger);
		printParamsLog("请求参数。", logger);
		if (CheckUtil.checkNulls(
				keTeaUs.getTeacherId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		} else {
			//取得上传头像用的key和token
			String upStr = KeCommon.getHeadUpKey(keTeaUs.getTeacherId());
			String[] headKey = upStr.split(KeConstant.DOUHAO);
			JSONObject obj = new JSONObject();
			obj.element("code", KeConstant.KE_SUCCESS);
			obj.element("message", "取得头像授权成功");
			obj.element("token", headKey[0]);
			obj.element("key", headKey[1]);
			print(obj);
			printEndLog(obj.toString(), "取得头像授权成功!", logger);
		}		
	}	
	
	/**
	 * TODO 下个版本前端更新后调用此方法
	 * 用户上传头像成功回调
	 */
	public void upHeadTeaOK(){
		try {
			printStartLog("upHeadTeaOK方法开始", logger);
			printParamsLog("请求参数。", logger);	
			if (CheckUtil.checkNulls(
					keTeaUs.getTeacherId(),
					keTeaUs.getHeadUrl())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//将图片地址key更新写入数据库当中
				Integer result = teaUsService.headUrlUpdate(keTeaUs);
				if (result > 0) {
					JSONObject obj = new JSONObject();
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("message", "修改成功");
					print(obj);
					printEndLog(obj.toString(), "修改头像成功!", logger);
				} else {
					// 登录失败
					print("{\"code\":\"1001\",\"message\":\"修改失败\"}");
					printErrorLog("头像修改失败", logger);
					return;
				}
			}
		} catch (Exception e) {
			//系统错误
			printSysErr(e, logger);
		}		
	}
	
	/**
	 * TODO 下个版本前端更新后可以删除
	 * 修改用户上传头像
	 */
	public void updateIcon() {
		try {
			printStartLog("updateIcon方法开始", logger);
			printParamsLog("请求参数。", logger);
			//七牛授权
			String token = "";
			//头像KEY
			String key = "";
			if (CheckUtil.checkNulls(
					keTeaUs.getTeacherId()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//将头像照片上传七牛云
				Auth auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
				token = auth.uploadToken(KeCommon.QINIU_BUCKET_HEADURL);
				key = createKey(keTeaUs.getTeacherId());
				//设置数据库要保存照片的key值
				keTeaUs.setHeadUrl(key);
				//将图片地址key更新写入数据库当中
				Integer result = teaUsService.headUrlUpdate(keTeaUs);
				if (result > 0) {
					JSONObject obj = new JSONObject();
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("message", "恭喜你换头像成功");
					obj.element("token", token);
					obj.element("key", key);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, "恭喜你换头像成功!", logger);
				} else {
					// 登录失败
					print("{\"code\":\"1001\",\"message\":\"头像修改失败\"}");
					printParamsJSON(logger);
					return;
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 老师信息修改
	 */
	public void updateInfo(){
		try {
			printStartLog("updateInfo方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getTeacherId(),
					keTeaUs.getUserName(),
					keTeaUs.getGrade(),
					keTeaUs.getSubjectType(),
					keTeaUs.getCityCode(),
					keTeaUs.getProvinceCode())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				keTeaUs.setPhoneNumber(keTeaUs.getTeacherId());
				//判断该用户是否已注册
				Map<String, Object> reg = teaUsService.teaRegist(keTeaUs);
				if (reg == null) {
					// 登录失败
					print("{\"code\":\"1002\",\"message\":\"信息不存在\"}");
					printErrorLog("用户信息不存在", logger);
					return;
				} else {					
					//数据更新
					Integer result = teaUsService.updateTeaInfo(keTeaUs);
					if (result > 0) {
						//强制把老师手上的任务还原为未批改状态
						Integer oldTask = teaUsService.coerceUpdate(keTeaUs);
						if (oldTask > 0) {
							printEndLog(KeConstant.KE_SUCCESS, "老师作业状态还原成功！", logger);			
						}
						//将数据库查询出来的所有数据做成Json对象
						JSONObject teaObj = new JSONObject();
						teaObj.element("code", KeConstant.KE_SUCCESS);
						teaObj.element("message", "信息修改成功");
						/*-------------不需要后台给前端返值---------------------------*/
						teaObj.element("teacherId", keTeaUs.getTeacherId());
						teaObj.element("userName", keTeaUs.getUserName());
						teaObj.element("cityCode", keTeaUs.getCityCode());
						teaObj.element("provinceCode", keTeaUs.getProvinceCode());
						teaObj.element("grade", keTeaUs.getGrade());
						teaObj.element("subjectType", keTeaUs.getSubjectType());
						/*-------------不需要后台给前端返值---------------------------*/
						print(teaObj);
						printEndLog(KeConstant.KE_SUCCESS, "老师信息修改成功！", logger);
					} else {
						// 登录失败
						print("{\"code\":\"1001\",\"message\":\"信息修改失败\"}");
						printDebugLog("信息修改失败", logger);
						return;
					}
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 老师批改作业 统计
	 * 
	 */
	public void statistics(){
		try {
			printStartLog("statistics方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getTeacherId())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//取得本月第一天
				keTeaUs.setFirstDofM(DateUtil.getFirstDayOfMonth(DateUtil.dateFormatYMD));
				//取得上月第一天
				Calendar cal = Calendar.getInstance();
				//格式:"yyyy-MM-dd HH:mm:ss"
				String strDateF = DateUtil.getFirstDayOfLastMoth(cal);
				keTeaUs.setFirstDoflastM(DateUtil.getStringByFormat(strDateF, DateUtil.dateFormatYMD));
				//取得上月最后一天
				//格式:"yyyy-MM-dd HH:mm:ss"
				String strDateL = DateUtil.getLastDayOfLastMoth(cal);
				keTeaUs.setLastDoflastM(DateUtil.getStringByFormat(strDateL, DateUtil.dateFormatYMD));
				
				String score = KeCommon.getScore(teaUsService,keTeaUs.getTeacherId());
				if (KeConstant.BASEPOINT.equals(score)) {
					score = KeConstant.HIGHPOINT;
				}			
				//取得当月的批改量
				String thisMC = teaUsService.thisMonthCnt(keTeaUs);
				//取得上月的批改量
				String lastMC = teaUsService.lastMonthCnt(keTeaUs);
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("message", "统计信息取得成功");
				obj.element("score", score);
				obj.element("currentMonth", thisMC);
				obj.element("lastMonth", lastMC);
				print(obj);
				printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
			}		
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * TODO 下个版本调用此方法
	 * 更新老师在线状态
	 * 在线状态(离线OFFLINE、在线ONLINE) 
	 * 
	 */
	public void onlineStatus(){
		printStartLog("onlineStatus方法开始", logger);
		printParamsLog("请求参数。", logger);
		if (CheckUtil.checkNulls(
				keTeaUs.getTeacherId(),
				keTeaUs.getActiveStatus(),
				keTeaUs.getAccStatus())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		try {
			// 更新离线在线状态
			boolean rst = updateStatus();
			if (!rst) {
				//数据库更新异常
				printErrorLog("更新老师在离线状态失败", logger);
			}
			
			// 老师离线，或者退出登录
			if("OFFLINE".equals(keTeaUs.getActiveStatus())){
				print("{\"code\":\"1000\",\"message\":\"更新老师在离线状态成功\"}");
				return;
			}
			
			Map<String, String> map = new HashMap<String, String>();
			KeNetease keNetease = new KeNetease();
			keNetease.setTeacherId(keTeaUs.getTeacherId());
			//0:前端云信未登录 
	    	if ("0".equals(keTeaUs.getAccStatus())) {
	    		//返回生成的云信ID和token
	    		map = getAccIdTea(neteaseService, keNetease);
	    		//返回前端值
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("message", "老师回来了");
				obj.element("accid", map.get("accid"));
				obj.element("token", map.get("token"));	
				print(obj);
				printEndLog("老师上线", obj.toString(), logger);
			}
				
			List<String> strUsDevice = new ArrayList<String>();			
			//取得当前的系统时间
			String sysTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMS);
			String currDay = sysTime.substring(8, 10);
			String currhour = sysTime.substring(11,13);
			//1，超时挂断、学生推送标记为0:未推送——>极光推送消息告诉学生们：老师上线了
			List<KeNetease> lstUser = neteaseService.selListRcd(keNetease);
			String us = "";
			String toTeaTime = "";
			String stuDevice = "";
			for (int i = 0; i < lstUser.size(); i++) {
				//取得所有超时未接通答疑的学生的id
				us = lstUser.get(i).getUserId();
				keNetease.setUserId(us);
				//取得发送消息通知老师的时间
				toTeaTime = lstUser.get(i).getToTeaTime();
				String dayTea = toTeaTime.substring(8, 10);
				//当天超过22:00后的不推送
				if (currDay.equals(dayTea) && Integer.parseInt(currhour) < 22) {						
					//取得学生对应的设备号
					stuDevice = neteaseService.selStuDevice(keNetease);
					//添加到极光推送里
					strUsDevice.add(stuDevice);
				}
			}
			//给未答疑成功的学生推送消息
			if (!CheckUtil.isNullOrEmpty(stuDevice)) {
				try {
					//推送消息到家长端
					boolean result1 = KeCommon.pushMsgToStu(strUsDevice, "老师现在回来了，你可以再次呼叫老师", "老师回来了");
					if(!result1){
						printErrorLog("超时自动挂断推送家长端消息失败", logger);
					}
				} catch (APIConnectionException  e1) {
					printSysErrServer(e1, logger);
				} catch (APIRequestException  e2) {
					printSysErrServer(e2, logger);
				}					
			}
			
			String upUs = "";
			//推送成功后更新推送消息状态
			for (int i = 0; i < lstUser.size(); i++) {
				//取得所有超时未接通答疑的学生的id
				upUs = lstUser.get(i).getUserId();
				keNetease.setUserId(upUs);					
				Integer sta = neteaseService.upMSGRcd(keNetease);
				if (sta > 0 ) {
					printDebugLog("给学生发送提醒成功", logger);
				}else {
					printErrorLog("给学生发送提醒失败", logger);
				}
			}
			print("{\"code\":\"1000\",\"message\":\"更新老师在离线状态成功\"}");
		} catch (Exception e) {
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErrServer(e, logger);
			return;
		}
	}
	
	/**
	 * TODO 安卓和IOS发布新版本后删除
	 * 更新老师在线离线状态
	 * 在线状态(离线OFFLINE、在线ONLINE) 
	 * 
	 */
	public void onlineOffline(){
		try {
			printStartLog("onlineOffline方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getTeacherId(),
					keTeaUs.getActiveStatus()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				
				// 更新离线在线状态
				boolean rst = updateStatus();
				if(rst){
					print("{\"code\":\"1000\"}");
				}else{
					print("{\"code\":\"1001\",\"message\":\"更新老师在离线状态失败\"}");
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	
	/**
	 * 更新用户离线或在线状态
	 * 
	 * @throws Exception
	 */
	private boolean updateStatus() throws Exception {
		
		keTeaUs.setPhoneNumber(keTeaUs.getTeacherId());
		
		//判断该用户是否已注册
		Map<String, Object> user = teaUsService.teaRegist(keTeaUs);
		if (user == null) {	
			
			// 登录失败
			printDebugLog("账户还未注册", logger);
			return false;
		}else {
			//更新老师在离线状态
			Integer actv = teaUsService.updateActive(keTeaUs);
			if (actv > 0) {
				//强制将老师批改中的作业还原
				if("OFFLINE".equals(keTeaUs.getActiveStatus())){
					Integer up = teaUsService.coerceUpdate(keTeaUs);
					if (up > 0) {
						printDebugLog("老师作业状态还原成功！", logger);
					}
				}
				// 更新成功
				printDebugLog("更新老师在离线状态成功！", logger);
				return true;
			} else {
				// 登录失败
				printErrorLog("更新老师在离线状态失败", logger);
				return false;
			}
		}
	}
	
	/**
	 * 同时在线批改作业教师数
	 */
	public void onlineCount(){
		try {
			printStartLog("onlineCount方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keTeaUs.getTeacherId())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				KeTeaSub keTeaSub = new KeTeaSub();
				keTeaSub.setTeacherId(keTeaUs.getTeacherId());
				//如果老师还没登录，则查找固定的用户上传作业数
				if ("nil".equals(keTeaUs.getTeacherId())) {
					keTeaUs.setOrgId("");
				}else {
					
		    		//取得批改作业老师的组织
		    		String orgId = teaSubService.getOrgId(keTeaSub);
		    		if(CheckUtil.isNullOrEmpty(orgId)){
						print("{\"code\":\"1001\",\"message\":\"系统错误\"}");
						printDebugLog("老师不存在", logger);
						return;
		    		}
		    		keTeaSub.setOrgId(orgId);
		    		keTeaUs.setOrgId(orgId);
		    		
//					//取得批改作业老师的类型
//					keTeaSub.setTeacherId(keTeaUs.getTeacherId());
//		    		String tp = teaSubService.getType(keTeaSub);
//		    		keTeaUs.setType(tp);
				}
				
				//查询在线老师数和作业份数
				String teaCnt = teaUsService.teaActive(keTeaUs);
				String taskCnt = teaUsService.taskActive(keTeaUs);	
				if ("nil".equals(keTeaUs.getTeacherId())) {
					//返回给前端信息
					JSONObject obj = new JSONObject();
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("onlineCount", teaCnt);
					obj.element("taskCount", taskCnt);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
					return;
				}
				//取得返回前端的老师的基本信息
				keTeaUs.setPhoneNumber(keTeaUs.getTeacherId());
				Map<String, Object> info = teaUsService.teaRegist(keTeaUs);
				if (info == null) {
					// 登录失败
					print("{\"code\":\"1002\",\"message\":\"查询老师信息失败\"}");
					printErrorLog("查询失败", logger);
					return;
				}else {
					//七牛云下载头像
					String headKey = info.get("head_url").toString();
					String url = KeCommon.getHeadUrlSign(headKey);
					//将数据库查询出来的所有数据做成Json对象
					JSONObject teaInfo = new JSONObject();
					teaInfo.element("code", KeConstant.KE_SUCCESS);
					teaInfo.element("teacherId", info.get("teacher_id").toString());
					teaInfo.element("userName", info.get("teacher_name").toString());
					teaInfo.element("cityCode", info.get("city_code").toString());
					teaInfo.element("provinceCode", info.get("province_code").toString());
					teaInfo.element("grade", info.get("grade").toString());
					teaInfo.element("subjectType", info.get("subject_id").toString());
					teaInfo.element("headUrl", url);
					//当前在线老师数
					teaInfo.element("onlineCount", teaCnt);
					//当前在线作业份数
					teaInfo.element("taskCount", taskCnt);
					print(teaInfo);	
					printEndLog(KeConstant.KE_SUCCESS, teaInfo.toString(), logger);
				}
				
				// 更新在线状态
				keTeaUs.setActiveStatus("ONLINE");
				updateStatus();
				
				
				// TODO
//				//查询当前抓取作业超过10分钟的就自动退回
//				List<KeTeaSub> correctingList = teaSubService.getTenMin();
//				if(correctingList.size() >0 ){
//					//将抓取的超过10分钟的作业退回
//					for (KeTeaSub sub : correctingList) {
//						Integer res = teaSubService.giveUpTask(sub);
//						if(res == 0){
//							print("{\"code\":\"1001\",\"message\":\"找不到对应的作业\"}");
//							printErrorLog("找不到对应的作业", logger);
//							return;
//						}
//					}					
//				}
				
//				//查询未批改的作业达到10分钟时，或者作业量超过在线老师数时提醒管理员
//				int tips = Integer.parseInt(taskCnt) - Integer.parseInt(teaCnt);
//				String uncorrectedCnt = teaSubService.getTwentyMin();
//				if (!"0".equals(uncorrectedCnt) || tips > 0) {
//					//推送消息通知管理员
//					List<String> strDevices = new ArrayList<String>();
//					//设置查询所需要的参数
//					keTeaUs.setTeacherId("18702103770");
//					keTeaUs.setFlag("1");
//					//取得管理员的设备ID
//					String adminId = teaUsService.selectDevice(keTeaUs);
//					strDevices.add(adminId);
//					boolean result = KeCommon.pushMsgToTea(strDevices, "现在作业爆了,赶紧调整", "赶紧去改作业");
//					if(!result){
//						printErrorLog("给管理员推送消息失败", logger);
//					}
//					printDebugLog("同时在线批改作业教师数取得成功！", logger);
//				}
			}			
		} catch (APIConnectionException  e1) {
			print("{\"code\":\"1000\"}");
			printSysErrServer(e1, logger);
			return;
		} catch (APIRequestException  e2) {
			print("{\"code\":\"1000\"}");
			printSysErrServer(e2, logger);
			return;
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErrServer(e, logger);
			return;
		}
	}
	
	/**
     * 上传教师资格证照片成功，插入数据到DB
     * @param CertificateUrl:前端传来的key值
     */
    public void uploadCerOK(){
    	
    	printStartLog("方法开始uploadCerOK", logger);
    	printParamsLog("用户上传图片参数:", logger);    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaUs.getTeacherId(), 
				keTeaUs.getCertificateUrl())) {	
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		try {
			//设置状态为新注册
			keTeaUs.setApproveStatus("NEW");
			// 上传资格证情报更新
			teaUsService.updateCer(keTeaUs);	
			print("{\"code\":\"1000\",\"message\":\"上传成功\"}");
			printEndLog(KeConstant.KE_SUCCESS, "上传教师资格证照片成功,插入数据到DB成功！", logger);
		} catch (Exception e) {
			//服务器内部错误
			printSysErr(e, logger);
			return;
		}		
    }
    
    /**
     * 查询老师改过作业的学生的List
     * 
     */
    public void stuList() {
    	
    	printStartLog("方法开始stuList", logger);
    	printParamsLog("请求学生列表List参数:", logger);    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaUs.getTeacherId())) {	
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"输入参数为空或不正确\"}");
			return;
		}
		
		try {
			//取得学生列表
			List<Map<String,Object>> stu = teaUsService.getStuList(keTeaUs);
			//设置头像Url
			List<Map<String,Object>> stuNew = new ArrayList<Map<String,Object>>();
			if (stu == null) {
				print("{\"code\":\"1001\",\"message\":\"老师还未批改过学生的作业\"}");
				printDebugLog("老师还未批改过任何学生的作业", logger);
				return;
			}
			//初始化
			String userId = "";
			String userName = "";
			String headKey = "";			
			String url = "";
        	for (Map<String,Object> head : stu) {
        		//作成新的map值
        		Map<String,Object> mapNew = new HashMap<String,Object>();
        		userId = head.get("userId").toString();
        		userName = head.get("userName").toString();
        		//七牛云下载头像
        		headKey = head.get("headUrl").toString();
        		if (isHttpUrl(headKey) || "kerkr999".equals(headKey)) {
        			//头像未上传过七牛云
        			url = headKey;
        		} else {
        			//头像重新上传过七牛云
        			url = KeCommon.getHeadUrlSign(headKey);
        		}
        		//设置头像地址
        		mapNew.put("userId", userId);
        		mapNew.put("userName", userName);
        		mapNew.put("headUrl", url);
        		
        		//重新放入新的List
        		stuNew.add(mapNew);
			}        	
			//
		 	JSONArray stuArray = JSONArray.fromObject(stuNew);
		 	JSONObject json = new JSONObject();
		 	json.element("code", KeConstant.KE_SUCCESS);
		 	json.element("message", "取得学生列表成功");
		 	json.element("result", stuArray);
			print(json);
			printEndLog("查询学生列表结束返回值:", json.toString(), logger);
			
	    } catch (Exception e) {
			//服务器内部错误
			printSysErr(e, logger);
			return;
		}	
    }
    
	/**
     * 教师证用的创建七牛存储key
     * @param userId 用户ID
     * @return 七牛存储key-->保存在数据库的certificate_url字段里
     */
    private String createKey(String userId){
    	String str = DateUtil.getOrderId();
        StringBuilder key = new StringBuilder();
        key.append(userId);
        key.append(KeConstant.DELIMITER);
        key.append(str);
        return key.toString();
    }	
	
    /**
     * 老师端取得生成的云信ID和token
     */
    private Map<String, String> getAccIdTea(NeteaseService neteaseService,KeNetease keNetease){
    	
    	printStartLog("方法开始getAccIdTea", logger);
    	printParamsLog("获取云信ID参数:", logger);
		// 参数验证
		if (CheckUtil.checkNulls(
				keNetease.getTeacherId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return null;
		}
		
		try {
			Map<String, String> map = new HashMap<String, String>();
			//取出用户的Accid和token,判断用户是否注册过云信id
			Map<String, Object> accTea = neteaseService.TeaRegist(keNetease);
			if (accTea == null) {
				KeTeaUs keTeaUs = new KeTeaUs();
				keTeaUs.setPhoneNumber(keNetease.getTeacherId());
				
				// 云信ID
				String systemTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS);
				String accId = "t" + systemTime;
				keNetease.setYunxinId(accId);
				
				//取得云信id和token
				String token = KeCommon.createAccid(accId);
				keNetease.setYunxinToken(token);
				//将云信数据插入DB
				Integer result = neteaseService.addTeaYunxin(keNetease);
				if (result > 0) {
					//返回登录云信用信息
					map.put("accid", accId);
					map.put("token", token);
					printDebugLog("请求云信的返回值:", logger);
				}
			}else{
				//返回登录云信用信息
				map.put("accid", accTea.get("yunxin_id").toString());
				map.put("token", accTea.get("yunxin_token").toString());
				printDebugLog("请求云信的返回值:", logger);
			}
			//返回云信用信息
			return map;
		} catch (Exception e) {
			printSysErr(e, logger);
			return null;
		}		
    }
    
    /**
     * 判断学生头像key是否为URL
     * @param urls 用户头像key
     * @return true:是URL、false:不是URL
     */
	public static boolean isHttpUrl(String urls) {
		boolean isurl = false;
		Pattern pat = Pattern.compile(KeConstant.regex.trim());
		Matcher mat = pat.matcher(urls.trim());
		isurl = mat.matches();
		if (isurl) {
			isurl = true;
		}
		return isurl;
	}
}
