package com.bayan.keke.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.VersionService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.vo.KeVersion;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONObject;

public class VersionAction extends BaseAction implements
		ModelDriven<KeVersion>, Preparable {
	//输出日志
	private static final Logger logger = Logger.getLogger(VersionAction.class);
	/* */
	private static final long serialVersionUID = 1L;
	
	/* */
	@Resource
	private VersionService versionService;
	/* */
	private KeVersion KeVersion;
	/* */
	public KeVersion getModel() {
		return KeVersion;
	}
	/* */
	public void prepare() throws Exception {
		KeVersion = new KeVersion();
	}

	/**
	 * 家长端版本更新提醒
	 */
	public void versionNotice() {
		try {
			printStartLog("versionNotice方法开始", logger);
	    	printParamsLog("请求参数。", logger);
	    	//设备类型:0iPhone、1Android .
			if (CheckUtil.checkNulls(
					KeVersion.getDeviceType(),
					KeVersion.getType())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} 
			//取得课课版本号
			Map<String, Object> ver = versionService.selectVersion(KeVersion);			
			if (ver == null) {
				//版本号取得失败
				print("{\"code\":\"1001\",\"message\":\"取不到版本号\"}");
				printErrorLog("取得版本号失败", logger);
				return;
			}
			
			// 暑期活动是否显示标记
			String isSummerAt = "0"; // 不显示
//			if(KeCommon.isSummerActivity()){
//				isSummerAt = "1"; //显示
//			}
			
			//返回值
			JSONObject json = new JSONObject();
			json.element("code", "1000");// 完善个人消息
			json.element("message", "课课最新版本号取得成功");
			json.element("versionNo", ver.get("versionNo").toString());
			json.element("force", ver.get("forces").toString());
			json.element("notice", ver.get("notice").toString());
			json.element("isSummerAt", isSummerAt);// 暑期活动是否显示标记
			json.element("yunxinKey", KeCommon.APP_KEY);// 云信账号APPKEY
			
			//IOS设备
			if ("0".equals(KeVersion.getDeviceType())) {
				//取得DB编辑更新内容
				json.element("comment", ver.get("comment").toString());
				print(json);
				printEndLog("1000", json.toString(), logger);					
			}else if("1".equals(KeVersion.getDeviceType())) {
				//安卓设备
				StringBuilder sb = new StringBuilder();
				sb.append(".请现在更新课课最新版本");
//				sb.append(".新用户注册免费体验10张作业批改");
//				sb.append(".修复一些bug");
				json.element("comment",sb.toString());
				json.element("downloadUrl", ver.get("downloadUrl").toString());
				
				print(json);
				printEndLog("1000", json.toString(), logger);	
			}else {
				//传入的设备类型不正确
				print("{\"code\":\"1001\",\"message\":\"找不到设备类型\"}");
				printErrorLog("设备类型不对", logger);
			}		
		} catch (Exception e) {
			//服务器错误
			printSysErr(e, logger);
			return;
		}
	}
}
