package com.bayan.keke.action;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.CommonService;
import com.bayan.keke.service.FeedbackService;
import com.bayan.keke.service.SalesService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeSales;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SalesAction extends BaseAction implements
	ModelDriven<KeSales>, Preparable{

	/* */
	private static final long serialVersionUID = -2630800740556018819L;
	//输出日志
	private static final Logger logger = Logger.getLogger(SalesAction.class);
	//
	private KeSales keSales;
	@Resource
	private SalesService salesService;
	@Resource
	private FeedbackService feedbackService;
	@Resource
	private CommonService commonService;
    
	@Override
	public void prepare() throws Exception {	
		keSales = new KeSales();
	}
	@Override
	public KeSales getModel() {
		return keSales;
	}
	
	/**
	 * 营销老师快速注册入口
	 */
	public String addFast(){
		try {
			printStartLog("add方法开始", logger);
			printParamsLog("请求参数。", logger);
			//设置参数作为首次注册的时候的信息
			keSales.setUserName("课课推广");
			//设置密码为6位随机数,登录进去之后可以修改
			keSales.setPassword(String.valueOf(KeCommon.createRandom(6)));
			//一年级
			keSales.setGrade("01");
			//语文老师
			keSales.setSubjectType("01");
			//大陆
			keSales.setCityCode("910100");
			//中国
			keSales.setProvinceCode("910000");
			if (CheckUtil.checkNulls(
					keSales.getPhoneNumber()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\"}");
				return "error";
			} 
			
			// 判断该用户是否已注册
			Map<String, Object> reg = salesService.salRegist(keSales);
			if (reg == null) {
				// 设置注册老师类型为：2营销老师
				keSales.setType("2");
				// 优惠码对应金额,第一次注册：50元,往后跟据老师的推广效益来改变优惠码的金额
				keSales.setMoney("30");
				// 优惠使用次数限制：10000次
				keSales.setCount("500");
				
				// 将用户密码MD5加密
				String pwdOld = keSales.getPassword();
				String pwdMd5 = DigestUtils.md5Hex(pwdOld.getBytes());
				keSales.setPassword(pwdMd5);
				
				// 将营销老师信息注册
				Integer result = salesService.salAdd(keSales);
				if (result > 0) {
					// 注册成功后,生成一个SID,判断是否存在，如果存在重新生成一个。循环10次都重复的话，报错误提示
					// 10000个以内基本不会重复
					for (int j = 0; j < 11; j++) {

						// 10次都有重复，系统错误
						if (j == 10) {
							printErrorLog("★★★SID生成有错★★★", logger);
							return "error";
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
								return "error";
							}
							// 注册成功之后跳出循环
							break;
						}
					}

					// 登录查询数据
					Map<String, Object> sal = salesService.salLogin(keSales);
					getSession().setAttribute("userId", sal.get("teacherId").toString());
					getSession().setAttribute("userName", sal.get("userName").toString());
					return "index";
				} else {
					// 用户注册失败
					return "register";
				}
			} else {
				// 用户登录失败
				return "register";
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return "error";
		}
	}
	
	
	/**
	 * 营销老师注册
	 */
	public String add() {
		try {
			printStartLog("add方法开始", logger);	
			printParamsLog("请求参数。", logger);
			//设置参数作为首次注册的时候的信息
			//keSales.setUserName("课课推广");
			//一年级
			keSales.setGrade("01");
			//语文老师
			keSales.setSubjectType("01");
			//大陆
			keSales.setCityCode("910100");
			//中国
			keSales.setProvinceCode("910000");
			if (CheckUtil.checkNulls(
					keSales.getPhoneNumber(),
					keSales.getPassword(),
					keSales.getUserName(),
					keSales.getGrade(),
					keSales.getSubjectType(),
					keSales.getCityCode(),
					keSales.getProvinceCode())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\"}");
				return "error";
			} 
			
			// 判断该用户是否已注册
			Map<String, Object> reg = salesService.salRegist(keSales);
			if (reg == null) {
				// 设置注册老师类型为：2营销老师
				keSales.setType("2");
				// 优惠码对应金额,第一次注册：50元,往后跟据老师的推广效益来改变优惠码的金额
				keSales.setMoney("30");
				// 优惠使用次数限制：10000次
				keSales.setCount("500");
				keSales.setSex("1");
				keSales.setHeadUrl("keke999");
				keSales.setActiveStatus("OFFLINE");
				keSales.setApproveStatus("UNAPPROVED");
				
				// 将营销老师信息注册
				Integer result = salesService.salAdd(keSales);
				if (result > 0) {
					// 注册成功后,生成一个SID,判断是否存在，如果存在重新生成一个。循环10次都重复的话，报错误提示
					// 10000个以内基本不会重复
					for (int j = 0; j < 11; j++) {

						// 10次都有重复，系统错误
						if (j == 10) {
							printErrorLog("★★★SID生成有错★★★", logger);
							return "error";
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
								return "error";
							}
							// 注册成功之后跳出循环
							break;
						}
					}

					// 登录查询数据
					Map<String, Object> sal = salesService.salLogin(keSales);
					getSession().setAttribute("userId", sal.get("teacherId").toString());
					getSession().setAttribute("userName", sal.get("userName").toString());
					getSession().setAttribute("cityCode", sal.get("cityCode").toString());
					getSession().setAttribute("provinceCode", sal.get("provinceCode").toString());
					getSession().setAttribute("grade", sal.get("grade").toString());
					getSession().setAttribute("subjectType", sal.get("subjectType").toString());
					return "index";
				} else {
					// 用户注册失败
					return "register";
				}
			} else {
				// 用户登录失败
				return "register";
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return "error";
		}
	}
	
	/**
	 * 老师端登录
	 */
	public String login(){		
		try {
			printStartLog("login方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keSales.getPhoneNumber(), 
					keSales.getPassword())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				return "error";
			} else {
				
				//判断该用户是否已注册
				Map<String, Object> reg = salesService.salRegist(keSales);		
				if (reg == null) {
					// 登录失败
					printErrorLog("用户还未注册", logger);
					getRequest().setAttribute("msg", "用户还未注册");
					return "login";
				} else {					
					//取得密码
					String password = reg.get("password").toString();
					if (keSales.getPassword().equals(password)) {
						//登录查询数据
						Map<String, Object> sal = salesService.salLogin(keSales);
						if (sal == null) {
							// 登录失败
							printErrorLog("传入的参数为空值,请参考参数日志", logger);
							return "error";
						}else {							
							printDebugLog("获取老师信息", logger);
							getSession().setAttribute("userId", sal.get("teacherId").toString());
							getSession().setAttribute("userName", sal.get("userName").toString());
							getSession().setAttribute("cityCode", sal.get("cityCode").toString());
							getSession().setAttribute("provinceCode", sal.get("provinceCode").toString());
							getSession().setAttribute("grade", sal.get("grade").toString());
							getSession().setAttribute("subjectType", sal.get("subjectType").toString());
							getSession().setAttribute("userFlag", "0");//用户标记0:老师1:推广机构
						}						
						return "index";
					}else {
						//输入密码错误
						getRequest().setAttribute("msg", "密码不正确");
						return "login";
					}
				}
			} 
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return "error";
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
					keSales.getPhoneNumber()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> user = salesService.salRegist(keSales);
				if (user == null) {					
					// 验证码发送间隔少于60秒
					if(!SendCodeUtil.checkSendRcd(keSales.getPhoneNumber(), commonService)){
						// 发送失败
						printDebugLog("验证码发送时间少于60秒", logger);
						print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
						printParamsJSON(logger);
						return;
					}
					
					//subMail短信服务验证码
					String sms = SendCodeUtil.random(4);
					keSales.setVerifyCode(sms);
					boolean flag = SendCodeUtil.sendCode(keSales.getPhoneNumber(),keSales.getVerifyCode());
					if (flag) {
						//添加验证码
						salesService.addCode(keSales);
						JSONObject json = new JSONObject();
						json.element("code", KeConstant.KE_SUCCESS);// 完善个人消息
						//json.element("message", "欢迎新用户注册");
						json.element("verifyCode", sms);
						print(json);// 验证码已发送
						printEndLog("欢迎新用户注册", json.toString(), logger);
					} else {
						// 发送失败
						print("{\"code\":\"1001\"}");
						printParamsJSON(logger);
						return;
					}				
				} else {
					// 手机号已注册
					print("{\"code\":\"1002\"}");
					printParamsJSON(logger);
					return;
				}				
			}
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\"}");
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
					keSales.getPhoneNumber()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> user = salesService.salRegist(keSales);
				if (user == null) {
					print("{\"code\":\"1002\",\"message\":\"手机号还未注册\"}");
					printDebugLog("手机号还未注册", logger);
					return;
				} else {
					// 验证码发送间隔少于60秒
					if(!SendCodeUtil.checkSendRcd(keSales.getPhoneNumber(), commonService)){
						// 发送失败
						printDebugLog("验证码发送时间少于60秒", logger);
						print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
						printParamsJSON(logger);
						return;
					}
					
					//subMail短信服务验证码
					String sms = SendCodeUtil.random(4);
					keSales.setVerifyCode(sms);
					boolean flag = SendCodeUtil.sendCode(keSales.getPhoneNumber(),keSales.getVerifyCode());
					if (flag) {
						//添加验证码
						salesService.addCode(keSales);
						JSONObject json = new JSONObject();
						json.element("code", KeConstant.KE_SUCCESS);// 完善个人消息
						json.element("message", "重置密码成功");
						json.element("verifyCode", sms);
						print(json);
						printEndLog("恭喜您重置密码成功！", json.toString(), logger);
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
	public void updatePW(){
		try {
			printStartLog("updatePW方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keSales.getPhoneNumber(),
					keSales.getPassword())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//判断该用户是否已注册
				Map<String, Object> reg = salesService.salRegist(keSales);	
				if (reg == null) {
					print("{\"code\":\"1001\",\"message\":\"手机号还未注册\"}");
					printDebugLog("手机号还未注册", logger);
					return;
				}else{
					//重新设置密码
					Integer result = salesService.reSetPW(keSales);
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
	 * 老师信息修改
	 */
	public void updateInfo(){
		try {
			printStartLog("updateInfo方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keSales.getTeacherId(),
					keSales.getGrade(),
					keSales.getSubjectType(),
					keSales.getCityCode(),
					keSales.getProvinceCode())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//数据更新
				Integer result = salesService.updateSalInfo(keSales);
				if (result > 0) {						
					getSession().setAttribute("cityCode", keSales.getCityCode());
					getSession().setAttribute("provinceCode", keSales.getProvinceCode());
					getSession().setAttribute("grade", keSales.getGrade());
					getSession().setAttribute("subjectType", keSales.getSubjectType());
					
					//将数据库查询出来的所有数据做成Json对象
					JSONObject teaObj = new JSONObject();
					teaObj.element("code", KeConstant.KE_SUCCESS);
					teaObj.element("message", "信息修改成功");						
					print(teaObj);
					printEndLog(KeConstant.KE_SUCCESS, "老师信息修改成功！", logger);
				} else {
					// 登录失败
					print("{\"code\":\"1001\",\"message\":\"信息修改失败\"}");
					printErrorLog("老师信息修改失败", logger);
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
	 * 取得省List
	 * 
	 */
	public void listProvince() {
		try {
			String proN = "";
			String proC = "";
			List<String> lst = new ArrayList<>();
			List<KeSales> list = salesService.listProvince();
			for (KeSales keSales : list) {
				proN = keSales.getProvince();
				proC = keSales.getProvinceCode();
				lst.add(proN);
				lst.add(proC);
			}
			JSONArray json = JSONArray.fromObject(lst);
			print(json.toString());
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}

	/**
	 * 取得市List
	 * 
	 */
	public void listCity() {
		try {
			printStartLog("listCity方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keSales.getCityCode()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				String ctyN = "";
				String ctyC = "";
				List<String> lst = new ArrayList<>();
				List<KeSales> list = salesService.listCity(keSales.getCityCode());
				for (KeSales keSales : list) {
					ctyN = keSales.getCity();
					ctyC = keSales.getCityCode();
					lst.add(ctyN);
					lst.add(ctyC);
				}
				JSONArray json = JSONArray.fromObject(lst);
				print(json.toString());
			}
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 查询学生端问题反馈
	 */
	public void feedbackList() {
		try {
				printStartLog("addContent方法开始", logger);
				printParamsLog("请求参数。", logger);
				//反馈信息的类型(0:课主任反馈,1:老师反馈,2:低评分的原因反馈) .
				keSales.setFeedType("0");
				if (CheckUtil.checkNulls(
						keSales.getFeedType()
						)) {
					printErrorLog("传入的参数为空值,请参考参数日志", logger);
					print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
					return;
				}
				
				int start = (getPage() - 1) * getRows();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("page", start);
				map.put("size", getRows());
				map.put("type", keSales.getFeedType());
				
				// 查询反馈信息总数
				String rstStr = feedbackService.countFb();
				Integer rst = Integer.parseInt(rstStr);
				//将反馈信息取出传递到画面显示
				List<Map<String, Object>> result = feedbackService.feedbackLst(map);
				if (result.size() > 0) {
				
				// 返回结果
				JSONArray jsonList = JSONArray.fromObject(result);
				JSONObject json = new JSONObject();
				json.element("code", KeConstant.KE_SUCCESS);
				//total,rows返回到画面固定字段名
				json.element("total", rst);
				json.element("rows", jsonList.toString());
				print(json);
				
				// 请求结束log
				printEndLog("查询反馈信息结束返回值:", json.toString(), logger);
			}else {
				//用户注册失败
				print("{\"code\":\"1001\"}");// 添加失败
				printErrorLog("取得反馈信息值失败", logger);
				return;
			}
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 注册页面跳转
	 * 
	 * @return
	 */
	public String toregister() {
		return "register";

	}
	
	/**
	 * 忘记密码页面跳转
	 * @return
	 */
	public String toupd(){
		return "upd";
	}
	
	/**
	 * 修改密码页面跳转
	 * @return
	 */
	public String toinupdate(){
		return "inupdate";
	}
	
	/**
	 * 反馈页面跳转
	 * @return
	 */
	public String toFeedback(){
		return "feedback";
	}
	
	/**
	 * 修改资料页面跳转
	 * @return
	 */
	public String toupdate(){
		return "update";
	}
}
