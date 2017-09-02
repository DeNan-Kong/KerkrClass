package com.bayan.keke.service;
import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.PointDao;
import com.bayan.keke.vo.KePoint;

@Scope("prototype")
@Service
public class PointService {
	/* */
	@Resource
	private PointDao pointDao;
		
	/**
	 * 查看学分
	 */
	public String viewPoint(KePoint point) throws Exception {
		return pointDao.viewPoint(point);
	}
	
	/**
	 * 提交心愿单 
	 */
	public Integer wishPoint(KePoint point) throws Exception {
		return pointDao.wishPoint(point);
	}
	
}
