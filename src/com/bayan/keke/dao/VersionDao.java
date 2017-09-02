package com.bayan.keke.dao;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeVersion;

@Scope("prototype")
@Repository
public class VersionDao extends BaseDao {

	/**
	 * 查询最新版本号
	 * 
	 * @param kever
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectVersion(KeVersion kever) throws Exception {
		return this.getSqlSession().selectOne("ver.getVersion", kever);
	}
	

}
