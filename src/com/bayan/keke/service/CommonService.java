package com.bayan.keke.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.CommonDao;

@Scope("prototype")
@Service
public class CommonService {
	
	/* */
	@Resource
	private CommonDao commonDao;

	/**
	 * 查询验证码
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String selVerifyCode(Map<String, Object> map) throws Exception {
		return commonDao.selVerifyCode(map);
	}
}
