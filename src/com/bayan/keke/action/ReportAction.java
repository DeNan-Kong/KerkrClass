package com.bayan.keke.action;

import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.ReportService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeReport;
import com.bayan.keke.vo.KeSubject;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import net.sf.json.JSONObject;

public class ReportAction extends BaseAction implements ModelDriven<KeReport>,
		Preparable {
	//输出日志
	private static final Logger logger = Logger.getLogger(ReportAction.class);
	/* */
	private static final long serialVersionUID = 7178649661289229295L;
	/* */
	@Resource
	private ReportService reportService;
	@Resource
    private SubjectService subjectService;
	/* */
	private KeReport keReport;

	/* */
	@Override
	public void prepare() throws Exception {
		keReport = new KeReport();
	}

	@Override
	public KeReport getModel() {
		return keReport;
	}

	/**
	 * 学生举报
	 */
	public void add(){
		try {
			printStartLog("add方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keReport.getUserId(),
					keReport.getPhotoId(),
					keReport.getComment())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}			
			
			//查找举报的照片对应的作业信息
			Map<String,Object> rep = reportService.selReport(keReport);
			if (rep == null) {
				print("{\"code\":\"1001\",\"message\":\"举报处理失败\"}");
				printErrorLog("找不到对应的作业信息", logger);
				return;
			}else {
				//截取举报内容，不得超过50个字
				String com = keReport.getComment();
				if (com.length() > 50) {
					com = com.substring(0,50);
				}
				keReport.setComment(com);
				
				//取得被举报老师的ID
				String teaId = rep.get("teacher_id").toString();
				keReport.setTeacherId(teaId);
				
				//插入一条举报记录
				Integer repInt = reportService.insReport(keReport);
				if (repInt > 0) {
					printDebugLog("举报信息插入成功", logger);
				}else {
					printErrorLog("举报信息插入失败", logger);
					print("{\"code\":\"1001\",\"message\":\"举报处理失败\"}");
					return;
				}
								
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("message", "举报提交成功");
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
	 * 学生举报是否需要重新检查作业
	 */
	public void reCheck(){
		try {
			printStartLog("reCheck方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					keReport.getUserId(),
					keReport.getPhotoId(),
					keReport.getReCheck())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}	
			
			//查找举报的照片对应的作业信息
			Map<String,Object> rep = reportService.selReport(keReport);
			if (rep == null) {
				print("{\"code\":\"1001\",\"message\":\"举报处理失败\"}");
				printErrorLog("找不到对应的作业信息", logger);
				return;
			}else {
				//取得被举报的作业信息
				String teaId = rep.get("teacher_id").toString();
				String phSort = rep.get("photo_sort").toString();
				String groId = rep.get("group_id").toString();
				String phUrl = rep.get("photo_url").toString();
				String subId = rep.get("subject_id").toString();
				String width = rep.get("width").toString();
				String height = rep.get("height").toString();
				keReport.setTeacherId(teaId);
				
				//若不需要重新检查则只插入举报的记录信息
				if ("1".equals(keReport.getReCheck())) {
					//更新被举报作业的状态值
					Integer upTask = reportService.upTaskStatus(keReport);
					if (upTask > 0) {
						printDebugLog("举报作业状态更新成功", logger);
					}else {
						printErrorLog("举报作业状态更新失败", logger);
						print("{\"code\":\"1001\",\"message\":\"举报处理失败\"}");
						return;
					}
					// 系统时间
					String systemTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMDHMSS);
					// 4位随机数
					String randomCode = SendCodeUtil.random(4);
			        String photoId = systemTime + KeConstant.PHOTO_REP_END + randomCode;
			        
			        KeSubject keSubject = new KeSubject();
					//设置新作业所需要的参数
					keSubject.setUserId(keReport.getUserId());
					//更换图片ID
					keSubject.setPhotoId(photoId);
					keSubject.setPhotoSort(phSort);
					keSubject.setGroupId(groId);
					keSubject.setQiniuKey(phUrl);
					keSubject.setTaskStatus(KeConstant.UNCORRECTED);
					keSubject.setSubjectType(subId);
					//取得被举报图片的宽高
					keSubject.setWidth(width);
					keSubject.setHeight(height);
					//插入一条新的作业信息						
					Integer subInt = subjectService.addTask(keSubject);
					if (subInt > 0) {
						//
						JSONObject obj = new JSONObject();
						obj.element("code", KeConstant.KE_SUCCESS);
						obj.element("message", "课课老师将会为您重新检查作业");
						print(obj);
						printDebugLog("举报后新作业插入成功", logger);
					}else {
						printErrorLog("举报后新作业插入失败", logger);
						print("{\"code\":\"1001\",\"message\":\"举报处理失败\"}");
						return;
					}
				}else{
					printDebugLog("举报作业不需要重新检查", logger);						
				}
			}			
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
	
	
	
}
