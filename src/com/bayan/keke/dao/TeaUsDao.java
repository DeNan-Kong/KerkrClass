package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaUs;

@Scope("prototype")
@Repository
public class TeaUsDao extends BaseDao {
	/**
	 * 用户信息添加
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer teaAdd(KeTeaUs keteaus) throws Exception {
		Integer res = this.getSqlSession().insert("teaus.teaInsert", keteaus);
		res = keteaus.getId();
		return res;
	}

	/**
	 * 验证码添加
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer addCode(KeTeaUs keteaus) throws Exception {
		Integer res = this.getSqlSession().insert("teaus.insertCode", keteaus);
		res = keteaus.getId();
		return res;
	}

	/**
	 * 判断是否已有设备号
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String selectDevice(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.getDevices", keteaus);
	}
	
	/**
	 * 设备添加
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer addDevice(KeTeaUs keteaus) throws Exception {
		Integer res = this.getSqlSession().insert("teaus.insertDevice", keteaus);
		res = keteaus.getId();
		return res;
	}

	/**
	 * 更新设备ID
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateDevice(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.updateDevice", keteaus);
	}
	
	/**
	 * 判断是否已注册
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> teaRegist(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.teaRegister", keteaus);
	}
	
	/**
	 * 查看教师证认证状态
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String teaApprove(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.teaStatus", keteaus);
	}
	
	/**
	 * 老师审核完成登陆
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> teaLogin(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.teaLogin", keteaus);
	}
	
	/**
	 * 强制还原老师的作业状态
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer coerceUpdate(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.coerceUp", keteaus);
	}
	
	/**
	 * 更新老师的在离线状态
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateActive(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.upActive", keteaus);
	}
	
	/**
	 * 查看当前同时在线批改人数
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String teaActive(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.teaCount", keteaus);
	}
	
	/**
	 * 查看当前未批改作业份数
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String taskActive(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.taskCount", keteaus);
	}
	
	/**
	 * 查看星星数对应的作业数量
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String scoreCnt(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.scoreCount", keteaus);
	}
	
	/**
	 * 取得本月的作业数量
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String thisMonthCnt(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.thisMonthCnt", keteaus);
	}
	
	/**
	 * 取得上月的作业数量
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String lastMonthCnt(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().selectOne("teaus.lastMonthCnt", keteaus);
	}
	
	/**
	 * 重置密码
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPW(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.pwReset", keteaus);
	}
	
	/**
	 * 老师信息修改
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateTeaInfo(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.upTeaInfo", keteaus);
	}

	/**
	 * 用户头像修改
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer headUrlUpdate(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.headUpdate", keteaus);
	}
	
	/**
	 * 教师资格证上传七牛成功
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateCer(KeTeaUs keteaus) throws Exception {
		return this.getSqlSession().update("teaus.updateCer", keteaus);
	}
	
	/**
	 * 获取老师批改过的学生ID和姓名
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getStuList(KeTeaUs keteaus) throws Exception {
		List<Map<String,Object>> res = this.getSqlSession().selectList("teaus.getStuLst", keteaus);
		return res;
	}
}
