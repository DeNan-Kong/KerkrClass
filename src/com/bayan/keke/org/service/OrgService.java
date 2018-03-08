package com.bayan.keke.org.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.org.dao.OrgDao;
import com.bayan.keke.vo.KeOrg;

/**
 * 
 * @author zx
 *
 */
@Scope("prototype")
@Service
public class OrgService {
	
	/**
	 * 
	 */
	@Resource
	private OrgDao orgDao;

	/**
	 * 根据机构id查询机构信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOrgInfoWithId(KeOrg keOrg) throws Exception {
		return orgDao.selOrgInfoWithId(keOrg);
	}
	
	/**
	 * 获取用户注册信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOrgInfo(KeOrg keOrg) throws Exception {
		return orgDao.selOrgInfo(keOrg);
	}
	
	/**
	 * 判断是否已经添加用户
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOrgUserInfo(KeOrg keOrg) throws Exception {
		return orgDao.selOrgUserInfo(keOrg);
	}
	
	
	/**
	 * 重置密码
	 * 
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPwd(KeOrg keOrg) throws Exception {
		return orgDao.reSetPwd(keOrg);
	}
	
	/**
	 * 添加机构信息
	 * 
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer insOrgInfo(KeOrg keOrg) throws Exception {
		Integer res = orgDao.insOrgInfo(keOrg);
		return res;
	}
	
	/**
	 * 更新机构ID
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateOrgId(KeOrg keOrg) throws Exception {
		Integer res = orgDao.updateOrgId(keOrg);
		return res;
	}
		
	/**
	 * 查询机构信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selOrgList() throws Exception {
		List<Map<String, Object>> res = orgDao.selOrgList();
		return res;
	}
	
	/**
	 * 查询学生信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selStuList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = orgDao.selStuList(map);
		return res;
	}
	/**
	 * 查询老师信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selTeaList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = orgDao.selTeaList(map);
		return res;
	}
	
	/**
	 * 查询学生人数
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer countStudent(Map<String, Object> map) throws Exception {
		Integer res = orgDao.countStudent(map);
		return res;
	}
	/**
	 * 查询老师人数
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer countTeacher(Map<String, Object> map) throws Exception {
		Integer res = orgDao.countTeacher(map);
		return res;
	}
	
	/**
	 * 将学生机构ID改为空
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateStuInfo(KeOrg keOrg) throws Exception {
		Integer res = orgDao.updateStuInfo(keOrg);
		return res;
	}
	/**
	 * 将老师机构ID改为空
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateTeaInfo(KeOrg keOrg) throws Exception {
		Integer res = orgDao.updateTeaInfo(keOrg);
		return res;
	}
	
	/**
	 * 变换学生年级
	 * 
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer changGrade(Map<String, Object> map) throws Exception {
		return orgDao.changGrade(map);
	}

	/**
	 * 待审核学生个数
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer countApplyStu(Map map) throws Exception {
		return orgDao.countApplyStu(map);
	}

	/**
	 * 待审核学生详情
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getApplyStuList(Map map) throws Exception {
		return orgDao.getApplyStuList(map);
	}

	/**
	 * 新申请学生审核
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer checkApplyStu(KeOrg keOrg) throws Exception{
		return orgDao.checkApplyStu(keOrg);
	}

	public Integer updateStuById(KeOrg keOrg){
		return orgDao.updateStuById(keOrg);
	}

	public Integer countWatchTag(Map map){
		return orgDao.countWatchTag(map);
	}

	public List<Map> getWatchTagList(Map map){
		return orgDao.getWatchTagList(map);
	}

	public Integer updateWatchTag(Map map){
		return orgDao.updateWatchTag(map);
	}

	public Integer addWatchTag(Map map){
		return orgDao.addWatchTag(map);
	}

	public List<Map> selectWatchTagForName(String tagName){
		return orgDao.selectWatchTagForName(tagName);
	}
}
