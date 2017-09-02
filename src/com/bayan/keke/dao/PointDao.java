package com.bayan.keke.dao;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KePoint;

@Scope("prototype")
@Repository
public class PointDao extends BaseDao {

	/**
	 * 查看学分
	 */
	public String viewPoint(KePoint point) throws Exception {
		return this.getSqlSession().selectOne("point.view", point);
	}
	
	/**
	 * 提交心愿单
	 */
	public Integer wishPoint(KePoint point) throws Exception {
		return this.getSqlSession().update("point.wish", point);
	}
}
