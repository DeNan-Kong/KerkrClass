package com.bayan.keke.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.FeedbackDao;
import com.bayan.keke.vo.KeFeedback;

@Scope("prototype")
@Service
public class FeedbackService {
	/**
	 * 
	 */
	@Resource
	private FeedbackDao feedbackDao;

	/**
	 * 问题反馈
	 */
	public Integer insertQuestions(KeFeedback feedback) throws Exception {
		return feedbackDao.insertQuestions(feedback);
		
	}
	
	/**
	 * 查询所有学生端反馈的内容
	 */
	public List<Map<String, Object>> feedbackLst(Map<String, Object> map) throws Exception {
		return feedbackDao.feedbackLst(map);
		
	}
	
	/**
	 * 查询所有学生端反馈的内容的总数
	 */
	public String countFb() throws Exception {
		String res = feedbackDao.countFb();
		return res;
	}
}
