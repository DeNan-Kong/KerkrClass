package com.bayan.keke.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.VersionDao;
import com.bayan.keke.vo.KeVersion;

@Scope("prototype")
@Service
public class VersionService {
	/* */
	@Resource
	private VersionDao versionDao;
	
	/**
	 * 查询最新版本号
	 * 
	 * @param kever
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectVersion(KeVersion kever) throws Exception {
		return versionDao.selectVersion(kever);
	}
}
