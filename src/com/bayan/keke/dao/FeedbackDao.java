package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeFeedback;

@Scope("prototype")
@Repository
public class FeedbackDao extends BaseDao {
		
	/**
	 * 问题反馈
	 */
	public Integer insertQuestions(KeFeedback feedback) throws Exception {
		Integer res = this.getSqlSession().insert("feedback.insertQuestions", feedback);
		res = feedback.getId();
		return res;
	}
	
	/**
	 * 查询所有学生端反馈的内容
	 */
	public List<Map<String, Object>> feedbackLst(Map<String, Object> map) throws Exception {
		return this.getSqlSession().selectList("feedback.questions",map);
	}
	
	/**
	 * 查询所有学生端反馈的内容总数
	 */
	public String countFb() throws Exception {
		return this.getSqlSession().selectOne("feedback.queCnt");
	}
}
