package com.bayan.keke.dao;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KePoint;
import com.bayan.keke.vo.KeReport;
import com.bayan.keke.vo.KeSubject;

@Scope("prototype")
@Repository
public class ReportDao extends BaseDao {

	/**
	 * 查找task表里对应被举报老师的信息
	 * 
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selReport(KeReport report) throws Exception {
		return this.getSqlSession().selectOne("rep.selTea", report);
	}
	
	/**
	 * 插入一条举报的记录
	 * 
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public Integer insReport(KeReport report) throws Exception {
		Integer res = this.getSqlSession().insert("rep.insert", report);
		return res;
	}
		
	/**
	 *  更新作业task表里的作业状态
	 *  
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public Integer upTaskStatus(KeReport report) throws Exception {
		return this.getSqlSession().update("rep.upStatus", report);
	}
	
	/**
	 * 查找report表里对应被举报老师的信息
	 * 
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public String selRep(KeReport report) throws Exception {
		return this.getSqlSession().selectOne("rep.selReport", report);
	}
}
