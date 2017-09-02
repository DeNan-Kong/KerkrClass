package com.bayan.keke.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.NeteaseService;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.service.TeaSubService;
import com.bayan.keke.service.TeaUsService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeMark;
import com.bayan.keke.vo.KeMarkDb;
import com.bayan.keke.vo.KeNetease;
import com.bayan.keke.vo.KeTeaIncome;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaSub;
import com.bayan.keke.vo.KeTeaUs;
import com.bayan.keke.vo.TaskVo;
import com.bayan.keke.vo.WorkJsonVo;
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
public class TeaSubAction extends BaseAction 
    implements ModelDriven<KeTeaSub>, Preparable {

	/**
     * serialVersionUID
     */
	private static final long serialVersionUID = -3853795406341802248L;

    private static final Logger logger = Logger.getLogger(TeaSubAction.class);
    
    private KeTeaSub keTeaSub;

    @Resource
    private TeaSubService teaSubService;
    
	@Resource
	private TeaUsService teaUsService;
	
    @Resource
    private SubjectService subjectService;
    
    @Resource
    private PayService payService;
    
    @Resource
	private NeteaseService neteaseService;
    
    @Override
    public void prepare() throws Exception {
    	keTeaSub = new KeTeaSub();
    }

    @Override
    public KeTeaSub getModel() {
        return keTeaSub;
    }

    /**
     * 教师资格证审查状态
     */
    public void check(){
    	printStartLog("方法开始check", logger);
    	printParamsLog("教师资格证审核状态请求参数:", logger);
    	
    	// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId()
				)) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			// 判断是否有教师资格
    		KeTeaUs keTeaUs = new KeTeaUs();
    		keTeaUs.setTeacherId(keTeaSub.getTeacherId());
    		String status = teaUsService.teaApprove(keTeaUs);    		
			//判断是否审查通过,通过之后直接跳转到开始批改画面
			if ("APPROVED".equals(status)) {
				//审查通过
				print("{\"code\":\"1000\",\"message\":\"教师资格证审核通过\"}");
				printEndLog("教师资格证审核通过,teacherid=", keTeaSub.getTeacherId(), logger);
				return;
			}else if ("NEW".equals(status)) {
				//正在审查
				print("{\"code\":\"1003\",\"message\":\"教师资格证审核需要大约三个工作日\"}");
				printEndLog("教师资格证审核中,teacherid=", keTeaSub.getTeacherId(), logger);
				return;
			}else {
				//审查不通过，重新注册
				print("{\"code\":\"1004\",\"message\":\"请重新上传教师资格证\"}");
				printEndLog("资格证审查不通过,teacherid=", keTeaSub.getTeacherId(), logger);
				return;
			}
		} catch (Exception e) {
			 //
			 printSysErr(e, logger);
	         return;
		}
    }
    
    /**
     * 作业批改(开始)
     */
    public void start(){
    	
    	printStartLog("方法开始start", logger);
    	printParamsLog("作业批改(开始)参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(), 
				keTeaSub.getSubjectType())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
    	TaskVo task=null;
    	try {
    		
			// 把老师云信状态改为未通话,防止因各种bug，和杀掉进程，死机等导致老师状态一直在线。
			KeNetease netease = new KeNetease();
			netease.setTeacherId(keTeaSub.getTeacherId());
			Map<String, Object> accTea = neteaseService.TeaRegist(netease);
			if(accTea != null && "1".equals(accTea.get("status").toString())){
				printDebugLog("更新老师云信状态", logger);
				netease.setServiceStatus("0");//离线
				neteaseService.upTeaStatusYX(netease);// 老师状态改为离线
			}
			
    		//取得批改作业老师的组织
    		String orgId = teaSubService.getOrgId(keTeaSub);
    		if(CheckUtil.isNullOrEmpty(orgId)){
				print("{\"code\":\"1005\",\"message\":\"您还没有加入培训机构\"}");
				printDebugLog("老师不存在", logger);
				return;
    		}
    		keTeaSub.setOrgId(orgId);
    		
    		// 判断该老师有没有正在批改的作业
    		List<TaskVo> taskList = teaSubService.getCorrectingTask(keTeaSub);
	    		if(taskList != null && taskList.size() > 0){
	    			//有正在批改的作业时，直接返回正在批改的作业信息给前端
	    			// 生成七牛下载url
	    	    	String photoUrl = KeCommon.getUrlSign(taskList.get(0).getPhotoUrl());
	    	    	
	    			JSONObject json = new JSONObject();
	    			json.element("code", KeConstant.KE_SUCCESS);
	    			json.element("groupId", taskList.get(0).getGroupId());
	    			json.element("photoId", taskList.get(0).getPhotoId());
	    			json.element("photoSort", taskList.get(0).getPhotoSort());
	    			json.element("photoUrl", photoUrl);
	    			json.element("width", taskList.get(0).getWidth());
	    			json.element("height", taskList.get(0).getHeight());
	    			//返回学生作业上传时间和学生所在地
	    			json.element("userName", taskList.get(0).getUserName());
	    			json.element("createTime", taskList.get(0).getCreateTime());
	    			print(json);	    	
	    			// 请求结束log
	    			printEndLog("作业批改(开始)结束返回值:", json.toString(), logger);
	    			return;
    		}else {
    			//查找未批改状态的作业    			
    			//查找数据库未批改的作业份数		
    			String taskCnt = teaSubService.taskActive(keTeaSub);
    			// 没有未批改的作业
    			if("0".equals(taskCnt)){
    				print("{\"code\":\"1003\",\"message\":\"现在没有作业可以批改哦\"}");
    				return;
    			}
    			
    			// 查询数据库中同一科目未批改的作业
    			task = teaSubService.getUncorrectedTask(keTeaSub);
    			
    			// 没有未批改的作业
    			if(task == null){
    				print("{\"code\":\"1002\",\"message\":\"您所在的年级没有作业\"}");
    				return;
    			}
    			
    			// 更新作业状态和批改老师
    			task.setTeacherId(keTeaSub.getTeacherId());
    			Integer res = teaSubService.updateTaskStatus(task);
    			if(res == 0){
    				//抓取图片更新状态不成功时
    				print("{\"code\":\"1004\",\"message\":\"下载作业照片不成功\"}");	
    				return;
    			}
    		}
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}
    	
    	// 生成七牛下载url
    	String photoUrl = KeCommon.getUrlSign(task.getPhotoUrl());
    	
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("groupId", task.getGroupId());
		json.element("photoId", task.getPhotoId());
		json.element("photoSort", task.getPhotoSort());
		json.element("photoUrl", photoUrl);
		json.element("width", task.getWidth());
		json.element("height", task.getHeight());
		//返回学生作业上传时间和学生所在地
		json.element("createTime", task.getCreateTime());
		json.element("userName", task.getUserName());
		print(json);
    	
		// 请求结束log
		printEndLog("作业批改(开始)结束返回值:", json.toString(), logger);
    }
    
    /**
     * 查看前一张照片
     */
    public void previous(){
    	
    	printStartLog("方法开始previous()", logger);
    	printParamsLog("查看前一张照片参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(), 
				keTeaSub.getSubjectType(),
				keTeaSub.getPhotoId(),
				keTeaSub.getGroupId(),
				keTeaSub.getPhotoSort())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
    	TaskVo task = null;
    	try {
    		
    		// 判断是否是第一张照片
    		if(KeConstant.PHOTO_SORT_FIRST.equals(keTeaSub.getPhotoSort())){
				print("{\"code\":\"1001\",\"message\":\"现在就是第一张作业哦\"}");
				return;
    		}
    		
    		// 前一张照片顺序
    		int prePhotoSort = Integer.parseInt(keTeaSub.getPhotoSort()) - 1;
    		String preSort = KeConstant.ZERO + String.valueOf(prePhotoSort);
    		keTeaSub.setPhotoSort(preSort);
    		
    		// 查询前一张照片
			task = teaSubService.getPreviousTask(keTeaSub);
			
			// 没有未批改的作业
			if(task == null){
				print("{\"code\":\"1002\",\"message\":\"没有找到前一张照片\"}");
				return;
			}
			
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}
    	
    	// 生成七牛下载url
    	String photoUrl = KeCommon.getUrlSign(task.getPhotoUrl());
    	
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "取得前一张作业成功");
		json.element("photoId", task.getPhotoId());
		json.element("photoUrl", photoUrl);
		json.element("width", task.getWidth());
		json.element("height", task.getHeight());
		print(json);
    	
		// 请求结束log
		printEndLog("查看前一张照片结束返回值:", json.toString(), logger);
    }
    
    /**
     * 放弃批改
     */
    public void giveUp(){
    	
    	printStartLog("方法开始giveUp()", logger);
    	printParamsLog("放弃批改参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(), 
				keTeaSub.getSubjectType(),
				keTeaSub.getPhotoId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
    	try {
    		Integer res = teaSubService.giveUpTask(keTeaSub);
			if(res == 0){
				print("{\"code\":\"1001\",\"message\":\"找不到对应的作业\"}");
				return;
			}
			//清除之前提交的作业标签点的信息
			teaSubService.deleteMark(keTeaSub);
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}

		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "作业已退回到作业池中");
		print(json);
    	
		// 请求结束log
		printEndLog("放弃批改结束返回值:", json.toString(), logger);
    }
    
    /**
     * 作业批改模糊图片
     */
    public void fuzzy(){
    	
    	printStartLog("方法开始fuzzy", logger);
    	printParamsLog("作业批改模糊图片参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(), 
				keTeaSub.getSubjectType(),
				keTeaSub.getPhotoId(),
				keTeaSub.getCause())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		List<String> alias = null;
    	try {
    		Integer res = teaSubService.fuzzyTask(keTeaSub);
			if(res == 0){
				print("{\"code\":\"1001\",\"message\":\"找不到对应的作业\"}");
				return;
			}
			//清除之前提交的作业标签点的信息
			teaSubService.deleteMark(keTeaSub);
			// 获取学生设备信息
			alias = teaSubService.getDevices(keTeaSub);
			if(alias == null || alias.size() == 0){
				print("{\"code\":\"1002\",\"message\":\"找不到学生的设备\"}");
				return;
			}
			
	    	// 退回学生1L油量
	    	Map<String,String> map = new HashMap<String, String>();
	    	map.put("photoId", keTeaSub.getPhotoId());
	    	Map<String,String> rst = payService.getTaskInfo(map);
	    	KeCommon.addOil(rst.get("user_id"), KeConstant.ONE_OIL, payService);
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}
    	
    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "作业退回成功");
		print(json);
		
		try {
			// 给学生推送消息
			boolean result = KeCommon.pushMsgToStu(alias, "您上传的作业不符合规范已被退回，请重新上传!", "作业已退回");
			if(!result){
				printErrorLog("消息推送失败", logger);
			}
			printDebugLog("您上传的作业不符合规范已被退回，请重新上传!", logger);
		} catch (APIConnectionException | APIRequestException e) {
			print("{\"code\":\"1000\"}");
			printSysErrServer(e, logger);
			return;
		}

		// 请求结束log
		printEndLog("作业批改模糊图片结束返回值:", json.toString(), logger);
    }

    /**
     * TODO 1.2(含)之前iOS版本使用
     * 作业批改结果
     */
    public void complete(){
    	
    	printStartLog("方法开始complete()", logger);
    	printParamsLog("作业批改结果参数:", logger);
    	
		try {
			
//			// TODO 测试用  Android直接传json对象  例:completeTeaSub.jspx?json=jsonData
//			InputStream inputStream = getRequest().getInputStream();
//			InputStreamReader isr = new InputStreamReader(inputStream);
//			BufferedReader br = new BufferedReader(isr);
//			StringBuilder sb = new StringBuilder();
//			String inputStr = "";
//			while((inputStr = br.readLine()) != null){
//				sb.append(inputStr);
//			}
//			String workJson = sb.toString();
			
			Map<String, String[]> map = this.getRequest().getParameterMap();
			String workJson ="";
			for (Entry<String, String[]> set : map.entrySet()) {
				workJson = set.getKey();
			}
			
			JSONObject jsonObj = JSONObject.fromObject(workJson);
			WorkJsonVo workVo = (WorkJsonVo) JSONObject.toBean(jsonObj, WorkJsonVo.class);
			
			// 参数验证
			if (CheckUtil.checkNulls(
					workVo.getTeacherId(), 
					workVo.getSubjectType(),
					workVo.getPhotoId())
					|| workVo.getPointsResult() == null
					|| workVo.getPointsResult().length == 0) {
	
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}

			keTeaSub.setTeacherId(workVo.getTeacherId());
			keTeaSub.setSubjectType(workVo.getSubjectType());			
			keTeaSub.setPhotoId(workVo.getPhotoId());
			//清除之前提交的作业标签点的信息
			teaSubService.deleteMark(keTeaSub);
			keTeaSub.setPointsResult(workVo.getPointsResult());
			List<TaskVo> taskList = teaSubService.getTaskWithPhotoId(keTeaSub);
			String taskUserId = null;
			String taskGroupId = null;
			String taskTeacherId = "";
			if(taskList != null && taskList.size() == 1){
				taskUserId = taskList.get(0).getUserId();
				taskGroupId = taskList.get(0).getGroupId();
				taskTeacherId = taskList.get(0).getTeacherId();
			}else{
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}
			
			// 判断是否是当前老师作业，防止由于批改时间过长，作业被放弃
			if(!workVo.getTeacherId().equals(taskTeacherId)){
				print("{\"code\":\"1001\",\"message\":\"批改时间太长 作业无效\"}");
				return;
			}
			
			// 编辑图片信息
			List<KeMarkDb> markList = new ArrayList<KeMarkDb>();
			for(KeMark mark : workVo.getPointsResult()){
				KeMarkDb markDb = new KeMarkDb();
				markDb.setUserId(taskUserId);
				markDb.setPhotoId(workVo.getPhotoId());
				markDb.setGroupId(taskGroupId);
				markDb.setPointx(mark.getPointx());
				markDb.setPointy(mark.getPointy());
				markDb.setResult(mark.getResult());
				markDb.setContent(mark.getContent());
				markDb.setDirection(mark.getDirection());
				if(KeConstant.RIGHT.equals(mark.getResult())){
					markDb.setResolvedFlag(KeConstant.RESOLVEDFLAG_OK);
				}else{
					markDb.setResolvedFlag(KeConstant.RESOLVEDFLAG_NG);
				}
				markList.add(markDb);
			}
			
			teaSubService.insertMarks(markList);
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
		
    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "标签信息保存成功");		
		print(json);
		
		// 请求结束log
		printEndLog("作业批改结果结束返回值:", json.toString(), logger);
    }

    /**
     * TODO 安卓和最新版iOS使用该接口
     * 作业批改结果
     */
    public void correct(){
    	
    	printStartLog("方法开始correct()", logger);
    	printParamsLog("作业开始批改参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keTeaSub.getWorkJson())) {
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			JSONObject jsonObj = JSONObject.fromObject(keTeaSub.getWorkJson());
			WorkJsonVo workVo = (WorkJsonVo) JSONObject.toBean(jsonObj, WorkJsonVo.class);
			
			// 参数验证
			if (CheckUtil.checkNulls(
					workVo.getTeacherId(), 
					workVo.getSubjectType(),
					workVo.getPhotoId())
					|| workVo.getPointsResult() == null
					|| workVo.getPointsResult().length == 0) {
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}

			keTeaSub.setTeacherId(workVo.getTeacherId());
			keTeaSub.setSubjectType(workVo.getSubjectType());			
			keTeaSub.setPhotoId(workVo.getPhotoId());
			//清除之前提交的作业标签点的信息
			teaSubService.deleteMark(keTeaSub);
			keTeaSub.setPointsResult(workVo.getPointsResult());
			List<TaskVo> taskList = teaSubService.getTaskWithPhotoId(keTeaSub);
			String taskUserId = null;
			String taskGroupId = null;
			String taskTeacherId = "";
			if(taskList != null && taskList.size() == 1){
				taskUserId = taskList.get(0).getUserId();
				taskGroupId = taskList.get(0).getGroupId();
				taskTeacherId = taskList.get(0).getTeacherId();
			}else{
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}
			
			// 判断是否是当前老师作业，防止由于批改时间过长，作业被放弃
			if(!workVo.getTeacherId().equals(taskTeacherId)){
				print("{\"code\":\"1001\",\"message\":\"批改时间太长 作业无效\"}");
				return;
			}
			
			// 编辑图片信息
			List<KeMarkDb> markList = new ArrayList<KeMarkDb>();
			for(KeMark mark : workVo.getPointsResult()){
				KeMarkDb markDb = new KeMarkDb();
				markDb.setUserId(taskUserId);
				markDb.setPhotoId(workVo.getPhotoId());
				markDb.setGroupId(taskGroupId);
				markDb.setPointx(mark.getPointx());
				markDb.setPointy(mark.getPointy());
				markDb.setResult(mark.getResult());
				markDb.setContent(mark.getContent());
				markDb.setDirection(mark.getDirection());
				if(KeConstant.RIGHT.equals(mark.getResult())){
					markDb.setResolvedFlag(KeConstant.RESOLVEDFLAG_OK);
				}else{
					markDb.setResolvedFlag(KeConstant.RESOLVEDFLAG_NG);
				}
				markList.add(markDb);
			}
			
			teaSubService.insertMarks(markList);
		} catch (Exception e) {
			printSysErr(e, logger);
			return;
		}
		
    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "标签信息保存成功");		
		print(json);
		
		// 请求结束log
		printEndLog("作业批改结果结束返回值:", json.toString(), logger);
    }

    /**
     * 添加作业评语
     */
    public void addComment(){
    	
    	printStartLog("方法开始addComment()", logger);
    	printParamsLog("添加作业评语参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(), 
				keTeaSub.getSubjectType(),
				keTeaSub.getPhotoId(),
//				keTeaSub.getComment(),
				keTeaSub.getButtonFlag())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
    	try {
    		
    		// 作业状态改为完成
    		Integer res = teaSubService.addComment(keTeaSub);
			if(res == 0){
				print("{\"code\":\"1001\",\"message\":\"没找到对应的作业\"}");
				return;
			}
			
			// 判断是否3张都完成，完成的话给学生推送消息
			Integer uncorrectedCount = teaSubService.getUncorrectedCount(keTeaSub);
			if(uncorrectedCount == 0){
				// 给学生推送消息
				List<String> alias = teaSubService.getDevices(keTeaSub);
				
				// ！！！！！注意！！！！！请不要随意修改消息内容。IOS前端根据该消息内容，判断是否要加入消息中心。android根据标题判断  ！！！！！注意！！！！！
				boolean result = KeCommon.pushMsgToStu(alias, "您的作业已全部批改完成,请及时查看并记得给课课老师评分哦!", "作业批改完成");
				if(!result){
					printErrorLog("消息推送失败.", logger);
				}
				printDebugLog("您的作业已全部批改完成,请查看并给课课老师评分哦!", logger);
			}
    	} catch (APIConnectionException  e1) {
			printSysErrServer(e1, logger);
		} catch (APIRequestException  e2) {
			printSysErrServer(e2, logger);
		} catch (Exception e) {
			printSysErr(e, logger);
            return;
		}
    	
    	// 下一份作业请求的时候
    	if("1".equals(keTeaSub.getButtonFlag())){
			start();
    	}else{
    		
        	// 返回前台结果
    		JSONObject json = new JSONObject();
    		json.element("code", KeConstant.KE_SUCCESS);
    		json.element("message", "作业批改成功");    		
    		print(json);
    		// 请求结束log
    		printEndLog("添加作业评语结束返回值:", json.toString(), logger);
    	}
    }
    
    /**
     * 查询老师收益情况
     */
    public void selectIncome(){
    	
    	printStartLog("方法开始selectIncome()", logger);
    	printParamsLog("查询老师收益情况参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		KeTeaIncome teaIncome = null;
		String teaIncomeToday = "0";
		String finishCnt = "0";
		
    	try {
    		
    		// 查询老师总收入
    		teaIncome = teaSubService.selTeaIncomeTotal(keTeaSub);
    		//取得总收入为空时，设置为0
    		if (teaIncome == null) {
    			teaIncome = new KeTeaIncome();
				teaIncome.setTotalIncome("0");
				teaIncome.setInputIncome("0");
				teaIncome.setOutputIncome("0");
			}
    		
    		// 查询当天收入
    		teaIncomeToday = teaSubService.selTeaIncomeToday(keTeaSub);
    		
    		//如果老师收入为空则返回当天收益为：0
    		if (CheckUtil.isNullOrEmpty(teaIncomeToday)) {
				teaIncomeToday = "0";
				//格式化0.00
				teaIncomeToday = (new DecimalFormat("0.00").format(Integer.parseInt(teaIncomeToday)));
			}
    		
    		// 查询即将到账件数
    		finishCnt = teaSubService.selFinishCntWithTeaId(keTeaSub);
    		
    		//如果老师收入即将到账件数为空则返回：0
    		if (CheckUtil.isNullOrEmpty(finishCnt)) {
    			finishCnt = "0";
			}
    		//格式化0.00
    		finishCnt = (new DecimalFormat("0.00").format(Integer.parseInt(finishCnt)));
    		
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}
    	
    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("countAll", teaIncome.getTotalIncome());
		json.element("countTaked", teaIncomeToday);
		json.element("countRemain", teaIncome.getInputIncome());
		json.element("countSoon", finishCnt);
		print(json);

		// 请求结束log
		printEndLog("查询老师收益情况结束返回值:", json.toString(), logger);
    }
    
    /**
     * 老师提现
     */
    public void withdrawCash(){
    	
    	printStartLog("方法开始withdrawCash()", logger);
    	printParamsLog("老师提现参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(),
				keTeaSub.getOutputMoney(),
				keTeaSub.getToAccount(),
				keTeaSub.getToName(),
				keTeaSub.getPassword())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		// 判断是否是周五
		int week = DateUtil.getWeekOfCurrentDate();
		if(week != 5){
			print("{\"code\":\"1001\",\"message\":\"星期五才可以提现哦\"}");
			return;
		}

		// 判断提现金额是否大于10
		if(Double.parseDouble(keTeaSub.getOutputMoney()) < 10){
			print("{\"code\":\"1002\",\"message\":\"每次提现金额不能小于10元哦\"}");
			return;
		}
    		
		try {
    		// 判断当天是否已经提现
    		List<KeTeaIncomeRcd> outputRcds = teaSubService.selOutMoneyToday(keTeaSub);
    		if(outputRcds.size() > 0){
    			print("{\"code\":\"1003\",\"message\":\"提现日期为每周五且只能提现一次哦\"}");
    			return;
    		}
    		
    		// 查询账户余额是否大于提现金额
    		KeTeaIncome teaIncome = teaSubService.selTeaIncomeTotal(keTeaSub);
    		if(Double.parseDouble(teaIncome.getInputIncome()) < Double.parseDouble(keTeaSub.getOutputMoney())){
    			print("{\"code\":\"1004\",\"message\":\"账户余额不足\"}");
    			return;
    		}
    		
    		// 判断提现金额是否超过1000
    		if(Double.parseDouble(keTeaSub.getOutputMoney()) > 1000){
    			print("{\"code\":\"1005\",\"message\":\"单次提现金额不能超过1000哦\"}");
    			return;
    		}
			KeTeaUs keTeaUs = new KeTeaUs();
			//设置查询条件参数
			keTeaUs.setPhoneNumber(keTeaSub.getTeacherId());
			keTeaUs.setPassword(keTeaSub.getPassword());
			//登录查询数据
			Map<String, Object> teaUs = teaUsService.teaLogin(keTeaUs);
			if (teaUs == null) {
				// 登录失败
				print("{\"code\":\"1006\",\"message\":\"提现密码不正确\"}");
				printParamsJSON(logger);
				return;
			}		
    		
			// 添加提现记录
			KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
			teaIncomeRcd.setTeacherId(keTeaSub.getTeacherId());
			teaIncomeRcd.setAmount(keTeaSub.getOutputMoney());
			teaIncomeRcd.setType(KeConstant.TYPE_OUT);
			teaIncomeRcd.setStatus(KeConstant.APPLICATION_STATUS_ZERO);
			teaIncomeRcd.setToAccount(keTeaSub.getToAccount());
			teaIncomeRcd.setToName(keTeaSub.getToName());
			// 流水号
			String randomCode = SendCodeUtil.random(4);
			String serialNumber = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS)+randomCode;
			teaIncomeRcd.setSerialNumber(serialNumber);
			//插入提现记录
    		teaSubService.insTeaOutRcd(teaIncomeRcd);
    		
    		//老师提现,更改已提现金额
    		teaSubService.updateTeaIncome(keTeaSub);
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}
    	
    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "提现成功");		
		print(json);

		// 请求结束log
		printEndLog("老师提现结束返回值:", json.toString(), logger);
    }
    
    /**
     * 首次批改完成处理
     */
    public void demoOk(){
    	
    	printStartLog("方法开始demoOk()", logger);
    	printParamsLog("作业批改结果参数:", logger);

		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId(), 
				keTeaSub.getSubjectType(),
				keTeaSub.getComment())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			
			// 添加首次批改记录
			Integer rst = teaSubService.insFirstSub(keTeaSub);
			if(rst == 0){
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				return;
			}
			
			// 添加收益记录
			KeCommon.addTeaIncome(subjectService, keTeaSub.getTeacherId());
		} catch (Exception e) {
            printSysErr(e, logger);
            return;
		}

    	// 返回前台结果
		JSONObject json = new JSONObject();
		json.element("code", KeConstant.KE_SUCCESS);
		json.element("message", "作业批改成功");
		print(json);
		
		// 请求结束log
		printEndLog("首次批改完成处理结束返回值:", json.toString(), logger);
    }
    
    /**
     * 查询支付宝账号信息
     */
    public void zhifubaoInfo() {
    	printStartLog("方法开始zhifubaoInfo()", logger);
    	printParamsLog("作业批改结果参数:", logger);

		// 参数验证
		if (CheckUtil.checkNulls(
				keTeaSub.getTeacherId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
		
		try {
			Map<String, Object> zhi = teaSubService.zhiInfo(keTeaSub);
			if (zhi == null) {
				print("{\"code\":\"1001\",\"message\":\"没有找到支付宝信息\"}");
				printErrorLog("找不到对支付宝的信息", logger);
				return;
			}else {
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("toAccount", zhi.get("toAccount").toString());
				obj.element("toName", zhi.get("toName").toString());
				print(obj);
			}
		} catch (Exception e) {
			// 系统错误
			printSysErr(e, logger);
		}
		
	}
}
