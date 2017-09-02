package com.bayan.keke.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.TeaUsDao;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaUs;

@Scope("prototype")
@Service
public class TeaUsService {
	/* */
	@Resource
	private TeaUsDao teaUsDao;

	/**
	 * 判断是否已注册
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> teaRegist(KeTeaUs keteaus) throws Exception {
		return teaUsDao.teaRegist(keteaus);
	}
	
	/**
	 * 添加信息
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer teaAdd(KeTeaUs keteaus) throws Exception {
		teaUsDao.teaAdd(keteaus);
		return keteaus.getId();
	}
	
	/**
	 * 查看教师证认证状态
	 */
	public String teaApprove(KeTeaUs keteaus) throws Exception {
		return teaUsDao.teaApprove(keteaus);
	}
	
	/**
	 * 老师审核完成登陆
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> teaLogin(KeTeaUs keteaus) throws Exception {
		return teaUsDao.teaLogin(keteaus);
	}
	
	/**
	 * 强制还原老师的作业状态
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer coerceUpdate(KeTeaUs keteaus) throws Exception {
		return teaUsDao.coerceUpdate(keteaus);
	}
	
	/**
	 * 更新老师在离线状态
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateActive(KeTeaUs keteaus) throws Exception {
		return teaUsDao.updateActive(keteaus);
	}
	
	/**
	 * 查看当前同时在线批改人数
	 */
	public String teaActive(KeTeaUs keteaus) throws Exception {
		return teaUsDao.teaActive(keteaus);
	}

	/**
	 * 查看当前未批改作业份数
	 */
	public String taskActive(KeTeaUs keteaus) throws Exception {
		return teaUsDao.taskActive(keteaus);
	}
	
	/**
	 * 查看星星数对应的作业数量
	 */
	public String scoreCnt(KeTeaUs keteaus) throws Exception {
		return teaUsDao.scoreCnt(keteaus);
	}
	
	/**
	 * 取得本月的作业数量
	 */
	public String thisMonthCnt(KeTeaUs keteaus) throws Exception {
		return teaUsDao.thisMonthCnt(keteaus);
	}
	
	/**
	 * 取得上月的作业数量
	 */
	public String lastMonthCnt(KeTeaUs keteaus) throws Exception {
		return teaUsDao.lastMonthCnt(keteaus);
	}
	
	/**
	 * 修改头像
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer headUrlUpdate(KeTeaUs keteaus) throws Exception {
		return teaUsDao.headUrlUpdate(keteaus);
	}
	
	/**
	 * 重置密码
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPW(KeTeaUs keteaus) throws Exception {
		return teaUsDao.reSetPW(keteaus);
	}
	
	/**
	 * 老师信息修改
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateTeaInfo(KeTeaUs keteaus) throws Exception {
		return teaUsDao.updateTeaInfo(keteaus);
	}
	
	/**
	 * 验证码添加
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer addCode(KeTeaUs keteaus) throws Exception {
		return teaUsDao.addCode(keteaus);
	}

	/**
	 * 判断是否已有设备号
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String selectDevice(KeTeaUs keteaus) throws Exception {
		return teaUsDao.selectDevice(keteaus);
	}
	
	/**
	 * 添加设备
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer addDevice(KeTeaUs keteaus) throws Exception {
		return teaUsDao.addDevice(keteaus);
	}
	
	/**
	 * 更新设备ID
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateDevice(KeTeaUs keteaus) throws Exception {
		return teaUsDao.updateDevice(keteaus);
	}
	
	/**
	 * 教师资格证上传七牛成功
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public Integer updateCer(KeTeaUs keteaus) throws Exception {
		return teaUsDao.updateCer(keteaus);
	}
	
	/**
	 * 获取老师批改过的学生ID和姓名
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getStuList(KeTeaUs keteaus) throws Exception {
		List<Map<String,Object>> res = teaUsDao.getStuList(keteaus);
		return res;
	}
}
