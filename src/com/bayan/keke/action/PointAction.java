package com.bayan.keke.action;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.PointService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.vo.KePoint;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONObject;

public class PointAction extends BaseAction implements ModelDriven<KePoint>,
		Preparable {
	//输出日志
	private static final Logger logger = Logger.getLogger(PointAction.class);
	/* */
	private static final long serialVersionUID = 7178649661289229295L;
	/* */
	@Resource
	private PointService pointService;
	/* */
	private KePoint kePoint;
	
	/* */
	public KePoint getModel() {
		return kePoint;
	}
	/* */
	public void prepare() throws Exception {
		kePoint = new KePoint();
	}
	
	/**
	 * 统计学分
	 */
	public void view(){
		try {
			printStartLog("view方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePoint.getUserId())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}else {
				//查询剩余学分总数
				String pointCount = pointService.viewPoint(kePoint);
				JSONObject obj = new JSONObject();
				obj.element("code", KeConstant.KE_SUCCESS);
				obj.element("pointCount", pointCount);
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
	 * 提交心愿单
	 */
	public void wish(){
		try {
			printStartLog("wish方法开始", logger);
			printParamsLog("请求参数。", logger);
			if (CheckUtil.checkNulls(
					kePoint.getUserId(),
					kePoint.getWishContent())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			}else {
				//截取心愿内容不超过50个字
            	String wc = kePoint.getWishContent();
            	if (wc.length() > 50) {
            		wc = wc.substring(0,50);
        		}
            	kePoint.setWishContent(wc);
            	
				//更新心愿内容
				Integer upPoint = pointService.wishPoint(kePoint);
				if (upPoint > 0) {
					//查询剩余学分总数
					String pointCount = pointService.viewPoint(kePoint);
					JSONObject obj = new JSONObject();
					obj.element("code", KeConstant.KE_SUCCESS);
					obj.element("pointCount", pointCount);
					print(obj);
					printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);					
				}else{
					print("{\"code\":\"1001\",\"message\":\"许愿失败\"}");
					printErrorLog("心愿内容插入失败", logger);
					return;
				}
			}
		} catch (Exception e) {
			// 服务器内部错误
			printSysErr(e, logger);
			return;
		}
	}
}
