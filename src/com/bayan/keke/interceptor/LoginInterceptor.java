package com.bayan.keke.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.bayan.keke.action.KeCommon;
import com.bayan.keke.util.KeConstant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger
			.getLogger(LoginInterceptor.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		// 获取访问者IP
		String accIp = KeCommon.getIpAddr(request);
		logger.debug("==>访问者IP==>" + accIp);
		
		// 首先取得请求的地址
		String path = request.getServletPath();
		logger.debug("==>[" + path + "]所有前端请求在此被拦截XXXlogin!");

		// 路径取得出错,系统错误
		if (path == null || !path.endsWith(".jspx")) {
			
			logger.error("==>请求路径为空");
			return "error";
		}
		boolean flag = false;

		// 后台路径判断
		if (path.endsWith("Manage.jspx") 
				|| path.endsWith("Sales.jspx")
				|| path.endsWith("Org.jspx")) {

			logger.debug("==>后台请求");
			
			// 判断是否是免登陆放行路径
			if (getPassPath().contains(path)) {
				
				logger.debug("==>放行请求");
				flag = true;
			} else {
				
				logger.debug("==>登陆验证，其他请求");

				// 后台请求判断是否登录
				if (isNullOrEmpty(session.getAttribute("userId"))) {
					// 机构登陆
					if(path.endsWith("Org.jspx")){
						return "reLogin";
					}else{
						// 用户登陆
						return "reLogin";
					}
				}
				
				// 拦截放行
				flag = true;
			}
			
//			// 设置加密放行标记：放行TODO
//			request.setAttribute("passFlg", "0");
		}else{
	
			logger.debug("==>手机端请求");
//			
//			// 设置加密放行标记：不放行 1 支付宝微信等免加密放行 
//			request.setAttribute("passFlg", "0");//TODO
			
			// 手机端请求放行
			flag = true;
		}

		// 跳出当前拦截,接着干下边的事情，所有error将被全局拦截分支处理
		return flag ? invocation.invoke() : "error";
	}
	
	/**
	 * 免登陆放行路径
	 * @return
	 */
	private List<String> getPassPath(){
		
		List<String> pathList = new ArrayList<String>();
		
		// 支付宝回调放行路径
		pathList.add("/alipayNotifyManage.jspx");
		pathList.add("/alipayNotifyTgManage.jspx");
		
		// 微信回调放行路径
		pathList.add("/onRespPay.jspx");

		// 全局登陆放行
		pathList.add("/orgLogin.jspx");
		pathList.add("/adminLogin.jspx");
		pathList.add("/login.jspx");
		
		// 登录放行路径
		pathList.add("/adminLoginManage.jspx");
		pathList.add("/logoutAdminManage.jspx");
		pathList.add("/loginSales.jspx");
		pathList.add("/logoutManage.jspx");
		pathList.add("/loginOrg.jspx");
		pathList.add("/logoutOrg.jspx");
		pathList.add("/toregisterSales.jspx");
		pathList.add("/toupdSales.jspx");
		
		// 重置密码
		pathList.add("/sendCodeOrg.jspx");
		pathList.add("/updatePwdOrg.jspx");
		pathList.add("/toUpdPwdOrg.jspx");
		
		// 注册放行路径
		pathList.add("/sendCodeSSales.jspx");
		pathList.add("/sendCodeRSSales.jspx");
		pathList.add("/listProvinceSales.jspx");
		pathList.add("/listCitySales.jspx");
		pathList.add("/addSales.jspx");
		pathList.add("/updatePWSales.jspx");
		//移动APP注册学生
		pathList.add("/addStuForAPPOrg.jspx");

		// SID验证放行
		// TODO 之后删除
		pathList.add("/sidCheckSales.jspx");
		//获取视频接口
		pathList.add("/getInfoVideos.jspx");

		return pathList;
	}
	
	/**
	 * 验证参数是否为空 
	 * @param parm
	 * @return true:空 false:非空
	 */
	private boolean isNullOrEmpty(Object obj){
		if(obj == null || KeConstant.BLANK.equals(obj.toString())){
			return true;
		}else{
			return false;
		}
	}
}
