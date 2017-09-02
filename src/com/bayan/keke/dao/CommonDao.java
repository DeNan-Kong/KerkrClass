package com.bayan.keke.dao;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;

@Scope("prototype")
@Repository
public class CommonDao extends BaseDao {
	
	/**
	 * 查询验证码
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String selVerifyCode(Map<String, Object> map) throws Exception {
		return this.getSqlSession().selectOne("common.selVerifyCode", map);
	}
	
}
