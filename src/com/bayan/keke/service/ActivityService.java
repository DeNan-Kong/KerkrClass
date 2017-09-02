package com.bayan.keke.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.ActivityDao;
import com.bayan.keke.vo.KeActivity;

/**
 * 
 * @author zx
 *
 */
@Scope("prototype")
@Service
public class ActivityService {

	/**
	 * 
	 */
	@Resource
	private ActivityDao activityDao;
	
	/**
	 * 查询用户是否首次上传
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer getFirstRst(KeActivity keActivity) throws Exception {
		Integer result = activityDao.getFirstRst(keActivity);
		return result;
	}
	
	/**
	 * 查询排名
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> getOrder(KeActivity keActivity) throws Exception {
		List<Map<String,String>> result = activityDao.getOrderList(keActivity);
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
		Integer res = activityDao.addContacts(keActivity);
		return res;
	}
	
	/**
	 * 判断当天是否已领取过奖励
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer getTodayCount(KeActivity keActivity) throws Exception {
		Integer result = activityDao.getTodayCount(keActivity);
		return result;
	}
}
