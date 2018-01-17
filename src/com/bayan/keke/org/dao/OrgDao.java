package com.bayan.keke.org.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeOrg;

@Scope("prototype")
@Repository
public class OrgDao extends BaseDao {

	/**
	 * 判断是否已注册
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOrgInfo(KeOrg keOrg) throws Exception {
		return this.getSqlSession().selectOne("org.selOrgInfo", keOrg);
	}
	
	/**
	 * 根据机构id查询机构信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOrgInfoWithId(KeOrg keOrg) throws Exception {
		return this.getSqlSession().selectOne("org.selOrgInfoWithId", keOrg);
	}
	
	/**
	 * 判断是否已经添加用户
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOrgUserInfo(KeOrg keOrg) throws Exception {
		return this.getSqlSession().selectOne("org.selOrgUserInfo", keOrg);
	}
	
	
	/**
	 * 更新机构ID
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateOrgId(KeOrg keOrg) throws Exception {
		Integer res = this.getSqlSession().update("org.updateOrgId", keOrg);
		return res;
	}
	
	/**
	 * 重置密码
	 * 
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPwd(KeOrg keOrg) throws Exception {
		return this.getSqlSession().update("org.reSetPwd", keOrg);
	}
	
	/**
	 * 添加机构信息
	 * 
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer insOrgInfo(KeOrg keOrg) throws Exception {
		Integer res = this.getSqlSession().insert("org.insOrgInfo", keOrg);
		return res;
	}
	
	/**
	 * 初始化机构收入
	 * 
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer insOrgIncome(KeOrg keOrg) throws Exception {
		Integer res = this.getSqlSession().insert("org.insOrgIncome", keOrg);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("org.selOrgList");
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("org.selStuList", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("org.selTeaList", map);
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
		Integer res = this.getSqlSession().selectOne("org.countStudent", map);
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
		Integer res = this.getSqlSession().selectOne("org.countTeacher", map);
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
		Integer res = this.getSqlSession().update("org.updateStuInfo", keOrg);
		return res;
	}
	/**
	 * 将老师机构ID改为空
	 * @param keOrg
	 * @return
	 * @throws Exception
	 */
	public Integer updateTeaInfo(KeOrg keOrg) throws Exception {
		Integer res = this.getSqlSession().update("org.updateTeaInfo", keOrg);
		return res;
	}
	
	/**
	 * 变换学生年级
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer changGrade(Map<String, Object> map) throws Exception {
		return this.getSqlSession().update("org.reSetGrade", map);
	}

	/**
	 * 待审核学生个数
	 * @param map
	 * @return
	 */
	public Integer countApplyStu(Map map){
		return this.getSqlSession().selectOne("org.countApplyUsers",map);
	}

	/**
	 * 待审核学生详情
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getApplyStuList(Map map){
		return this.getSqlSession().selectList("org.getApplyUsers",map);
	}

	/**
	 * 新申请学生审核
	 * @param keOrg
	 * @return
	 */
	public Integer checkApplyStu(KeOrg keOrg){
		return this.getSqlSession().update("org.checkApplyStu",keOrg);
	}

	public Integer updateStuById(KeOrg keOrg){
		return this.getSqlSession().update("org.updateStuById",keOrg);
	}
}
