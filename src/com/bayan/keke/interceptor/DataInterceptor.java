package com.bayan.keke.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;

import com.alipay.sign.AES;
import com.bayan.keke.dao.UserDao;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.vo.KeUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.util.ValueStack;

import net.sf.json.JSONObject;

/**
 * 
 * @author zx
 *
 * @param <T>
 */
public class DataInterceptor<T> extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(DataInterceptor.class);

	// TODO===============tokenDao================start
	@Resource
	private UserDao userDao;
	// TODO===============tokenDao================end
	
	@SuppressWarnings("unchecked")
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		// 不做解密，放行请求
		String passFlg = request.getAttribute("passFlg").toString();
		if("0".equals(passFlg)){
			
			return invocation.invoke();
		}
		
		String path = request.getServletPath();//请求接口
		String kkid = request.getHeader("KK-ID");//课课ID
		String kktimstamp = request.getHeader("KK-TIME");//课课时间
		String sign = request.getParameter("sign");//签名
		String encryptStr = request.getParameter("data");//加密数据
		
		logger.debug("===>APP请求解密开始");
		
		// 加密字符为空
		if(CheckUtil.checkNulls(path, kktimstamp, encryptStr)){
			printAppSysErr();
			return "error";
		}
		
		// 将base 64 code AES解密
		String token = "";
		
		// 免登录请求，不做签名
		if(!getPassPath().contains(path)){
			
			// 将base 64 code AES解密
			token = "kkid 从REDIS数据库检索";// TODO
			// TODO========start==========从数据库检索token，暂时mysql，后期可以redis===============
			KeUser ku = new KeUser();
			ku.setUserId("15861591576");
			ku.setFlag("0");
			String device = userDao.selectDevice(ku);
			System.out.println("=====" + device + "=====");
			// TODO========end=============================================================
			
			
			// token为空时，重新登录
			if(CheckUtil.isNullOrEmpty(token)){
				logger.debug("签名验证失败");
				printAppReLogin();
				return "error";
			}
			
			// 签名验证失败，说明token不一致，或其他非法请求，重新登录
			boolean checkSign = verifyKeSign(sign, path, kkid, token, kktimstamp);
			if(!checkSign){
				logger.debug("签名验证失败");
				printAppReLogin();
				return "error";
			}
		}else{
			token = "";
		}
		

		
		// 验证时间，超过1分钟不做处理
		long sysTime = System.currentTimeMillis();
		long reqTime = Long.parseLong(kktimstamp);
		if(sysTime - reqTime > 60000){
			logger.debug("请求超时");
			printAppSysErr();
			return "error";
		}
		
		// 数据解密
		String decryptKey = getDecryptKey(kktimstamp, token);
		String dataJson = AES.aesDecrypt(encryptStr, decryptKey);
		
		// 数据解密后，更改ModelDriven的值
		Object action = invocation.getAction();
		ModelDriven<T> modelDriven = (ModelDriven<T>) action;
        ValueStack stack = invocation.getStack();
        T model = (T)modelDriven.getModel();
        JSONObject jsonObj = JSONObject.fromObject(dataJson);
		T workVo = (T) JSONObject.toBean(jsonObj, model.getClass());
		T kevo = (T)stack.peek();
		BeanUtils.copyProperties(workVo, kevo);

		// 跳出当前拦截,接着干下边的事情，所有error将被全局拦截分支处理
		return invocation.invoke();
	}

	/**
	 * 生成加密key
	 * @param kktimstamp
	 * @param token
	 * @return
	 */
	private String getDecryptKey(String kktimstamp, String token){
		
		return "KK" + kktimstamp + token;
	}
	
	/**
	 * 课课签名认证
	 * @param sign
	 * @param port
	 * @param kkid
	 * @param token
	 * @param timestamp
	 * @return
	 */
	private boolean verifyKeSign(String sign, String path, String kkid, String token, String timestamp){
		
		String signStr = path + "?" + "kkid=" + kkid + "&token=" + token + "&timestamp" + timestamp;
		String signNew = DigestUtils.md5Hex(signStr);
		if(signNew.equals(sign)){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 向输出流里写数据
	 * @param str
	 */
	public void printAppSysErr() {
		try {
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print("{\"code\":\"401\",\"message\":\"系统出错啦\"}");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 重新登录
	 * @param str
	 */
	public void printAppReLogin() {
		try {
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print("{\"code\":\"402\",\"message\":\"请重新登录\"}");
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 手机端免登录请求
	 * @return
	 */
	private List<String> getPassPath(){
		
		List<String> pathList = new ArrayList<String>();
		

		// TODO
		
		// 微信回调放行路径
		pathList.add("/onRespPay.jspx");

		
		return pathList;
	}
}
