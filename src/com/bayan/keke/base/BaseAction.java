package com.bayan.keke.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;

import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

public class BaseAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String groupId = DateUtil.getOrderId();
	public String userId;
	// 分页参数
	private int rows=10;
	private int page;

	/**
	 * 
	 */
	@Override
	public String execute() throws Exception {
		groupId = DateUtil.getOrderId();
		return super.execute();
	}

	/**
	 * 获取服务器的响应
	 * @return
	 */
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	/**
	 * 取得服务器的会话
	 * @return
	 */
	public HttpSession getSession() {
		return ServletActionContext.getRequest().getSession();
	}

	/**
	 * 取得服务器的请求
	 * @return
	 */
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	/**
	 * 向输出流里写数据
	 * @param str
	 */
	public void print(String str) {
		try {
			PrintWriter out = this.getResponse().getWriter();
			out.print(str);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 向输出流里写数据
	 * @param str
	 */
	public void println(String str) {
		try {
			PrintWriter out = this.getResponse().getWriter();
			out.println(str);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取ip
	 * 
	 * @return
	 */
	public String getIp() {
		return getRequest().getRemoteAddr();
	}

	public void print(Object obj) {
		print(obj.toString());

	}

	@SuppressWarnings("rawtypes")
	public void print(Collection list) {
		print(new JSONArray(list));
	}

	/**
	 * 
	 */
	public void printParamsJSON(Logger logger) {
		Map<String, String[]> map = this.getRequest().getParameterMap();
		logger.debug(map);
		JSONObject jsonObject = new JSONObject();
		jsonObject.putAll(map);
	}
	
	public String getGroupId() {

		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	/**
	 * 把请求参数出力log里
	 */
	public void printParamsLog(String comment, Logger logger) {
		Map<String, String[]> map = this.getRequest().getParameterMap();
		StringBuilder sb = new StringBuilder();
		sb.append(comment);
		for (Entry<String, String[]> set : map.entrySet()) {
			sb.append(set.getKey() + KeConstant.DENGHAO + set.getValue()[0]);
			sb.append(KeConstant.DOUHAO);
		}
		int lastIndex = sb.lastIndexOf(KeConstant.DOUHAO);
		if(lastIndex != -1){
			sb.delete(lastIndex, lastIndex + 1);
		}
		logger.info(sb.toString());
	}
	
	/**
	 * 请求开始日志
	 */
	public void printStartLog(String comment, Logger logger) {

		logger.info(comment);
	}
	
	/**
	 * 请求结束日志
	 */
	public void printEndLog(String comment, String jsonString, Logger logger) {
		
		logger.info(comment + jsonString);
	}
	
	/**
	 * 打印debug日志
	 */
	public void printDebugLog(String comment, Logger logger) {
		
		logger.debug(comment);
	}
	
	/**
	 * 打印debug日志
	 */
	public void printErrorLog(String comment, Logger logger) {
		
		logger.error(comment);
	}
	
    /**
     * 打印系统错误
     * @param e
     */
	public void printSysErr(Exception e, Logger logger) {
		// 服务器内部错误
		e.printStackTrace();
		logger.error(getTrace(e));
		print("{\"code\":\"2001\",\"message\":\"系统出错！\"}");
	}
	
	/**
	 * 打印系统错误,只在服务器端打印，不反悔手机端
	 * @param e
	 */
	public void printSysErrServer(Exception e, Logger logger) {
		// 服务器内部错误
		logger.error(getTrace(e));
	}
	
	/**
	 * 打印异常日志
	 * @param t
	 * @return
	 */
	private String getTrace(Throwable t) {
        StringWriter stringWriter= new StringWriter();
        PrintWriter writer= new PrintWriter(stringWriter);
        t.printStackTrace(writer);
        StringBuffer buffer= stringWriter.getBuffer();
        return buffer.toString();
    }
	
	
	
	///////////////发布时请删除下面代码 TODO /////////////////
//	// action中打印错误
//	public void addActionError(String anErrorMessage) {
//		String s = anErrorMessage;
//		System.out.println(s);
//	}
//	public void addActionMessage(String aMessage) {
//		String s = aMessage;
//		System.out.println(s);
//	}
//	public void addFieldError(String fieldName, String errorMessage) {
//		String s = errorMessage;
//		String f = fieldName;
//		System.out.println(s);
//		System.out.println(f);
//	}
	
}
