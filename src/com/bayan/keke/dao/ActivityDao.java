package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeActivity;

@Scope("prototype")
@Repository
public class ActivityDao extends BaseDao {

	/**
	 * 判断当天是否已领取过奖励
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer getTodayCount(KeActivity keActivity) throws Exception {
		Integer result = this.getSqlSession().selectOne("activity.getTodayCount", keActivity);
		return result;
	}
	
	/**
	 * 查询用户是否首次上传
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer getFirstRst(KeActivity keActivity) throws Exception {
		Integer result = this.getSqlSession().selectOne("activity.getFirstRst", keActivity);
		return result;
	}
	
	/**
	 * 查询排名
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> getOrderList(KeActivity keActivity) throws Exception {
		List<Map<String,String>> result = this.getSqlSession().selectList("activity.getOrderList", keActivity);
		return result;
	}

	/**
	 * 奖品记录
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer addContacts(KeActivity keActivity) throws Exception {
		Integer res = this.getSqlSession().insert("activity.addContacts", keActivity);
		return res;
	}
}
