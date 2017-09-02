package com.bayan.keke.action;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.org.service.OrgService;
import com.bayan.keke.service.ManageService;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.SalesService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.service.TeaUsService;
import com.bayan.keke.service.UserService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeManage;
import com.bayan.keke.vo.KeOrg;
import com.bayan.keke.vo.KeSales;
import com.bayan.keke.vo.KeTeaIncome;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaUs;
import com.bayan.keke.vo.KeUser;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ManageAction extends BaseAction implements
		ModelDriven<KeManage>, Preparable {
	
	/**
	 * 序列号
	 */
	private static final long serialVersionUID = 6875008194411825448L;

    private static final Logger logger = Logger.getLogger(ManageAction.class);
    
	@Resource
	private ManageService manageService;
    
	@Resource
	private TeaUsService teaUsService;
	
	@Resource
	private SalesService salesService;
	
	@Resource
	private OrgService orgService;
	
	@Resource
	private PayService payService;
	
    @Resource
	private UserService userService;
    
    @Resource
    private SubjectService subjectService;
    
	private KeManage keManage;

	/**
	 * 
	 */
	public KeManage getModel() {
		return keManage;
	}
	/**
	 * 
	 */
	public void prepare() throws Exception {
		keManage = new KeManage();
	}
	
	/**
	 * 管理员登陆
	 */
	public String adminLogin() {
		
		printStartLog("adminLogin方法开始", logger);
		printParamsLog("请求参数。", logger);
		if (CheckUtil.checkNulls(
				keManage.getPhoneNumber(), 
				keManage.getPassword()
				)) {
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return "error";
		} 
		
		// 非管理员登录
		if(!"18702103770".equals(keManage.getPhoneNumber()) 
				&& !"15921254069".equals(keManage.getPhoneNumber())
				&& !"15861591576".equals(keManage.getPhoneNumber())
				&& !"17621675208".equals(keManage.getPhoneNumber())
				){
			return "error";
		}
		try {
			
			KeSales keSales = new KeSales();
			keSales.setPhoneNumber(keManage.getPhoneNumber());
			keSales.setPassword(keManage.getPassword());
			
			// 判断该用户是否已注册
			Map<String, Object> reg = salesService.salRegist(keSales);
			if (reg == null) {
				// 登录失败
				printErrorLog("用户还未注册", logger);
				// getRequest().setAttribute("msg", "用户还未注册");
				return "error";
			} else {
				// 取得密码
				String password = reg.get("password").toString();
				String userId = reg.get("teacher_id").toString();
				if (keSales.getPassword().equals(password) && keSales.getPhoneNumber().equals(userId)) {
					// 登录查询数据
					printDebugLog("获取老师信息", logger);
					getSession().setAttribute("userId", reg.get("teacher_id").toString());
					return "admin";
				}else{
					// 登录查询数据
					printDebugLog("密码不对", logger);
					getSession().setAttribute("error", "密码不对");
					return "adminLogin";
				}
			}
		} catch (Exception e) {
			printSysErr(e, logger);
			return "error";
		}
	}
				//
		/*if ("1001".equals(keManage.getPhoneNumber())
				&& "1q2w3e4r".equals(keManage.getPassword())) {
			
			getSession().setAttribute("userId", "1001");
			
			return "admin";

		} else if ("15861591576".equals(keManage.getPhoneNumber())
				&& "1q2w3e4r".equals(keManage.getPassword())) {
			
			getSession().setAttribute("userId", "15861591576");
			
			return "index";

		} else{
			return "error";
		}*/
	
	/**
	 * 检索提现申请记录
	 */
	public void searchPayRecord() {
		
    	printStartLog("方法开始searchPayRecord", logger);
    	printParamsLog("检索提现申请记录参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keManage.getSearchType())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}
		
		try {
			List<KeTeaIncomeRcd> res = manageService.searchPayRecord(keManage);
			JSONArray jsonList = JSONArray.fromObject(res);
			JSONObject json = new JSONObject();
			json.element("total", res.size());
			json.element("rows", jsonList.toString());
			print(json);
			
			// 请求结束log
			printEndLog("检索提现申请结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 批量支付
	 */
	public String batchTrans() {
		
    	printStartLog("方法开始batchTrans", logger);
    	printParamsLog("批量支付参数:", logger);

		//付款总金额
		double batchFee = 0;
		//付款详细数据
		StringBuilder detailData = new StringBuilder();
		//批次号
		String batchNo = "";
		
		List<KeTeaIncomeRcd> teaRecords = null;
		try {
			// DB检索付款申请对象(未付款或付款中断查询)
//			keManage.setSearchType("0");//用户申请中
			teaRecords = manageService.searchPayRecord(keManage);
			
			if(!String.valueOf(teaRecords.size()).equals(keManage.getBatchNum())){
				getRequest().setAttribute("message", "申请信息有变更 请重新检索");
				return "messagePage";
			}

			// 转账批次号和状态修改(商户申请中)
			batchNo = teaRecords.get(0).getBatchNo();
			keManage.setBatchNo(batchNo);
			manageService.updatePayStatus(keManage);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
		
		for (int i = 0; i < teaRecords.size(); i++) {
			KeTeaIncomeRcd rcd = teaRecords.get(i);
			if(i > 0){
				detailData.append(KeConstant.VERTICAL_LINE);
			}

			// 付款明细
			detailData.append(rcd.getSerialNumber());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append(rcd.getToAccount());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append(rcd.getToName());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append(rcd.getAmount());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append("课课老师提现");
			
			// 付款总金额
			batchFee = batchFee + Double.parseDouble(rcd.getAmount());
		}
		
		String payDate = batchNo.substring(0, 8);//付款当天日期
		String batchNum = String.valueOf(teaRecords.size());//付款笔数
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "batch_trans_notify");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("notify_url", KeCommon.ALIPAY_NOTIFY_URL);
		sParaTemp.put("email", KeCommon.EMAIL);
		sParaTemp.put("account_name", KeCommon.ACCOUNT_NAME);
		sParaTemp.put("pay_date", payDate);
		sParaTemp.put("batch_no", batchNo);
		sParaTemp.put("batch_fee", String.valueOf(batchFee));
		sParaTemp.put("batch_num", batchNum);
		sParaTemp.put("detail_data", detailData.toString());
		
		printDebugLog("-----支付参数:--"+sParaTemp.toString(),logger);
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
		getRequest().setAttribute("alipayReq", sHtmlText);
		
		// 请求结束log
		printEndLog("批量支付结束返回值:", sHtmlText, logger);
		
		return "alipay";
	}
	
	/**
	 * 支付宝回调处理
	 */
	@SuppressWarnings("rawtypes")
	public void alipayNotify() {

		printStartLog("方法开始alipayNotify", logger);
		printParamsLog("支付宝回调处理参数:", logger);

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
		if (AlipayNotify.verify(params)) {

			logger.debug("验证成功");

			// 成功序列号
			List<String> sucSerialLst = new ArrayList<String>();
			// 失败序列号
			List<String> failSerialLst = new ArrayList<String>();
			
			try {

				// 查询批次番号
				Integer searchBatchNo = manageService.searchBatchNo(params.get("batch_no"));
				if (searchBatchNo > 0) {
					printDebugLog("！！！！！！！！已经批量处理过！！！！！！！", logger);
					println("success");
					return;
				}

				String batchNo = params.get("batch_no");
				// 批量付款数据中转账成功的详细信息
				if (!CheckUtil.isNullOrEmpty(params.get("success_details"))) {
					String success_details = new String(params.get("success_details").getBytes("ISO-8859-1"), "UTF-8");
					String sucAray[] = success_details.split(KeConstant.ALIPAY_VERTICAL_LINE);
					for (String detail : sucAray) {
						String alipayInfo[] = detail.split(KeConstant.ALIPAY_DELIMITER_TWO);
						KeTeaIncomeRcd incomeRcd = new KeTeaIncomeRcd();
						incomeRcd.setSerialNumber(alipayInfo[0]);
						incomeRcd.setBatchNo(batchNo);
						incomeRcd.setResult(alipayInfo[4]);
						incomeRcd.setReason(alipayInfo[5]);
						incomeRcd.setAlipayNumber(alipayInfo[6]);
						incomeRcd.setFinishTime(alipayInfo[7]);
						manageService.updateAipayInfo(incomeRcd);
						
						sucSerialLst.add(alipayInfo[0]);
					}
				} else {
					printDebugLog("没有支付成功的信息", logger);
				}

				// 批量付款数据中转账失败的详细信息
				if (!CheckUtil.isNullOrEmpty(params.get("fail_details"))) {
					String fail_details = new String(params.get("fail_details").getBytes("ISO-8859-1"), "UTF-8");

					String failAray[] = fail_details.split(KeConstant.ALIPAY_VERTICAL_LINE);
					for (String detail : failAray) {
						String alipayInfo[] = detail.split(KeConstant.ALIPAY_DELIMITER_TWO);
						KeTeaIncomeRcd incomeRcd = new KeTeaIncomeRcd();
						incomeRcd.setBatchNo(batchNo);
						incomeRcd.setSerialNumber(alipayInfo[0]);
						incomeRcd.setToAccount(alipayInfo[1]);
						incomeRcd.setToName(alipayInfo[2]);
						incomeRcd.setAmount(alipayInfo[3]);
						incomeRcd.setResult(alipayInfo[4]);
						incomeRcd.setReason(alipayInfo[5]);
						incomeRcd.setAlipayNumber(alipayInfo[6]);
						incomeRcd.setFinishTime(alipayInfo[7]);
						manageService.updateAipayInfo(incomeRcd);

						// 查询老师ID
						KeTeaIncomeRcd rls = manageService.selRcdWithSerNum(incomeRcd);
						incomeRcd.setTeacherId(rls.getTeacherId());

						// 支付失败，金额退回
						manageService.returnTeaIncome(incomeRcd);

						// 添加退回记录
						KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
						teaIncomeRcd.setBatchNo(batchNo);
						teaIncomeRcd.setTeacherId(rls.getTeacherId());
						teaIncomeRcd.setAmount(alipayInfo[3]);
						teaIncomeRcd.setType(KeConstant.TYPE_IN);
						teaIncomeRcd.setReason("退款");
						manageService.insTeaIncomeRcd(teaIncomeRcd);
						
						failSerialLst.add(alipayInfo[0]);
					}
				} else {
					printDebugLog("没有支付失败的信息", logger);
				}
			} catch (UnsupportedEncodingException e) {
				printSysErrServer(e, logger);
			} catch (Exception e) {
				printSysErrServer(e, logger);
			}

			// 推送支付结果
			pushPayResult(sucSerialLst, failSerialLst);
			
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
	
	
	/**
	 * 推送支付结果
	 * 
	 * @param sucLst
	 * @param failLst
	 */
	private void pushPayResult(List<String> sucSerialLst, List<String> failSerialLst) {

		// 成功信息推送
		if (sucSerialLst.size() > 0) {
			try {
				List<String> sucAlias = manageService.selDeviceWithSerial(sucSerialLst);
				KeCommon.pushMsgToTea(sucAlias, "您的提现申请已到账，请到支付宝的交易记录里查询详情，感谢您使用课课老师APP。", "提现到账");
			} catch (Exception e) {
				printSysErrServer(e, logger);
			}
		}

		// 失败信息推送
		if (failSerialLst.size() > 0) {
			try {
				List<String> failAlias = manageService.selDeviceWithSerial(failSerialLst);
				KeCommon.pushMsgToTea(failAlias, "您的提现申请未成功到账，请检查支付宝姓名和账号是否正确，于下周五再次申请提现，给您带来不便敬请谅解。", "提现失败");
			} catch (Exception e) {
				printSysErrServer(e, logger);
			}
		}
	}
	
	
	/**
	 * 获取教师资格证
	 */
	public String searchCertification() {
		
    	printStartLog("方法开始searchPayRecord", logger);
    	printParamsLog("获取检索资格证参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keManage.getUserId(),
				keManage.getApproveStatus())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return "error";
		}
		
		try {
			List<KeTeaUs> res = manageService.searchCertification(keManage);
			getRequest().setAttribute("list", res);
			
			//七牛下载地址设置
			for (KeTeaUs keTeaUs : res) {
				String qiniuUrl = KeCommon.getCertificateUrlSign(keTeaUs.getCertificateUrl());
				keTeaUs.setCertificateUrl(qiniuUrl);
			}

			// 请求结束log
			printEndLog("获取检索资格证结束，件数:", String.valueOf(res.size()), logger);
			
			return "certification";
		} catch (Exception e) {
			printSysErr(e, logger);
			return "error";
		}
	}
	
	/**
	 * 获取举报内容
	 */
	public String searchReport() {
		
    	printStartLog("方法开始searchReport", logger);
    	printParamsLog("获取举报内容参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keManage.getUserId(),
				keManage.getReportStatus())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return "error";
		}
		
		try {
			List<Map<String, Object>> res = manageService.searchReport(keManage);
			getRequest().setAttribute("list", res);
			
			// 请求结束log
			printEndLog("获取举报内容结束，件数:", String.valueOf(res.size()), logger);
			
			return "report";
		} catch (Exception e) {
			printSysErr(e, logger);
			return "error";
		}
	}
	
	/**
	 * 更新举报处理结果
	 */
	public void updateReportStatus() {
		
		printStartLog("方法开始updateApprvStatus", logger);
		printParamsLog("审批资格证参数:", logger);
		
		// 参数验证
		if (CheckUtil.checkNulls(keManage.getUserId(),
				keManage.getTeacherId(),
				keManage.getPhotoId(),
				keManage.getReportStatus())) {
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}
		
		try {
			
			// 更新举报处理结果
			Map<String, Object> deviceMap = new HashMap<String, Object>();
			deviceMap.put("userId", keManage.getUserId());// 用户id
			deviceMap.put("flag", '0'); // 家长
			
			// 获取家长设备
			List<Map<String, Object>> stuList = manageService.selDevices(deviceMap);
			
			// 获取老师设备
			deviceMap.put("userId", keManage.getTeacherId());// 用户id
			deviceMap.put("flag", '1'); // 老师
			List<Map<String, Object>> teaList = manageService.selDevices(deviceMap);
			
			// 学生推送消息标题
			String stuAlert = "";
			// 学生推送消息内容
			String stuMsgContent = "";
			// 老师推送消息标题
			String teaAlert = "";
			// 老师推送消息内容
			String teaMsgContent = "";
			
			// 更新举报处理结果
			Map<String, Object> map = new HashMap<String, Object>();
			
			// 恶意批改，禁用老师，老师不计入收益
			if ("0".equals(keManage.getReportStatus())) {

				//禁用老师，不能批改作业。禁用后，检索作业为0件
				manageService.invalidTeacher(keManage);

				// 举报处理结果:学生投诉有效
				map.put("result", '0');
				map.put("contentAdm", "禁用老师");

				// 给家长推送消息
				stuAlert = "经过课课的准确核实，您举报的老师我们已进行相应的处罚，感谢您的反馈。";
				stuMsgContent = "举报处理完成";

				// 给老师推送消息
				teaAlert = "经过课课的准确核实，家长对您的举报内容属实，课课已关闭您的批改权限。";
				teaMsgContent = "举报处理完成";
			}else if("1".equals(keManage.getReportStatus())){
				// 批改错误，评分降低，老师不计入收益
				
				// 举报处理结果:学生投诉有效
				map.put("result", '0');
				map.put("contentAdm", "降低评分");
				
				// 给家长推送消息
				stuAlert = "经过课课的准确核实，对您举报的老师我们已进行相应的处罚，感谢您的反馈。";
				stuMsgContent = "举报处理完成";

				// 给老师推送消息
				teaAlert = "经过课课的准确核实，您批改的作业有误，本次批改将不会计入收益。这将会影响您的动态评分，下次请认真批改。";
				teaMsgContent = "举报处理完成";
			}else if("2".equals(keManage.getReportStatus())){
				// 举报不属实，不做处理。给老师加一块钱收益
				
				// 举报处理结果:学生投诉无效
				map.put("result", '1');
				map.put("contentAdm", "举报无效");
				
				// 给家长推送消息
				stuAlert = "经过课课的准确核实,您的举报不属实,感谢您的反馈。";
				stuMsgContent = "举报不属实";
				
				// 举报不属实，给老师加一块钱收益,添加收益记录
				KeCommon.addTeaIncome(subjectService, keManage.getTeacherId());
			}
			
			// 更新投诉处理结果
			map.put("status", '2'); // 投诉处理完成
			map.put("photoId", keManage.getPhotoId());// 照片ID
			manageService.updateReportResult(map);
			
			// 家长推送消息
			if(!CheckUtil.isNullOrEmpty(stuAlert)){
				if (stuList.size() == 1) {
					List<String> aliasStu = new ArrayList<String>();
					aliasStu.add(stuList.get(0).get("device_id").toString());
					boolean result = KeCommon.pushMsgToStu(aliasStu, stuAlert, stuMsgContent);
					if (!result) {
						printDebugLog("家长消息推送失败", logger);
					}
				}
			}
			
			// 老师推送消息
			if(!CheckUtil.isNullOrEmpty(teaAlert)){
				if (teaList.size() == 1) {
					List<String> aliasTea = new ArrayList<String>();
					aliasTea.add(teaList.get(0).get("device_id").toString());
					boolean result = KeCommon.pushMsgToTea(aliasTea, teaAlert, teaMsgContent);
					if (!result) {
						printDebugLog("老师消息推送失败", logger);
					}
				}
			}
			
			// 成功
			JSONObject json = new JSONObject();
			json.element("code", "1000");
			print(json);
			
			// 请求结束log
			printEndLog("举报审核结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 更新教师资格证状态
	 */
	public void updateApprvStatus() {
		
		printStartLog("方法开始updateApprvStatus", logger);
		printParamsLog("审批资格证参数:", logger);
		
		// 参数验证
		if (CheckUtil.checkNulls(keManage.getTeacherId(),keManage.getApproveStatus())) {
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}
		
		try {
			//判断是否审查通过,通过之后直接跳转到开始批改画面
			if ("APPROVED".equals(keManage.getApproveStatus())) {
				//审查通过
				boolean flag1 = SendCodeUtil.sendCerYES(keManage.getTeacherId());
				if (flag1) {
					printEndLog("教师资格证审核通过,teacherid=", keManage.getTeacherId(), logger);
				}
			}else {
				//审查不通过，重新注册
				boolean flag2 = SendCodeUtil.sendCerNO(keManage.getTeacherId());
				if (flag2) {
					printEndLog("资格证审查不通过,teacherid=", keManage.getTeacherId(), logger);
				}
			}
			//更新DB的状态
			manageService.updateApprvStatus(keManage);
			JSONObject json = new JSONObject();
			json.element("code", "1000");
			print(json);
			
			// 请求结束log
			printEndLog("审批资格证结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 管理员统计处理
	 * @return
	 */
	public String tongji() {
		printStartLog("方法开始tongji", logger);
		printParamsLog("管理员统计处理参数:", logger);
		
		try {
			
			// 注册老师人数，注册学生人数，作业总数统计
			List<Integer> rst = manageService.tongji();

			// 老师人数，学生人数
			Integer[] values = { rst.get(0) + rst.get(1), rst.get(2) };
			
			// 作业分数
			Integer[] rates = { rst.get(3) };
			JSONObject json = new JSONObject();
			json.element("values", values);
			json.element("rates", rates);
			getRequest().getSession().setAttribute("tongji", json);
			
			// 请求结束log
			printEndLog("管理员统计处理结束返回值:", json.toString(), logger);
			
			return "tongji";
		} catch (Exception e) {
			printSysErr(e, logger);
		}
		
		return null;
	}
	
	/**
	 * 统计列表信息
	 */
	public void tongjiList() {
		printStartLog("方法开始tongjiList", logger);
		printParamsLog("统计列表信息处理参数:", logger);
		
		int start = (getPage() - 1) * getRows();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", start);
		map.put("size", getRows());
		map.put("type", keManage.getTongjiType());
		
		try {
			
			// 注册老师人数，注册学生人数，作业总数统计
			List<Integer> rst = manageService.tongji();
			
			int total = 0;
			
			// 获取老师或者学生信息
			List<Map<String,Object>> list = null;
			
			// 学生注册信息
			if("0".equals(keManage.getTongjiType())){
				total = rst.get(2);
				list = manageService.selTeacherOrUserInfo("manage.selUserInfoList", map);
			}else if("1".equals(keManage.getTongjiType())){
				// 批改老师注册信息
				list = manageService.selTeacherOrUserInfo("manage.selTeacherInfoList", map);
				
				// 资格证url编辑
				for (Map<String, Object> teaMap : list) {
					String certificateUrl = teaMap.get("certificateUrl").toString();
					String url = KeCommon.getCertificateUrlSign(certificateUrl);
					teaMap.put("certificateUrl", url);
				}
				
				total = rst.get(0);
			}else if("2".equals(keManage.getTongjiType())){
				// 推广老师注册信息
				list = manageService.selTeacherOrUserInfo("manage.selTuiguangTeacherList", map);
				total = rst.get(1);
			}else{
				JSONObject json = new JSONObject();
				json.element("total", 0);// 完善个人消息
				json.element("rows", new JSONArray());// 完善个人消息
				print(json);
				
				// 请求结束log
				printEndLog("统计列表信息结束返回值:", json.toString(), logger);
				return;
			}
			
			// 获取老师或者学生信息
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONObject json = new JSONObject();
			json.element("total", total);// 完善个人消息
			json.element("rows", jsonList.toString());// 完善个人消息
			print(json);
			
			// 请求结束log
			printEndLog("统计列表信息结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 日均增长
	 */
	@SuppressWarnings("unchecked")
	public void dayAdd() {
		try {
			
			printStartLog("方法开始dayAdd", logger);
			printParamsLog("日均增长处理参数:", logger);
			
			// 学生数据
			keManage.setTongjiType("0");
			Map<String, Object> mapStudent = manageService.dayCount(keManage);
			
			// 老师数据
			keManage.setTongjiType("1");
			Map<String, Object> mapTeacher = manageService.dayCount(keManage);
			
			// 学生注册量
			List<Integer> studentList = (List<Integer>) mapStudent.get("regCount");
			List<String> dateList = (List<String>) mapStudent.get("registerTime");
			
			// 老师注册量
			List<Integer> teachertList = (List<Integer>) mapTeacher.get("regCount");
			
			// 学生数组
			Integer[] studentCount = (Integer[]) studentList
					.toArray(new Integer[studentList.size()]);

			// 老师数组
			Integer[] teacherCount = (Integer[]) teachertList
					.toArray(new Integer[teachertList.size()]);

			// 日期数组
			String[] date = (String[]) dateList.toArray(new String[dateList.size()]);
			
			JSONObject json = new JSONObject();
			json.element("student", studentCount);
			json.element("teacher", teacherCount);
			json.element("date", date);
			print(json);
			
			// 请求结束log
			printEndLog("日均增长结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 收入支出
	 */
	@SuppressWarnings("unchecked")
	public void profit() {
		try {
			
			printStartLog("方法开始profit", logger);
			printParamsLog("收入支出处理参数:", logger);
			
			// 总收入查询
			Map<String, Object> incomeTotalMap = manageService.selIncomeTotal(keManage);
			String incomeTotal = incomeTotalMap.get("incomeTotal").toString();
			if(CheckUtil.isNullOrEmpty(incomeTotal)){
				incomeTotal = "0";
			}
			
			// 总支出查询
			Map<String, Object> outgoTotalMap = manageService.selOutgoTotal(keManage);
			String outgoTotal = outgoTotalMap.get("outgoTotal").toString();
			if(CheckUtil.isNullOrEmpty(outgoTotal)){
				outgoTotal = "0";
			}
			
			// 总盈利
			Double profitTotal = Double.parseDouble(incomeTotal) - Double.parseDouble(outgoTotal);
			
			// 收入检索
			keManage.setTongjiType("0");
			Map<String, Object> income = manageService.selIncomeOutgo(keManage);
			
			// 支出检索
			keManage.setTongjiType("1");
			Map<String, Object> outgo = manageService.selIncomeOutgo(keManage);
						
			// 收入数据
			List<Integer> incomeList = (List<Integer>) income.get("inoutCnt");
			List<String> dateList = (List<String>) income.get("countTime");
			
			// 支出数据
			List<Integer> outgoList = (List<Integer>) outgo.get("inoutCnt");
			
			// 收入数组
			Integer[] incomeCount = (Integer[]) incomeList
					.toArray(new Integer[incomeList.size()]);

			// 支出数组
			Integer[] outgoCount = (Integer[]) outgoList
					.toArray(new Integer[outgoList.size()]);

			// 日期数组
			String[] date = (String[]) dateList.toArray(new String[dateList.size()]);
			
			JSONObject json = new JSONObject();
			json.element("incomeTotal", incomeTotal);
			json.element("outgoTotal", outgoTotal);
			json.element("profitTotal", profitTotal.toString());
			json.element("income", incomeCount);
			json.element("outgo", outgoCount);
			json.element("date", date);
			print(json);
			
			// 请求结束log
			printEndLog("收入支出结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 生成FID
	 */
	public void createFid() {
		printStartLog("方法开始createFid", logger);
		printParamsLog("生成FID处理参数:", logger);
		
		String fidNum = keManage.getFidNum();
		
		
		if(CheckUtil.checkNulls(fidNum, keManage.getOil())){
			printDebugLog("FID的个数为空", logger);
			return;
		}
		
		// 计算优惠金额
//		Integer oil = Integer.parseInt(keManage.getOil());
//		String discountAmount = String.valueOf(oil * 10);
		String discountAmount = keManage.getOil();
		
		try {
			
			// 生成fid个数
			int fidCount = Integer.parseInt(fidNum);
			List<Map<String, String>> fidList = new ArrayList<Map<String, String>>();
			for (int i = 0; i < fidCount; i++) {
				
				// 生成一个FID,判断是否存在，如果存在重新生成一个。循环10次都重复的话，报错误提示
				// 按照UUID规则,100万个内基本不会出现重复
				for(int j =0; j < 10; j++){
					
					// 生成唯一ID
					String uuid = UUID.randomUUID().toString();
					String fid = uuid.substring(4, 23).replace("-", "");
					
					// 判断数据库中是否已经存在FID
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("fid", fid);
					Integer fidRst = manageService.selFid(map);
					if(fidRst == 0){
						
						Map<String, String> fidMap = new HashMap<String, String>();
						fidMap.put("fid", fid);
						fidMap.put("discountAmount", discountAmount);
						fidList.add(fidMap);
						break;
					}
					
					// 10次都有重复，系统错误
					if(j == 10){
						printErrorLog("★★★FID生成有错★★★", logger);
						return;
					}
				}
			}
			
			// 生成FID
			manageService.insertFids(fidList);
			
			// 返回结果
			JSONObject json = new JSONObject();
			json.element("result", "success");
			print(json);
			
			// 请求结束log
			printEndLog("生成FID结束", "", logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 查询FID
	 */
	public void fidList() {
		printStartLog("方法开始fidList", logger);
		printParamsLog("查询FID处理参数:", logger);
		
		int start = (getPage() - 1) * getRows();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", start);
		map.put("size", getRows());
		map.put("fidType", keManage.getFidSidType());
		
		try {
			
			// 查询FID个数
			Integer rst = manageService.countFid(map);
			
			// 查询FID信息
			List<Map<String,Object>> list = manageService.selFidInfo(map);
			
			// 返回结果
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONObject json = new JSONObject();
			json.element("total", rst);
			json.element("rows", jsonList.toString());
			print(json);
			
			// 请求结束log
			printEndLog("查询FID结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 查询SID
	 */
	public void sidList() {
		printStartLog("方法开始sidList", logger);
		printParamsLog("查询SID处理参数:", logger);
		
		int start = (getPage() - 1) * getRows();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", start);
		map.put("size", getRows());
		map.put("sidType", keManage.getFidSidType());
		
		try {
			
			// 查询FID个数
			Integer rst = manageService.countSid(map);
			
			// 查询FID信息
			List<Map<String,Object>> list = manageService.selSidInfo(map);
			
			// 返回结果
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONObject json = new JSONObject();
			json.element("total", rst);
			json.element("rows", jsonList.toString());
			print(json);
			
			// 请求结束log
			printEndLog("查询SID结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * SID作废
	 */
	public void invalidSid() {
		printStartLog("方法开始invalidSid", logger);
		printParamsLog("SID作废处理参数:", logger);
		
		if(CheckUtil.isNullOrEmpty(keManage.getSid())){
			printDebugLog("sid为空", logger);
			// 返回结果
			JSONObject json = new JSONObject();
			json.element("result", "fail");
			print(json);
			return;
		}
		
		try {
			
			// 返回结果
			JSONObject json = new JSONObject();
			
			// SID作废
			Integer rst = manageService.invalidSid(keManage);
			if(rst == 1){
				json.element("result", "success");
			}else{
				json.element("result", "fail");
			}
			print(json);
			
			// 请求结束log
			printEndLog("SID作废结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	////////////////////以下为老师后台业务/////////////////////////
	
	/**
	 * 后台老师统计处理
	 * @return
	 */
	public String teaTongji() {
		printStartLog("方法开始teaTongji", logger);
		printParamsLog("老师统计处理参数:", logger);
		
		try {
			// 查询老师SID信息
			List<Map<String,Object>> rst = manageService.selSidWithTeacherId(keManage);
			if(rst.size() == 0){
				return "error";
			}
			getRequest().getSession().setAttribute("teaSidInfo", rst.get(0));

			// 请求结束log
			JSONObject json = new JSONObject();
			json.element("sid", rst.get(0).get("sid"));//SID
			json.element("countPay", rst.get(0).get("countPay")); //使用次数
			json.element("status", rst.get(0).get("status")); // 状态
			json.element("discountAmount", rst.get(0).get("discountAmount"));// 优惠金额
			json.element("phoneNumber", rst.get(0).get("phoneNumber"));// 手机号
			printEndLog("老师统计处理结束返回值:", json.toString(), logger);
			
			return "teaTongji";
		} catch (Exception e) {
			printSysErr(e, logger);
		}
		
		return null;
	}
	
	/**
	 * 发送SID到手机
	 * @return
	 */
	public void sendSid() {
		printStartLog("方法开始sendSid", logger);
		printParamsLog("发送SID处理参数:", logger);
		
		if(CheckUtil.checkNulls(keManage.getPhoneNumber(),
				keManage.getSid())) {
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}
		
		try {
			
			// 发送SID
			SendCodeUtil.sendSid(keManage.getPhoneNumber(),
					keManage.getSid());
			
			// 请求结束log
			JSONObject json = new JSONObject();
			json.element("result", "success");//SID
			print(json);
			printEndLog("发送SID结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 提现页面
	 * @return
	 */
	public String toWithdrawPage() {
		printStartLog("方法开始toWithdrawPage", logger);
		printParamsLog("提现页面处理参数:", logger);
		
		// 参数验证
		if (CheckUtil.checkNulls(
				keManage.getTeacherId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return "error";
		}
		
		KeTeaIncome teaIncome = null;
		
    	try {
    		// 查询老师总收入
    		teaIncome = manageService.selTeaIncomeTotal(keManage);
    		
    		//取得总收入为空时，设置为0
    		if (teaIncome == null) {
    			teaIncome = new KeTeaIncome();
				teaIncome.setTotalIncome("0");
				teaIncome.setInputIncome("0");
				teaIncome.setOutputIncome("0");
			}
    		
    		// 判断当天是否已经提现
    		List<KeTeaIncomeRcd> outputRcds = manageService.selOutMoneyToday(keManage);
    		if(outputRcds.size() > 0){
    	    	// 返回前台结果
    	    	getRequest().getSession().setAttribute("hadTixian", "1");
    		}else{
    			getRequest().getSession().setAttribute("hadTixian", "0");
    		}
    		
		} catch (Exception e) {
            printSysErr(e, logger);
            return "error";
		}
    	
    	// 返回前台结果
    	getRequest().getSession().setAttribute("teaIncome", teaIncome);
    	
    	JSONObject json = JSONObject.fromObject(teaIncome);
    	printEndLog("提现页面结束返回值:", json.toString(), logger);
    	
//		json.element("code", KeConstant.KE_SUCCESS);
//		print(json);
		
		return "teaWithdraw";
	}
	
    /**
     * 推广老师提现申请
     */
    public void withdrawCash(){
    	
    	printStartLog("方法开始withdrawCash()", logger);
    	printParamsLog("推广老师提现参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keManage.getTeacherId(),
				keManage.getOutputMoney(),
				keManage.getToAccount(),
				keManage.getToName(),
				keManage.getPassword(),
				keManage.getUserFlag())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1001\",\"message\":\"系统出错啦,请重新登录\"}");
			return;
		}
		
		// 以下验证已改成点击提现按钮时，做验证,可删除
//		 判断是否是周二或周五
//		int week = DateUtil.getWeekOfCurrentDate();
//		if(week != 2 && week != 5){
//			print("{\"code\":\"1001\",\"message\":\"提现日期仅限每周二和每周五哦\"}");
//			return;
//		}
//		
//		// 判断是否是1号
//		String systemDate = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
//		if(!systemDate.endsWith("01")){
//			print("{\"code\":\"1001\",\"message\":\"您来早啦，下月1号再来提现哦！\"}");
//			return;
//		}
		
		// 判断提现金额是否大于1
		if(Double.parseDouble(keManage.getOutputMoney()) <= 1){
			print("{\"code\":\"1001\",\"message\":\"每次提现金额不能小于1元！\"}");
			return;
		}
    		
		try {
    		// 判断当天是否已经提现
    		List<KeTeaIncomeRcd> outputRcds = manageService.selOutMoneyToday(keManage);
    		if(outputRcds.size() > 0){
    			print("{\"code\":\"1001\",\"message\":\"本月已提现，下次再来！\"}");
    			return;
    		}
    		
    		// 查询账户余额是否大于提现金额
    		KeTeaIncome teaIncome = manageService.selTeaIncomeTotal(keManage);
    		if(Double.parseDouble(teaIncome.getInputIncome()) < Double.parseDouble(keManage.getOutputMoney())){
    			print("{\"code\":\"1001\",\"message\":\"账户余额不足\"}");
    			return;
    		}
    		
    		// 判断提现金额是否超过5000
    		if(Double.parseDouble(keManage.getOutputMoney()) > 5000){
    			print("{\"code\":\"1001\",\"message\":\"单次提现金额不能超过5000\"}");
    			return;
    		}
    		
			KeTeaUs keTeaUs = new KeTeaUs();
			//设置查询条件参数
			keTeaUs.setPhoneNumber(keManage.getTeacherId());
			keTeaUs.setPassword(keManage.getPassword());
			
			//判断机构或用户密码是否正确
			boolean rightFlag = false;
			if("0".equals(keManage.getUserFlag())){
				
				//登录查询数据
				// 普通老师
				Map<String, Object> teaMap = teaUsService.teaLogin(keTeaUs);
				if (teaMap != null) {
					rightFlag = true;
				}
				
			}else if("1".equals(keManage.getUserFlag())){
				
				// 推广机构
				KeOrg keOrg = new KeOrg();
				keOrg.setOrgId(keManage.getTeacherId());
				Map<String, Object> orgMap = orgService.selOrgInfoWithId(keOrg);
				String orgPwd = orgMap.get("password").toString();
				if(keManage.getPassword().equals(orgPwd)){
					rightFlag = true;
				}
			}
			
			if (!rightFlag) {
				// 登录失败
				print("{\"code\":\"1001\",\"message\":\"登录密码不正确\"}");
				printParamsJSON(logger);
				return;
			}		
    		
			// 添加提现记录
			KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
			teaIncomeRcd.setTeacherId(keManage.getTeacherId());
			teaIncomeRcd.setType(KeConstant.TYPE_OUT);
			teaIncomeRcd.setStatus(KeConstant.APPLICATION_STATUS_ZERO);
			teaIncomeRcd.setToAccount(keManage.getToAccount());
			teaIncomeRcd.setToName(keManage.getToName());
			
			// 手续费计算
			// 用户区分  0:老师 1:推广机构
			String userFlag = keManage.getUserFlag();
			String outputMoney = keManage.getOutputMoney();
			String charge = getCharge(outputMoney, userFlag);
			String realityAmount = getRealityAmount(outputMoney, charge);
			
			// 设置到账金额和手续费
			teaIncomeRcd.setAmount(realityAmount);
			teaIncomeRcd.setCharge(charge);
			
			// 说明
			teaIncomeRcd.setComment("");
			
			// 流水号
			String randomCode = SendCodeUtil.random(4);
			String serialNumber = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS)+randomCode;
			teaIncomeRcd.setSerialNumber(serialNumber);
			//插入提现记录
    		manageService.insTeaOutRcd(teaIncomeRcd);
    		
    		//老师提现,更改已提现金额
    		manageService.updateTeaIncome(keManage);
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}
    	
    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		print(json);

		// 请求结束log
		printEndLog("推广老师提现结束返回值:", json.toString(), logger);

    }
    
    /**
     * 
     * @param amount 金额
     * @param charge 手续费
     * @return
     */
    private String getRealityAmount(String amount, String charge){
    	
    	if(CheckUtil.isNullOrEmpty(amount) || CheckUtil.isNullOrEmpty(charge)){
    		return "0";
    	}
    	
    	double amountDou = Double.parseDouble(amount);
    	double chargeDou = Double.parseDouble(charge);
    	double reality = amountDou - chargeDou;
    	
    	return String.valueOf(reality);
    }
    
	/**
	 * 计算提现金额手续费
	 * 
	 * @param amount
	 *            金额
	 * @param userFlag
	 *            用户标记
	 * @return
	 */
	private String getCharge(String amount, String userFlag) {

		String charge = "0";
		if (CheckUtil.isNullOrEmpty(amount)) {
			return "0";
		}

		// 普通老师用户
		if ("0".equals(userFlag)) {

			// 普通老师手续费0
			charge = "0";
		} else if ("1".equals(userFlag)) {

			// 机构用户手续费计算
			// 单笔最低收费1元，最高收费25。其他按0.5%收费
			double amountDou = Double.parseDouble(amount);
			double chargeDou = amountDou * 0.005;
			if (chargeDou < 1) {
				charge = "1";
			} else if (chargeDou > 25) {
				charge = "25";
			} else {
				DecimalFormat df = new DecimalFormat("0.00");
				charge = df.format(chargeDou);
			}
		} else {
			charge = "0";
		}

		return charge;
	}
	
	/**
	 * 推广检索提现申请记录
	 */
	public void searchPayRecordTg() {
		
    	printStartLog("方法开始searchPayRecordTg", logger);
    	printParamsLog("推广检索提现申请记录参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keManage.getSearchType())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			return;
		}
		
		try {
			List<KeTeaIncomeRcd> res = manageService.searchPayRecordTg(keManage);
			JSONArray jsonList = JSONArray.fromObject(res);
			JSONObject json = new JSONObject();
			json.element("total", res.size());
			json.element("rows", jsonList.toString());
			print(json);
			
			// 请求结束log
			printEndLog("推广检索提现申请结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
	}
	
	/**
	 * 推广批量支付
	 */
	public String batchTransTg() {
		
    	printStartLog("方法开始batchTransTg", logger);
    	printParamsLog("推广批量支付参数:", logger);

		//付款总金额
		double batchFee = 0;
		//付款详细数据
		StringBuilder detailData = new StringBuilder();
		//批次号
		String batchNo = "";
		
		List<KeTeaIncomeRcd> teaRecords = null;
		try {
			// DB检索付款申请对象(未付款或付款中断查询)
//			keManage.setSearchType("0");//用户申请中
			teaRecords = manageService.searchPayRecordTg(keManage);
			
			if(!String.valueOf(teaRecords.size()).equals(keManage.getBatchNum())){
				getRequest().setAttribute("message", "申请信息有变更 请重新检索");
				return "messagePage";
			}

			// 转账批次号和状态修改(商户申请中)
			batchNo = teaRecords.get(0).getBatchNo();
			keManage.setBatchNo(batchNo);
			manageService.updatePayStatusTg(keManage);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
		
		for (int i = 0; i < teaRecords.size(); i++) {
			KeTeaIncomeRcd rcd = teaRecords.get(i);
			if(i > 0){
				detailData.append(KeConstant.VERTICAL_LINE);
			}

			// 付款明细
			detailData.append(rcd.getSerialNumber());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append(rcd.getToAccount());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append(rcd.getToName());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append(rcd.getAmount());
			detailData.append(KeConstant.ALIPAY_DELIMITER);
			detailData.append("课课软件推广提成");
			
			// 付款总金额
			batchFee = batchFee + Double.parseDouble(rcd.getAmount());
		}
		
		String payDate = batchNo.substring(0, 8);//付款当天日期
		String batchNum = String.valueOf(teaRecords.size());//付款笔数
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "batch_trans_notify");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("notify_url", KeCommon.ALIPAY_NOTIFY_TG_URL);
		sParaTemp.put("email", KeCommon.EMAIL);
		sParaTemp.put("account_name", KeCommon.ACCOUNT_NAME);
		sParaTemp.put("pay_date", payDate);
		sParaTemp.put("batch_no", batchNo);
		sParaTemp.put("batch_fee", String.valueOf(batchFee));
		sParaTemp.put("batch_num", batchNum);
		sParaTemp.put("detail_data", detailData.toString());
		
		printDebugLog("-----支付参数:--"+sParaTemp.toString(),logger);
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
		getRequest().setAttribute("alipayReq", sHtmlText);
		
		// 请求结束log
		printEndLog("推广批量支付结束返回值:", sHtmlText, logger);
		
		return "alipay";
	}
	
	/**
	 * 推广支付宝回调处理
	 */
	@SuppressWarnings("rawtypes")
	public void alipayNotifyTg() {

		printStartLog("方法开始alipayNotifyTg", logger);
		printParamsLog("推广支付宝回调处理参数:", logger);

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
		if (AlipayNotify.verify(params)) {

			logger.debug("验证成功");

			try {

				// 查询批次番号
				Integer searchBatchNo = manageService.searchBatchNoTg(params.get("batch_no"));
				if (searchBatchNo > 0) {
					printDebugLog("！！！！！！！！已经批量处理过！！！！！！！", logger);
					return;
				}

				String batchNo = params.get("batch_no");
				// 批量付款数据中转账成功的详细信息
				if (!CheckUtil.isNullOrEmpty(params.get("success_details"))) {
					String success_details = new String(params.get("success_details").getBytes("ISO-8859-1"), "UTF-8");
					String sucAray[] = success_details.split(KeConstant.ALIPAY_VERTICAL_LINE);
					for (String detail : sucAray) {
						String alipayInfo[] = detail.split(KeConstant.ALIPAY_DELIMITER_TWO);
						KeTeaIncomeRcd incomeRcd = new KeTeaIncomeRcd();
						incomeRcd.setSerialNumber(alipayInfo[0]);
						incomeRcd.setBatchNo(batchNo);
						incomeRcd.setResult(alipayInfo[4]);
						incomeRcd.setReason(alipayInfo[5]);
						incomeRcd.setAlipayNumber(alipayInfo[6]);
						incomeRcd.setFinishTime(alipayInfo[7]);
						manageService.updateAipayInfoTg(incomeRcd);
					}
				} else {
					printDebugLog("没有支付成功的信息", logger);
				}

				// 批量付款数据中转账失败的详细信息
				if (!CheckUtil.isNullOrEmpty(params.get("fail_details"))) {
					String fail_details = new String(params.get("fail_details").getBytes("ISO-8859-1"), "UTF-8");

					String failAray[] = fail_details.split(KeConstant.ALIPAY_VERTICAL_LINE);
					for (String detail : failAray) {
						String alipayInfo[] = detail.split(KeConstant.ALIPAY_DELIMITER_TWO);
						KeTeaIncomeRcd incomeRcd = new KeTeaIncomeRcd();
						incomeRcd.setBatchNo(batchNo);
						incomeRcd.setSerialNumber(alipayInfo[0]);
						incomeRcd.setToAccount(alipayInfo[1]);
						incomeRcd.setToName(alipayInfo[2]);
						incomeRcd.setAmount(alipayInfo[3]);
						incomeRcd.setResult(alipayInfo[4]);
						incomeRcd.setReason(alipayInfo[5]);
						incomeRcd.setAlipayNumber(alipayInfo[6]);
						incomeRcd.setFinishTime(alipayInfo[7]);
						manageService.updateAipayInfoTg(incomeRcd);

						// 查询老师ID
						KeTeaIncomeRcd rls = manageService.selRcdWithSerNumTg(incomeRcd);
						incomeRcd.setTeacherId(rls.getTeacherId());

						// 支付失败，金额退回
						manageService.returnTeaIncomeTg(incomeRcd);

						// 添加退回记录
						KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
						teaIncomeRcd.setBatchNo(batchNo);
						teaIncomeRcd.setTeacherId(rls.getTeacherId());
						teaIncomeRcd.setAmount(alipayInfo[3]);
						teaIncomeRcd.setType(KeConstant.TYPE_IN);
						teaIncomeRcd.setReason("退款");
						manageService.insTeaIncomeRcdTg(teaIncomeRcd);
					}
				} else {
					printDebugLog("没有支付失败的信息", logger);
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
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
		printEndLog("推广支付宝回调结束", "", logger);
	}
	
	/**
	 * 查询SID使用详情
	 */
	public void sidUserList() {
		printStartLog("方法开始sidUserList", logger);
		printParamsLog("查询SID使用详情处理参数:", logger);
		
		int start = (getPage() - 1) * getRows();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teacherId", keManage.getTeacherId());
		map.put("page", start);
		map.put("size", getRows());
		map.put("startDate", keManage.getStartDate());
		map.put("endDate", keManage.getEndDate());
		
		try {
			
			// 查询SID使用个数
			Integer rst = manageService.countSidWithTeaId(map);
			
			// 查询SID使用详情
			List<Map<String,Object>> list = manageService.selSidInfoWithTeaId(map);
			
			// 返回结果
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONObject json = new JSONObject();
			json.element("total", rst);
			json.element("rows", jsonList.toString());
			print(json);
			
			// 请求结束log
			printEndLog("查询SID使用详情结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
	/**
	 * 管理员退出账号
	 */
	public String logoutAdmin() {
		printStartLog("方法开始logoutAdmin", logger);
		printParamsLog("管理员退出账号处理参数:", logger);

		getSession().removeAttribute("userId");
		
		// 请求结束log
		printEndLog("管理员退出账号结束返回值:", "", logger);
		
		return "adminLogin";
	}
	
	/**
	 * 退出账号
	 */
	public String logout() {
		printStartLog("方法开始logout", logger);
		printParamsLog("退出账号处理参数:", logger);
		
		getSession().removeAttribute("userId");
		getSession().removeAttribute("userName");
		getSession().removeAttribute("cityCode");
		getSession().removeAttribute("provinceCode");
		getSession().removeAttribute("grade");
		getSession().removeAttribute("subjectType");
		getSession().removeAttribute("userFlag");
		
		// 请求结束log
		printEndLog("退出账号结束返回值:", "", logger);
		
		return "login";
	}
	
	/**
	 * 查询心愿内容
	 */
	public void wishList() {
		printStartLog("方法开始wishList", logger);
		printParamsLog("查询心愿内容参数:", logger);
		
		int start = (getPage() - 1) * getRows();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", start);
		map.put("size", getRows());
		
		try {
			
			// 查询心愿内容个数
			Integer rst = manageService.countWish(map);
			
			// 查询心愿内容详情
			List<Map<String,Object>> list = manageService.selWishList(map);
			
			// 返回结果
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONObject json = new JSONObject();
			json.element("total", rst);
			json.element("rows", jsonList.toString());
			print(json);
			
			// 请求结束log
			printEndLog("查询心愿内容结束返回值:", json.toString(), logger);
		} catch (Exception e) {
			printSysErr(e, logger);
		}
	}
	
    /**
     * 手动给某个用户加油
     * 加油站
     */
    public void addOil(){
    	
    	printStartLog("方法开始addOil()", logger);
    	printParamsLog("加油站参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keManage.getPhoneNumber(),
				keManage.getOil(),
				keManage.getComment())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"1001\",\"message\":\"系统出错啦,请重新登录\"}");
			return;
		}
		
		// 判断油量是否大于1
		if(Integer.parseInt(keManage.getOil()) < 1){
			print("{\"code\":\"1001\",\"message\":\"每次加油不能小于1L！\"}");
			return;
		}
    		
		try {

			String userId = "";
			
			// 判断是手机号还是三方ID
			if(keManage.getPhoneNumber().length() == 11){
				
				// 根据手机号查找用户ID
				KeUser keUser = new KeUser();
				keUser.setPhoneNumber(keManage.getPhoneNumber());
				List<Map<String, Object>> userList = userService.selUserWithPhoneNum(keUser);
				if(userList.size() == 0){
					
					print("{\"code\":\"1001\",\"message\":\"该用户未注册\"}");
					printErrorLog("该用户未注册", logger);
					return;
				}else  if(userList.size() > 1){
					print("{\"code\":\"1001\",\"message\":\"查找到多个账号\"}");
					printErrorLog("查找到多个账号", logger);
					return;
				}
				userId = userList.get(0).get("user_id").toString();
			}else{
				
				//查找第三方是否已注册
				KeUser keUser= new KeUser();
				keUser.setUserId(keManage.getPhoneNumber());
				Map<String, Object> user = userService.QQWeChatRegist(keUser);
				if(user == null){
					print("{\"code\":\"1001\",\"message\":\"该用户未注册\"}");
					printErrorLog("该用户未注册", logger);
					return;
				}
				userId = user.get("user_id").toString();
			}
			
			// 自动加油功能
			boolean result = KeCommon.autoAddOil(payService, userId, keManage.getOil(), keManage.getComment());
			if(result){
				//加油成功
				print("{\"code\":\"1000\",\"message\":\"加油成功\"}");
			}else{
				//加油失败
				print("{\"code\":\"1001\",\"message\":\"加油失败\"}");
			}
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}

		// 请求结束log
		printEndLog("==用户加油结束==", "", logger);
    }
	////////////////////以上为老师后台业务/////////////////////////
	
	
	/**
	 * 批改支付页面跳转
	 * @return
	 */
	public String toBatchTrans(){
		return "batchTrans";
	}
	
	/**
	 * 推广支付页面跳转
	 * @return
	 */
	public String toBatchTransTg(){
		return "batchTransTg";
	}
	
	/**
	 * 日均增长页面跳转
	 * @return
	 */
	public String toDayadd(){
		return "dataadd";
	}
	
	/**
	 * 收入支出页面跳转
	 * @return
	 */
	public String toProfit(){
		return "profit";
	}
	
	/**
	 * 营销页面(fidsid)页面跳转
	 * @return
	 */
	public String toFidSid(){
		return "fidsid";
	}
	
	/**
	 * 提现金额页面跳转
	 * @return
	 */
	public String toTixian(){
		return "tixian";
	}
	
	/**
	 * 提现账号信息页面跳转
	 * @return
	 */
	public String toAccountInfo(){
		return "accountInfo";
	}
	
	/**
	 * 提现成功页面跳转
	 * @return
	 */
	public String toTixianOk(){
		return "tixianOk";
	}
	
	/**
	 * SID使用详情页面跳转
	 * @return
	 */
	public String toSidUserList(){
		return "sidUserList";
	}
	
	/**
	 * 心愿学分页面跳转
	 * @return
	 */
	public String toWish(){
		return "wish";
	}
	
	/**
	 * 加油站页面跳转
	 * @return
	 */
	public String toAddOil(){
		return "addOil";
	}
	
	/**
	 * 作业图片页面跳转
	 * @return
	 */
	/**
	 * @return
	 */
	public String toPhoto(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("photoId", keManage.getPhotoId());
		
		try{
			
			// 查询作业批改情况
			List<Map<String, Object>> list = manageService.selPhotoInfo(map);
			JSONArray jsonArr = JSONArray.fromObject(list);
			
			String address = list.get(0).get("photo_url").toString();
			String qiniuUrl = KeCommon.getUrlSign(address);
			getRequest().setAttribute("qiniuUrl", qiniuUrl);
			getRequest().setAttribute("data", jsonArr.toString());
			
		} catch (Exception e) {
            printSysErr(e, logger);
		}
		
		return "photo";
	}
}
