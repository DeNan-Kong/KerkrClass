package com.bayan.keke.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.alipay.config.AlipayConfig;
import com.alipay.config.WxSignature;
import com.alipay.sign.RSA;
import com.alipay.util.AlipayNotify;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.SalesService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KeRecord;
import com.bayan.keke.vo.KeSales;
import com.bayan.keke.vo.KeTeaOutputRcd;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class PayAction extends BaseAction implements ModelDriven<KePay>,
		Preparable {
	/* */
	private static final long serialVersionUID = 7178649661289229295L;
	//输出日志
	private static final Logger logger = Logger.getLogger(PayAction.class);
	
	/* */
	@Resource
	private PayService payService;
	@Resource
	private SalesService salesService;
	/* */
	private KePay kePay;
	/* */
	public KePay getModel() {
		return kePay;
	}	
	/* */
	public void prepare() throws Exception {
		kePay = new KePay();
	}
	
	/**
	 * 查询当前的油量情况
	 * 每次点开加油站都会触发请求该接口
	 * 
	 */
	public void openOil(){
		JSONObject opn = new JSONObject();
		//展开功能的参数值
		String opnId = "0";
		if ("0".equals(opnId)) {
			opn.element("message", "可以展开加油站页面功能");
		}else if ("1".equals(opnId)) {
			opn.element("message", "工程师正在努力开发");
		}
		opn.element("openid", opnId);
		opn.element("code", KeConstant.KE_SUCCESS);
		print(opn);
		printEndLog(KeConstant.KE_SUCCESS, opn.toString(), logger);		
	}
	/**
	 * 查询当前的油量情况
	 * 每次点开加油站都会触发请求该接口
	 * 
	 */
	public void selectOil(){
		try {
			printStartLog("selectOil方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePay.getUserId()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//检查用户是否有充值过
				Map<String, Object> user = payService.selectOil(kePay);
				if (user == null) {	
					//未充值时，显示0L
					JSONObject obj = new JSONObject();
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("remainOil", "0");
					obj.element("count", "0");
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
				}else {
					//查看当前剩余油量
					String nowOil = payService.remainCntOil(kePay);
					//查看最近一次添加后的总油量
					String cntOil = payService.countOil(kePay);						
					JSONObject obj = new JSONObject();
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("remainOil", nowOil);
					obj.element("count", cntOil);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
				}
			} 
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
		}		
	}
	
	/**
	 * 学生端简单优惠验证
	 * 1:学生使用过之后不能再次使用相同的优惠码
	 * 2:在充值油量成功的时候将优惠码的使用次数+1
	 * 3:判断如果使用次数超过1次则不可以再次使用该优惠码
	 */
	public void sidCheck(){		
		try {
				printStartLog("sidCheck方法开始", logger);
				printParamsLog("学生端简单优惠验证参数:", logger);
				if (CheckUtil.checkNulls(
						kePay.getSIDCode(),
						kePay.getUserId()
						)) {
					printErrorLog("传入的参数为空值,请参考参数日志", logger);
					print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
					return;
			} else {
					//判断输入的优惠码属性SID\FID
					int len = kePay.getSIDCode().length();
					if (len > 20) {
						print("{\"code\":\"1001\",\"message\":\"优惠码无效\"}");
						printParamsJSON(logger);
						return;
	        		}
					
					KeSales keSales = new KeSales();
					keSales.setSIDCode(kePay.getSIDCode());
					keSales.setUserId(kePay.getUserId());
					//SID码
					if (len == 6) {
						//优惠码
						keSales.setCodeType("1");
						//判断优惠码在ke_code码表里是否存在
						String sal = salesService.salSid(keSales);

						//六一儿童节活动时展开
						/*String sysDate = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
						if("2016-06-01".equals(sysDate)){
							//取得家长充值记录表的数据，有数据说明家长使用该号码充值过，没有时是第一次使用
							String sixOneNormal = salesService.getSixOneSid(keSales);
							printDebugLog("文字优惠码：" + sal, logger);
							//判断口令是否被同一个用户使用过
							if(!CheckUtil.isNullOrEmpty(sixOneNormal)){
								// 登录失败
								printDebugLog("优惠码重复使用", logger);
								print("{\"code\":\"1001\",\"message\":\"今天你已经用过一次啦\"}");
								printParamsJSON(logger);
								return;
							}							
						}*/
						//输入不存在的优惠码
						if (CheckUtil.isNullOrEmpty(sal)) {
							// 登录失败
							printDebugLog("优惠码不存在", logger);
							print("{\"code\":\"1001\",\"message\":\"优惠码无效\"}");
							printParamsJSON(logger);
							return;
						}else {
							//优惠码验证成功
							printEndLog(KeConstant.KE_SUCCESS, "优惠码验证成功", logger);
							//将金额格式转为整数
							int salInt = Double.valueOf(sal).intValue();
							//将数据库查询出来的所有数据做成Json对象
							JSONObject teaObj = new JSONObject();
							teaObj.element("code", KeConstant.KE_SUCCESS);
							teaObj.element("money", salInt);
							teaObj.element("sidFid", "0");//SID标记
							print(teaObj);	
							printEndLog(KeConstant.KE_SUCCESS, teaObj.toString(), logger);	
						}
					}
					//FID码
					else if(len == 16) {
						//免费码
						keSales.setCodeType("0");
						//判断优惠码在ke_code码表里是否存在
						String sal = salesService.getSid(keSales);		
						if (sal == null) {
							// 登录失败
							printDebugLog("免费码无效", logger);
							print("{\"code\":\"1001\",\"message\":\"兑换码无效\"}");
							printParamsJSON(logger);
							return;
						} else {
							//判断该免费码是否使用过
							String fidc = salesService.fidRegist(keSales);
							//未使用过
							if(CheckUtil.isNullOrEmpty(fidc)){
								print("{\"code\":\"1001\",\"message\":\"兑换码已经被使用过啦\"}");
								printParamsJSON(logger);
								return;
							}else{
								
								// 充值油量取整
								Double oil = Double.parseDouble(sal);
								String inputOil = String.valueOf(oil.intValue());
								
								//优惠码验证成功
								printEndLog(KeConstant.KE_SUCCESS, "兑换码验证成功", logger);
								//将数据库查询出来的所有数据做成Json对象
								JSONObject teaObj = new JSONObject();
								teaObj.element("code", KeConstant.KE_SUCCESS);
								teaObj.element("message", inputOil+"L兑换码有效");
								teaObj.element("sidFid", "1");//FID标记
								teaObj.element("inputOil", inputOil);//FID对应油量
								print(teaObj);	
								printEndLog(KeConstant.KE_SUCCESS, teaObj.toString(), logger);
							}
						}
					}else {
						/*//判断优惠码在ke_code码表里是否存在
						String sal = salesService.salSid(keSales);
						//取得家长充值记录表的数据，有数据说明家长使用该号码充值过，没有时是第一次使用
						String sixOne = salesService.getSixOneSid(keSales);
						printDebugLog("文字优惠码11111：" + sal, logger);
						//判断口令是否正确
						if(!"课课你好".equals(keSales.getSIDCode())){
							// 登录失败
							printDebugLog("优惠码不存在", logger);
							print("{\"code\":\"1001\",\"message\":\"口令不对哦\"}");
							printParamsJSON(logger);
							return;
						}
						//判断口令是否被同一个用户使用过
						if(!CheckUtil.isNullOrEmpty(sixOne)){
							// 登录失败
							printDebugLog("活动口令重复使用", logger);
							print("{\"code\":\"1001\",\"message\":\"你已经用过啦\"}");
							printParamsJSON(logger);
							return;
						}
						//非六一儿童节输入
						if (CheckUtil.isNullOrEmpty(sal)) {
							// 登录失败
							printDebugLog("优惠码不存在", logger);
							print("{\"code\":\"1001\",\"message\":\"儿童节再来么么哒\"}");
							printParamsJSON(logger);
							return;
						}else {
							//优惠码验证成功
							printEndLog(KeConstant.KE_SUCCESS, "优惠码验证成功", logger);
							//将数据库查询出来的所有数据做成Json对象
							JSONObject teaObj = new JSONObject();
							teaObj.element("code", KeConstant.KE_SUCCESS);
							teaObj.element("money", sal);
							print(teaObj);	
							printEndLog(KeConstant.KE_SUCCESS, teaObj.toString(), logger);	
						}*/
						printDebugLog("优惠码不存在", logger);
						print("{\"code\":\"1001\",\"message\":\"优惠码不存在\"}");
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
	 * 更新油量数据
	 * 1,如果第一次充值就直接添加进去
	 * 2,剩余的油量=剩下的油量+新充值的
	 */
	/*public void updateOil(){
		try {
			printStartLog("updateOil方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePay.getUserId(),
					kePay.getPayType(),
					kePay.getPayMoney()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}else {
				//充值类型计算30L,90L,180L
				if ("01".equals(kePay.getPayType())) {
					kePay.setInputOil("30");
				}else if("02".equals(kePay.getPayType())){
					kePay.setInputOil("90");				
				}else if("03".equals(kePay.getPayType())){
					kePay.setInputOil("180");			
				}
				else {
					print("{\"code\":\"1001\",\"message\":\"选择的购买类型不正确\"}");// 添加失败
					printErrorLog("选择的购买类型不正确！", logger);
				}
				//检查用户是否有充值过
				Map<String, Object> user = payService.selectOil(kePay);
				if (user == null) {
					//首次充值，加入一条数据
					Integer oil = payService.add(kePay);
					if (oil > 0) {
						//查看剩余油量
						String cntOil = payService.remainCntOil(kePay);						
						kePay.setRemainOil(cntOil);
						JSONObject obj = new JSONObject();
						obj.element("code", KeConstant.KE_SUCCESS);
						obj.element("remainOil", cntOil);
						//第一次充值,当前油量跟剩余油量一致
						obj.element("count", cntOil);
						print(obj);
						printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
					}else {
						//用户注册失败
						print("{\"code\":\"1001\",\"message\":\"购买油量失败\"}");// 添加失败
						printParamsJSON(logger);
					}
				}else {
					//查看当前剩余油量(充值前)
					String befCntOil = payService.remainCntOil(kePay);
					int count =  Integer.parseInt(befCntOil)+Integer.parseInt(kePay.getInputOil());
					kePay.setRemainOil(String.valueOf(count));
					//添加新的油量
					Integer upOil = payService.updateOil(kePay);				
					if (upOil > 0) {
						//查看添加后的油量,并在前端展示
						String aftCntOil = payService.remainCntOil(kePay);
						kePay.setRemainOil(aftCntOil);
						JSONObject obj = new JSONObject();
						obj.element("code", KeConstant.KE_SUCCESS);
						obj.element("remainOil", aftCntOil);
						//充值后的油量总数和当前值一致
						obj.element("count", aftCntOil);
						print(obj);	
						printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
					}else {
						//用户注册失败
						print("{\"code\":\"1001\",\"message\":\"更新油量失败\"}");// 添加失败
						printParamsJSON(logger);
					}			
				}
				//插入充值记录
				Integer oilRec = payService.addRecord(kePay);
				if (oilRec <= 0) {
					print("{\"code\":\"1001\",\"message\":\"购买油量记录插入失败\"}");// 添加失败
					printParamsJSON(logger);
				}
				//更新用户类型
				Integer upType = payService.updateType(kePay);				
				if (upType <= 0) {
					print("{\"code\":\"1001\",\"message\":\"更新用户类型失败\"}");// 添加失败
					printParamsJSON(logger);
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
		}
	}*/
	
	/**
	 * 更新油量数据
	 * 1,如果第一次充值就直接添加进去
	 * 2,剩余的油量=剩下的油量+新充值的
	 */
	private void updateOilNew(KePay payVo){
		try {
			printStartLog("updateOil方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					payVo.getUserId(),
					payVo.getPayType(),
					payVo.getPayMoney(),
					payVo.getOrderNumber()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				return;
			}else {
//				//充值类型计算30L,90L,180L
//				if ("01".equals(payVo.getPayType())) {
//					payVo.setInputOil("30");
//				}else if("02".equals(payVo.getPayType())){
//					payVo.setInputOil("90");				
//				}else if("03".equals(payVo.getPayType())){
//					payVo.setInputOil("180");			
//				}else if("04".equals(payVo.getPayType())){
//					// 免费码充值油量,前端传入
//				}else {
//					printErrorLog("选择的购买类型不正确！", logger);
//					return;
//				}
				//充值类型计算30L,90L,180L
				if ("01".equals(payVo.getPayType())) {
					payVo.setInputOil("100");
				}else if("02".equals(payVo.getPayType())){
					payVo.setInputOil("320");				
				}else if("03".equals(payVo.getPayType())){
					payVo.setInputOil("650");			
				}else if("04".equals(payVo.getPayType())){
					// 免费码充值油量,前端传入
				}else {
					printErrorLog("选择的购买类型不正确！", logger);
					return;
				}
				printDebugLog("inputOil-----"+payVo.getInputOil(), logger);
				//检查用户是否有充值过
				Map<String, Object> user = payService.selectOil(payVo);
				if (user == null) {
					//首次充值，加入一条数据
					Integer oil = payService.add(payVo);
					//设置剩余油量					
					payVo.setRemainOil(payVo.getInputOil());
					if (oil > 0) {
						printDebugLog("购买油量成功", logger);
					}else {
						printErrorLog("购买油量失败", logger);
					}
				}else {
					//查看当前剩余油量(充值前)
					String befCntOil = payService.remainCntOil(payVo);
					int count =  Integer.parseInt(befCntOil)+Integer.parseInt(payVo.getInputOil());
					payVo.setRemainOil(String.valueOf(count));
					printDebugLog("RemainOil-----"+payVo.getRemainOil(), logger);
					//添加新的油量
					Integer upOil = payService.updateOil(payVo);
					if (upOil > 0) {
						printDebugLog("添加新的油量成功", logger);
					}else {
						printErrorLog("添加新的油量失败", logger);
					}	
				}
				//插入充值记录
				Integer oilRec = payService.addRecord(payVo);
				if (oilRec <= 0) {
					printErrorLog("插入充值记录失败", logger);
				}
				//更新用户类型
				Integer upType = payService.updateType(payVo);				
				if (upType <= 0) {
					printErrorLog("更新用户类型失败", logger);
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErrServer(e, logger);
		}
	}
	
	/**
	 * 学生端充值记录
	 */
	public void payRecord(){
		try {
			printStartLog("payRecord方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePay.getUserId()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}else {
				//查询所有充值记录
				List<KePay> stuList = payService.selectRecord(kePay);
				if (stuList == null) {
					//未充值，加入一条数据
					print("{\"code\":\"1001\",\"message\":\"用户还未购买过油量\"}");// 添加失败
					printEndLog(KeConstant.KE_SUCCESS,"用户还未充值过！",logger);
				}else {
					JSONObject obj = new JSONObject();
					JSONArray jsonList = JSONArray.fromObject(stuList);
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("teaList", jsonList);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, "查询记录成功", logger);
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
		}
	}
	
	/**
	 * TODO 下个版本前端修改发布后可删除
	 * 老师端收益记录
	 */
	public void getRecord(){
		try {
			printStartLog("getRecord方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePay.getTeacherId()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}else {
				//查询所有收益记录
				List<KeTeaOutputRcd> teaList = payService.getRecord(kePay);
				if (teaList == null) {
					//未充值，加入一条数据
					print("{\"code\":\"1001\",\"message\":\"用户还未购买过油量\"}");// 添加失败
					printEndLog(KeConstant.KE_SUCCESS,"用户还未充值过！",logger);
				}else {
					JSONObject obj = new JSONObject();
					JSONArray jsonList = JSONArray.fromObject(teaList);
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("message", "查询记录成功");
					obj.element("teaList", jsonList);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, "查询记录成功", logger);
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
		}
	}
	
	/**
	 * TODO 下个版本前端修改发布后调用此方法
	 * 老师端收益记录
	 */
	public void getRecordTea(){
		try {
			printStartLog("getRecordTea方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePay.getTeacherId()
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}else {
				//查询所有收益记录
				List<KeTeaOutputRcd> teaList = payService.getRecord(kePay);
				if (teaList == null || teaList.size() == 0) {
					//未充值，加入一条数据
					print("{\"code\":\"1001\",\"message\":\"您还没有收益记录哦\"}");// 添加失败
					printEndLog(KeConstant.KE_SUCCESS,"用户没有收益记录！",logger);
				}else {
					//处理后的所有记录List
					List<KeRecord> listTea = new ArrayList<KeRecord>();
					//一条数据
					KeRecord rec = null;
					//取得第一条数据
					String preMonth = teaList.get(0).getCreateTime().substring(0, 7);
					//每个月内的所有数据
					List<KeTeaOutputRcd> monthRcds = new ArrayList<KeTeaOutputRcd>();
					//遍历所有数据
					for (KeTeaOutputRcd outRcd : teaList) {
						//取得当前记录的月份
						String nowMonth = outRcd.getCreateTime().substring(0, 7);
						//跟上个月值相比
						if(!preMonth.equals(nowMonth)){
							//将记录放入统一月份中
							rec = new KeRecord();
							rec.setMonth(preMonth);
							rec.setRecord(monthRcds);
							listTea.add(rec);
							
							//月份变更时
							preMonth = nowMonth;
							monthRcds = new ArrayList<KeTeaOutputRcd>();
							monthRcds.add(outRcd);
						}else{
							monthRcds.add(outRcd);
						}
					}
					//最后一个月的信息设到对象中去
					rec = new KeRecord();
					rec.setMonth(preMonth);
					rec.setRecord(monthRcds);
					listTea.add(rec);					
					
					JSONObject obj = new JSONObject();
					JSONArray jsonList = JSONArray.fromObject(listTea);
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("message", "查询记录成功");
					obj.element("teaList", jsonList);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, "查询记录成功", logger);
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			printSysErr(e, logger);
		}
	}
	
	/**
     * 支付宝下单需要参数生成
     * @return
     */
	public void aliPreNo(){
		printStartLog("aliPreNo方法开始", logger);
		printParamsLog("请求参数。", logger);
		if (CheckUtil.checkNulls(
				kePay.getUserId(),
				kePay.getPayType(),
				kePay.getPayMoney()
				)) {
			
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}else {
			//商户号	mch_id:2088021413948354
			String partner = "2088021413948354";
			//支付宝支付完成后回调notify_url
			String notify_url = KeCommon.ALIPAY_DIRECT_NOTIFY_URL;
			//商品详情
			String body = kePay.getUserId() + "/" + kePay.getPayType() + "/" + kePay.getSIDCode();
			//---------------生成订单号 开始------------------------  
			//当前时间 yyyyMMddHHmmss  
			String currTime = DateUtil.getCurrentDate(DateUtil.YMDHMS_NO_FORMAT); 
			//8位日期  
			String strTime = currTime.substring(8, currTime.length());  
			//四位随机数  
			String strRandom = KeCommon.createRandom(10) + "";  
			//10位序列号,可以自行调整。  
			String strReq = "keke" + strTime + strRandom;  
			//订单号，此处用时间加随机数生成，商户根据自己情况调整，只要保持全局唯一就行  
			String out_trade_no = strReq;  
			//---------------生成订单号 结束------------------------  
			
			// 签约合作者身份ID
			String orderInfo = "partner=" + "\"" + partner + "\"";
			// 签约卖家支付宝账号
			orderInfo += "&seller_id=" + "\"" + KeCommon.EMAIL + "\"";
			// 商户网站唯一订单号
			orderInfo += "&out_trade_no=" + "\"" + out_trade_no + "\"";
			// 商品名称
			orderInfo += "&subject=" + "\"" + "课课作业" + "\"";
			// 商品详情
			orderInfo += "&body=" + "\"" + body + "\"";
			// 商品金额
			orderInfo += "&total_fee=" + "\"" + kePay.getPayMoney() + "\"";
			// 服务器异步通知页面路径
			orderInfo += "&notify_url=" + "\"" + notify_url + "\"";
			// 服务接口名称， 固定值 "&service=\"mobile.securitypay.pay\"";
			orderInfo += "&service=\"mobile.securitypay.pay\"";
			// 支付类型， 固定值
			orderInfo += "&payment_type=\"1\"";
			// 参数编码， 固定值
			orderInfo += "&_input_charset=\"utf-8\"";
			// 未付款交易的超时时间
			orderInfo += "&it_b_pay=\"30m\"";
			// 展示 的链接地址
			orderInfo += "&show_url=\"m.alipay.com\"";
			
			//生成签名
			String sign = RSA.sign(orderInfo, AlipayConfig.RSA_PRIVATE_PKCS8_KEY, "UTF-8");
			try {
				sign = URLEncoder.encode(sign, "utf-8");
			} catch (UnsupportedEncodingException e) {
				printSysErr(e, logger);
			}			
			orderInfo += "&sign=" + "\"" + sign + "\"" + "&sign_type=" + "\"" + AlipayConfig.sign_type_rsa + "\"";
			JSONObject aliJs = new JSONObject();
			aliJs.element("orderInfo", orderInfo);
			aliJs.element("code", KeConstant.KE_SUCCESS);
			print(aliJs);	
			printDebugLog(orderInfo, logger);			
		}
	}
	
	
	/**
     * 微信支付生成预付订单和签名
     * @return
     */
	public void preNo(){
		printStartLog("preNo方法开始", logger);
		printParamsLog("请求参数。", logger);
		if (CheckUtil.checkNulls(
				kePay.getUserId(),
				kePay.getPayType(),
				kePay.getPayMoney()
				)) {
			
			print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}else { 
	        //---------------------------------生成订单所需参数设置-----------------------------------------------------
			//微信支付完成后回调notify_url
			String notify_url = KeCommon.WX_NOTIFY_URL;
			//用户浏览器端IP 
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			//HttpSession session = ServletActionContext.getRequest().getSession();
			
			String spbill_create_ip = KeCommon.getIpAddr(request);
			//String spbill_create_ip = "58.22.114.82";
			// 获取访问者IP
			//String spbill_create_ip = request.getHeader("X-Forwarded-For");
			
			//商户号	mch_id:1308357101
			String partner = "1308357101";
			//8位随机数
			String noncestr = String.valueOf(KeCommon.createRandom(8));
			//获取时间戳
			String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
			
			//换算金额给微信
			int wxMoney = Integer.parseInt(kePay.getPayMoney()) * 100;
			kePay.setPayMoney(String.valueOf(wxMoney));
			
			//---------------生成订单号 开始------------------------  
	        //当前时间 yyyyMMddHHmmss  
	        String currTime = DateUtil.getCurrentDate(DateUtil.YMDHMS_NO_FORMAT); 
	        //8位日期  
	        String strTime = currTime.substring(8, currTime.length());  
	        //四位随机数  
	        String strRandom = KeCommon.createRandom(4) + "";  
	        //10位序列号,可以自行调整。  
	        String strReq = strTime + strRandom;  
	        //订单号，此处用时间加随机数生成，商户根据自己情况调整，只要保持全局唯一就行  
	        String out_trade_no = strReq;  
	        //商品描述
	        String body = "课课作业";
	        //商户APPID
	        String appId = "wxa0f96b45f772847b";
	        //---------------生成订单号 结束------------------------  
	        
	        // 将结果存储在HashMap中
	        Map<String, String> map = new HashMap<String, String>();
	        
	        String attach = kePay.getUserId() + "/" + kePay.getPayType() + "/" + kePay.getSIDCode();
	        //应用ID	appid:wxa0f96b45f772847b
	        map.put("appid", appId);
	        //附加数据	attach
	        map.put("attach", attach);
	        //商品描述	body:kerkr
	        map.put("body", body);
	        //商品详情	detail:充值类型01、02、03
	        map.put("detail", kePay.getPayType());
	        //商户号	mch_id:1308357101
	        map.put("mch_id", partner);
	        //随机字符串	nonce_str:
	        map.put("nonce_str", noncestr);
	        //通知地址	notify_url:http://ios.kerkr.com/kerkr/onRespPay.jspx
	        map.put("notify_url", notify_url);
	        //商户订单号	out_trade_no
	        map.put("out_trade_no", out_trade_no);
	        //终端IP	spbill_create_ip
	        map.put("spbill_create_ip", spbill_create_ip);
	        //总金额	total_fee
	        map.put("total_fee", kePay.getPayMoney());
	        //交易类型	trade_type
	        map.put("trade_type", "APP");
	        
	        //生成获取预支付签名  
	        String sign = WxSignature.getSign(map);	
	        System.out.println("sign========" + sign);
	            //请求微信数据统一下单接口
				String gateUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";
				// 设置请求的参数
		        CloseableHttpClient httpClient = HttpClients.createDefault();
		        HttpPost httpPost = new HttpPost(gateUrl);
		        //方式1：xml
		        StringBuilder strBd = new StringBuilder();
				strBd.append("<xml>");
				strBd.append("<appid>");
				strBd.append(appId);
				strBd.append("</appid>");
				
				strBd.append("<attach>");
				strBd.append(attach);
				strBd.append("</attach>");
				
				strBd.append("<body>");
				strBd.append(body);
				strBd.append("</body>");
				
				strBd.append("<detail>");
				strBd.append(kePay.getPayType());
				strBd.append("</detail>");
				
				strBd.append("<mch_id>");
				strBd.append(partner);
				strBd.append("</mch_id>");	
				
				strBd.append("<nonce_str>");
				strBd.append(noncestr);
				strBd.append("</nonce_str>");
				
				strBd.append("<notify_url>");
				strBd.append(notify_url);
				strBd.append("</notify_url>");				
				
				strBd.append("<out_trade_no>");
				strBd.append(out_trade_no);
				strBd.append("</out_trade_no>");
				
				strBd.append("<spbill_create_ip>");
				strBd.append(spbill_create_ip);
				strBd.append("</spbill_create_ip>");
				
				strBd.append("<total_fee>");
				strBd.append(kePay.getPayMoney());
				strBd.append("</total_fee>");
				
				strBd.append("<trade_type>");
				strBd.append("APP");
				strBd.append("</trade_type>");
		        
				strBd.append("<sign>");
				strBd.append(sign);
				strBd.append("</sign>");
				strBd.append("</xml>");
		        				
		        CloseableHttpResponse resp = null;
		        
	            try {
	            	//wxppEntity = new UrlEncodedFormEntity(wxPrePay, "UTF-8"); 
	            	
	            	// 请求微信转成ISO8859-1
	            	StringEntity strEntity = new StringEntity(strBd.toString(), "utf-8");
	            	httpPost.setEntity(strEntity);
	            	
	            	resp = httpClient.execute(httpPost);
	            	
	            	HttpEntity entity = resp.getEntity();
	    			String accInfo = EntityUtils.toString(entity, "utf-8");
	    			
	    			logger.debug("返回值------------：" + accInfo);
	    			
	    			// 将解析结果存储在HashMap中
	    	        Map<String, String> map1 = new HashMap<String, String>();
	    	        
	    			Document document = DocumentHelper.parseText(accInfo);
	    			
	    			// 得到xml根元素
	    	        Element root = document.getRootElement();
	    	        // 得到根元素的所有子节点
	    	        @SuppressWarnings("unchecked")
	    			List<Element> elementList = root.elements();
	    	        // 遍历所有子节点
	    	        printDebugLog("微信支付参数", logger);
	    	        for (Element e : elementList){
	    	        	map1.put(e.getName(), e.getText());
	    	        }
	    	        
					//获取prepayId
	    			String prepayid = map1.get("prepay_id");
					//sign = map1.get("sign");
					noncestr = map1.get("nonce_str");
					//返回给前端的参数  
					if (!CheckUtil.isNullOrEmpty(prepayid)) {
						//再次签名sign给前端
						// 将结果存储在HashMap中
				        Map<String, String> map2 = new HashMap<String, String>();
				        //应用ID	appid:wxa0f96b45f772847b
				        map2.put("appid", "wxa0f96b45f772847b");
				        //商户号	商户号:1308357101
				        map2.put("partnerid", "1308357101");				        
				        //预支付交易会话ID
				        map2.put("prepayid", prepayid);
				        //扩展字段
				        map2.put("package", "Sign=WXPay");
				        //随机字符串
				        map2.put("noncestr", noncestr);
				        //时间戳
				        map2.put("timestamp", timestamp);
				        //生成获取预支付签名  
				        sign = WxSignature.getSign(map2);	
				        System.out.println("再次生成给前端支付sign========" + sign);				        
				        
						JSONObject jobj = new JSONObject();
						//商户号
						jobj.element("partnerid", partner);
						//预支付交易会话ID
						jobj.element("prepayid", prepayid);
						//随机字符串
						jobj.element("noncestr", noncestr);
						//时间戳
						jobj.element("timestamp", timestamp);
						//扩展字段
						jobj.element("package", "Sign=WXPay");
						//签名
						jobj.element("sign", sign);
						jobj.element("code", KeConstant.KE_SUCCESS);
						print(jobj);
					}else{
						print("{\"code\":\"1001\",\"message\":\"预付订单下单不成功\"}");// 添加失败
						printErrorLog("选择的购买类型不正确！", logger);
					}
	            } catch (UnsupportedEncodingException e) {
	            	print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
	    			printSysErr(e, logger);
	    		} catch (DocumentException e1) {
					e1.printStackTrace();
				}  catch (IOException e) {
	    			printSysErr(e, logger);
	    		}finally {
	    	    	try {
	    	    		if(resp != null){
	    	    			resp.close();
	    	    		}
	    			} catch (IOException e) {
	    				printSysErr(e, logger);
	    			}
	    	    }				  
	        }
		}	
	
    /**
     * 微信支付完成后回调notify_url
     * @return
     */
	public void onResp(){
		try {			
			
			printStartLog("onResp微信支付回调方法开始", logger);
			printParamsLog("请求参数。", logger);
//			this.getResponse().setContentType("text/xml;charset=UTF-8");
			
			//取得请求的参数
			HttpServletRequest request = ServletActionContext.getRequest();		
			
	        // 将解析结果存储在HashMap中
	        Map<String, String> map = new HashMap<String, String>();
	  
	        // 从request中取得输入流
	        InputStream inputStream = request.getInputStream();
	        	        
	        // 读取输入流
	        SAXReader reader = new SAXReader();
	        Document document = reader.read(inputStream);
	        // 得到xml根元素
	        Element root = document.getRootElement();
	        // 得到根元素的所有子节点
	        @SuppressWarnings("unchecked")
			List<Element> elementList = root.elements();
	        // 遍历所有子节点
	        printDebugLog("微信支付参数", logger);
	        for (Element e : elementList){
	        	printDebugLog(e.getName()+ "=" + e.getText() + " ", logger);
	        	map.put(e.getName(), e.getText());
	        }
	        
	        //验证签名:如果签名不正确，跳出方法
	        //--------------------------------------------------------------------
            //收到API的返回数据的时候得先验证一下数据有没有被第三方篡改，确保安全
            //--------------------------------------------------------------------
	        if (!WxSignature.checkIsSignValidFromResponseString(map)) {
	        	
	        	printDebugLog("======微信签名验证失败=====", logger);
	        	
    			//微信需要的失败返回值内容
	        	setFailWxResult();
	        	
		        // 释放资源
		        inputStream.close();
		        inputStream = null;
    			return;
	        }
	        
	        //判断支付结果
	        String result = map.get("result_code");
    		if ("FAIL".equals(result)) {
    			
    			printDebugLog("======微信支付失败=====", logger);
    			
    			//微信需要的失败返回值内容
    			setFailWxResult();
    			
    	        // 释放资源
    	        inputStream.close();
    	        inputStream = null;
    			return;
			}
    		
    		//使用局部对象来更新db
    		KePay wxPay = new KePay(); 
    		
	        //支付总金额
	        String money = map.get("total_fee");
	        Integer moneyYuan = Integer.parseInt(money) / 100;
	        money = moneyYuan.toString();
        	wxPay.setPayMoney(money);
        	
	        //前端的附加信息
	        String payInfo = map.get("attach");
	        //订单号
	        String orderNb = map.get("transaction_id");
	        wxPay.setOrderNumber(orderNb);
			//查询DB找出是否有订单号
			String order = payService.selectOrderNum(wxPay);
			
			//判断是否保存有订单,判断是否已经处理过
			boolean orderFlag = false;
			if (CheckUtil.isNullOrEmpty(order)) {
				orderFlag = true;
			}else{
				printDebugLog("===!!!!订单已经处理过====!!!!", logger);
			}

			// 充值成功
	        if (orderFlag && "SUCCESS".equals(result)) {
	        	
	        	printDebugLog("充值成功，更新油量", logger);
	        	
	        	//解析回调的附加信息
	        	String[] attachArray = payInfo.split("/");
//	        	printDebugLog("===!!!!解析附加参数====!!!!"+attachArray[0]+"!!!!"+attachArray[1]+"!!!!"+attachArray[2], logger);
//	        	printDebugLog("学生端充值的优惠码-----------》" + attachArray[2], logger);
	        	printDebugLog("===!!!!PayMoney====!!!!"+money, logger);

	        	//获取充值的用户ID
	        	wxPay.setUserId(attachArray[0]);
	        	//获取充值的类型30L,90L,180L
	        	wxPay.setPayType(attachArray[1]);
	        	if(attachArray.length == 3){ 
		        	//获取SID/FID,如果有值就给营销老师加钱
		        	wxPay.setSIDCode(attachArray[2]);
	        	}
	        	// 更新微信或支付宝支付信息
	        	updatePayInfo(wxPay);
			}
	        
	        // 释放资源
	        inputStream.close();
	        inputStream = null;
			
		} catch (Exception e) {
			// 服务器内部错误
			printSysErrServer(e, logger);
		}
		//微信需要的返回值内容
		StringBuilder strBd = new StringBuilder();
		strBd.append("<xml>");
		strBd.append("<return_code><![CDATA[SUCCESS]]></return_code>");
		strBd.append("<return_msg><![CDATA[OK]]></return_msg>");
		strBd.append("</xml>");
		printDebugLog("返回给微信的值-----------:" + strBd.toString(), logger);
		println(strBd.toString());
	}
	
	/**
	 * 使用FID时0元支付接口
	 */
	public void fidResp(){
		try {
			printStartLog("fidResp方法开始", logger);
	    	printParamsLog("使用FID时0元支付接口参数:", logger);
	    	
			if (CheckUtil.checkNulls(
					kePay.getUserId(),
					kePay.getPayType(),//04:免费码支付
					kePay.getSIDCode(),
					kePay.getInputOil()//充值油量
					)) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}
		
			// 优惠金额计算 : 油量*10
			kePay.setDiscMoney(kePay.getInputOil());
			
			// 支付金额设置为0
			kePay.setPayMoney("0");
			
			// 生成一个订单号
			String randomCode = SendCodeUtil.random(4);
			String serialNumber = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS)+randomCode;
			kePay.setOrderNumber(serialNumber);
			
			KeSales saleInfo = new KeSales();
			saleInfo.setSIDCode(kePay.getSIDCode());
			saleInfo.setUserId(kePay.getUserId());
			
		    //免费码
			String fidStr = salesService.fidRegist(saleInfo);
			if(!CheckUtil.isNullOrEmpty(fidStr)){
				//将信息插入FID使用记录表中
				salesService.salAddFid(saleInfo);
				printDebugLog("免费码插入成功-----------》" + saleInfo.getSIDCode(), logger);
			}else{
				printDebugLog("===!!!!免费码已经使用过====!!!!", logger);
				print("{\"code\":\"1002\",\"message\":\"兑换码已经被使用过\"}");
				return;
			}

			// 更新油量
			updateOilNew(kePay);
			
			JSONObject obj = new JSONObject();
			obj.element("code", KeConstant.KE_SUCCESS);
			obj.element("message", "兑换成功");
			print(obj);
			
			printEndLog("使用FID时0元支付接口返回值", obj.toString(), logger);
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
		}
	}
	
	/**
	 * 更新微信或支付宝支付信息
	 * @param wxPay
	 * @throws Exception
	 */
	private void updatePayInfo(KePay wxPay) throws Exception {
		
		//给推广老师的报酬：按实际支付金额的10%
		String promotePay = null;
		Double discMoney = 0.0;
		Double payMoneyTmp = Double.parseDouble(wxPay.getPayMoney());
//		if ("01".equals(wxPay.getPayType())) {
//			discMoney = 299 - payMoneyTmp;
//			promotePay=String.valueOf(payMoneyTmp * 0.1);
//		}else if("02".equals(wxPay.getPayType())){
//			discMoney = 869 - payMoneyTmp;
//			promotePay=String.valueOf(payMoneyTmp * 0.1);				
//		}else if("03".equals(wxPay.getPayType())){
//			discMoney = 1699 - payMoneyTmp;
//			promotePay=String.valueOf(payMoneyTmp * 0.1);	
//		} else {
//			printErrorLog("选择的购买类型不正确！", logger);
//			return;
//		}
		if ("01".equals(wxPay.getPayType())) {
			discMoney = 99 - payMoneyTmp;
			promotePay=String.valueOf(payMoneyTmp * 0.1);
		}else if("02".equals(wxPay.getPayType())){
			discMoney = 299 - payMoneyTmp;
			promotePay=String.valueOf(payMoneyTmp * 0.1);				
		}else if("03".equals(wxPay.getPayType())){
			discMoney = 599 - payMoneyTmp;
			promotePay=String.valueOf(payMoneyTmp * 0.1);	
		} else {
			printErrorLog("选择的购买类型不正确！", logger);
			return;
		}
		printDebugLog("老师推广得到的金额-----------》" + promotePay, logger);
		wxPay.setDiscMoney(discMoney.toString());
		
		// 优惠码存在的时候
		if (!CheckUtil.isNullOrEmpty(wxPay.getSIDCode())) {

			KeSales keSales = new KeSales();
			//取得码的长度来鉴别是免费码还是优惠码
			int len = wxPay.getSIDCode().length();
			keSales.setSIDCode(wxPay.getSIDCode());
			keSales.setUserId(wxPay.getUserId());
			//SID码
			if (len == 6) {						
				String sidStr = salesService.salSid(keSales);
				if(!CheckUtil.isNullOrEmpty(sidStr)){
					//给营销老师的优惠码使用次数+1
					salesService.updateSID(keSales);
					//取得营销老师的信息
					String tea = salesService.getTeaInfo(keSales);
					printDebugLog("取得推广老师的ID-----------》" + tea, logger);
					
					//设置参数
					//取得老师的信息
					keSales.setTeacherId(tea);
					//设置金额
					keSales.setMoney(promotePay);
					//0:收入,1:支出
					keSales.setType("0");
					//给老师加钱
					salesService.updatePay(keSales);	
					printDebugLog("给老师推广钱插入成功-----------》" + keSales.toString(), logger);
					
					//添加老师收入记录
					Integer oilRec = salesService.addSIDRecord(keSales);
					if (oilRec <= 0) {
						printErrorLog("插入充值记录失败", logger);
					}
				}else{
					printDebugLog("===!!!!优惠码已无效====!!!!", logger);
				}
			}else if(len == 16) {
				printDebugLog("===系统错误,支付没有免费码====!!!!", logger);
//			    //免费码
//				String fidStr = salesService.fidRegist(keSales);
//				if(!CheckUtil.isNullOrEmpty(fidStr)){
//					//将信息插入FID使用记录表中
//					salesService.salAddFid(keSales);
//					printDebugLog("免费码插入成功-----------》" + keSales.toString(), logger);
//				}else{
//					printDebugLog("===!!!!免费码已经使用过====!!!!", logger);
//				}
			}else {
				//汉字优惠码
				/*String sidStr = salesService.salSid(keSales);
				if(!CheckUtil.isNullOrEmpty(sidStr)){
					//给营销老师的优惠码使用次数+1
					Integer oilRec = salesService.updateSID(keSales);
					if (oilRec <= 0) {
						printErrorLog("更新汉字SID次数失败", logger);
					}
				}else{
					printDebugLog("===!!!!优惠码已无效====!!!!", logger);
				}*/				
				printDebugLog("===!!!!优惠码已无效====!!!!", logger);
			}
		}
	
		// 更新油量
		updateOilNew(wxPay);
	}
	
	/**
	 * 设置微信失败返回值
	 * @return
	 */
	private void setFailWxResult() {
		StringBuilder strBd = new StringBuilder();
		strBd.append("<xml>");
		strBd.append("<return_code><![CDATA[FAIL]]></return_code>");
		strBd.append("<return_msg><![CDATA[支付失败]]></return_msg>");
		strBd.append("</xml>");
		printDebugLog("返回给微信的值-----------:" + strBd.toString(), logger);
		println(strBd.toString());
	}
	
	/**
	 * 支付宝充值异步回调处理
	 */
	@SuppressWarnings("rawtypes")
	public void alipayDirect() {

		printStartLog("方法开始alipayDirect", logger);
		printParamsLog("支付宝充值异步回调处理参数:", logger);

		// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = getRequest().getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			params.put(name, valueStr);
		}
		printDebugLog("支付宝回调参数-------" + params.toString(), logger);

		// 验证成功
		if (AlipayNotify.verifyDirect(params)) {

			logger.debug("验证成功");

			try {

				// 商户网站唯一订单号
//				String outTradeNo = params.get("out_trade_no");
				// 交易金额
				String payMoney = params.get("total_fee");
				// 支付宝交易号
				String tradeNo = params.get("trade_no");
				// 交易状态
				String tradeStatus = params.get("trade_status");
				// 商品描述
				String body = params.get("body");
				
				// 商品描述为空的时候
				if(CheckUtil.isNullOrEmpty(body)){
					logger.error("===========商品描述为空========");
					println("fail");
					return;
				}
				
				// 获取支付宝返回参数，进行业务逻辑处理
				// 获取商品信息
				KePay payInfo = new KePay(); 
				String[] bodyArray = body.split("/");
				payInfo.setUserId(bodyArray[0]);
				payInfo.setPayType(bodyArray[1]);
				if(bodyArray.length == 3){					
					payInfo.setSIDCode(bodyArray[2]);
				}
				payInfo.setPayMoney(payMoney);
				payInfo.setOrderNumber(tradeNo);// 支付宝交易号

				// 判断交易是否完成
				if("TRADE_FINISHED".equals(tradeStatus) || "TRADE_SUCCESS".equals(tradeStatus)){
					
					// 判断是否已经处理过
					Integer rst = payService.selorderNum(payInfo);
					if(rst > 0){
						logger.debug("-----该订单已经处理过----");
						println("success");
						return;
					}
					
		        	// 更新微信或支付宝支付信息
		        	updatePayInfo(payInfo);
					
				}else{
					
					logger.error("===========交易没有完成，状态========" + tradeStatus);
					println("fail");
					return;
				}
	
			} catch (Exception e) {
				printSysErr(e, logger);
			}

			// 请不要修改或删除
			logger.debug("-----回调执行成功返回信息-----");
			println("success");
		} else {
			logger.debug("验证失败");
			println("fail");
		}

		// 请求结束log
		printEndLog("支付宝回调结束", "", logger);
	}
}

