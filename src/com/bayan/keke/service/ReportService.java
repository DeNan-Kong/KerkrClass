package com.bayan.keke.service;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.PointDao;
import com.bayan.keke.dao.ReportDao;
import com.bayan.keke.vo.KePoint;
import com.bayan.keke.vo.KeReport;
import com.bayan.keke.vo.KeSubject;

@Scope("prototype")
@Service
public class ReportService {
	/* */
	@Resource
	private ReportDao reportDao;
		
	/**
	 * 查找task表里对应被举报老师的信息
	 * 
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selReport(KeReport report) throws Exception {
		return reportDao.selReport(report);
	}
	
	/**
	 * 插入一条举报的记录
	 * 
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public Integer insReport(KeReport report) throws Exception {
		Integer res = reportDao.insReport(report);
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
		return reportDao.upTaskStatus(report);
	}
	
	/**
	 * 查找report表里对应被举报老师的信息
	 * 
	 * @param KeReport
	 * @return
	 * @throws Exception
	 */
	public String selRep(KeReport report) throws Exception {
		return reportDao.selRep(report);
	}
}
