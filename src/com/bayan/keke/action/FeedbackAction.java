package com.bayan.keke.action;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.FeedbackService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.vo.KeFeedback;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import net.sf.json.JSONObject;

public class FeedbackAction extends BaseAction implements
		ModelDriven<KeFeedback>, Preparable {
	//输出日志
	private static final Logger logger = Logger.getLogger(UserAction.class);
	/* */
	@Resource
	private FeedbackService feedbackService;
	/* */
	private KeFeedback keFeedback;
	/* */
	private static final long serialVersionUID = 1L;
	/* */
	public KeFeedback getModel() {
		return keFeedback;
	}
	/* */
	public void prepare() throws Exception {
		keFeedback = new KeFeedback();
	}

	/**
	 * 问题反馈
	 */
	public void addContent() {
		try {
			printStartLog("add方法开始", logger);
			printParamsLog("请求参数。", logger);
			//设置反馈的类型,学生反馈:0,老师反馈:1,日报低评分理由：2.该值由前端传递过来
			if (CheckUtil.checkNulls(
					keFeedback.getUserId(),
					keFeedback.getContent(),
					keFeedback.getType())) {
				
				printErrorLog("传入的参数为空值,请参考参数日志", logger);
				print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
				return;
			} else {
				//截取反馈内容不超过50个字
            	String con = keFeedback.getContent();
            	if (con.length() > 50) {
            		con = con.substring(0,50);
        		}
            	
            	keFeedback.setContent(con);
				//将反馈信息录入
				Integer result = feedbackService.insertQuestions(keFeedback);
				if (result > 0) {
					//json对象
					JSONObject json = new JSONObject();
					json.element("code", "1000");// 完善个人消息
					json.element("message", "反馈内容添加成功");
					print(json);//成功
					printEndLog("1000", json.toString(), logger);
				}else {
					//用户注册失败
					print("{\"code\":\"1001\",\"message\":\"反馈内容添加失败\"}");// 添加失败
					printErrorLog("反馈内容添加失败", logger);
					return;
				}
			}
		} catch (Exception e) {
			// 服务器错误
			printSysErr(e, logger);
			return;
		}
	}
}
