package com.bayan.keke.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.TeaSubDao;
import com.bayan.keke.vo.KeMarkDb;
import com.bayan.keke.vo.KeTeaIncome;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaSub;
import com.bayan.keke.vo.TaskVo;

/**
 * 
 * @author zx
 *
 */
@Scope("prototype")
@Service
public class TeaSubService {
	/**
	 * 
	 */
	@Resource
	private TeaSubDao teaSubDao;

	/**
	 * 查询老师有没有批改中的作业
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<TaskVo> getCorrectingTask(KeTeaSub keTeaSub) throws Exception {
		List<TaskVo> res = teaSubDao.getCorrectingTask(keTeaSub);
		return res;
	}
	
	/**
	 * 查看当前未批改作业份数
	 */
	public String taskActive(KeTeaSub keTeaSub) throws Exception {
		return teaSubDao.taskActive(keTeaSub);
	}
	
	/**
	 * 获取未批改的作业
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public TaskVo getUncorrectedTask(KeTeaSub keTeaSub) throws Exception {
		TaskVo res = teaSubDao.getUncorrectedTask(keTeaSub);
		return res;
	}
	
	/**
	 * 更新作业状态和批改老师
	 * 
	 * @param taskVo
	 * @return
	 * @throws Exception
	 */
	public Integer updateTaskStatus(TaskVo taskVo) throws Exception {
		Integer res = teaSubDao.updateTaskStatus(taskVo);
		return res;
	}
	
	/**
	 * 查询前一张照片信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public TaskVo getPreviousTask(KeTeaSub keTeaSub) throws Exception {
		TaskVo res = teaSubDao.getPreviousTask(keTeaSub);
		return res;
	}
	
	/**
	 * 放弃批改
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer giveUpTask(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.giveUpTask(keTeaSub);
		return res;
	}
	
	/**
	 * 作业批改模糊图片
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer fuzzyTask(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.fuzzyTask(keTeaSub);
		return res;
	}
	
	/**
	 * 清除之前的作业照片的标签点信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer deleteMark(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.deleteMark(keTeaSub);
		return res;
	}
	
	/**
	 * 添加作业评语
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer addComment(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.addComment(keTeaSub);
		return res;
	}
	
	/**
	 * 查询设备信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<String> getDevices(KeTeaSub keTeaSub) throws Exception {
		List<String> res = teaSubDao.getDevices(keTeaSub);
		return res;
	}
	
	/**
	 * 获取未批改作业件数
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer getUncorrectedCount(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.getUncorrectedCount(keTeaSub);
		return res;
	}
	
	
	/**
	 * 插入批改结果
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer insertMarks(List<KeMarkDb> markList) throws Exception {
		Integer res = teaSubDao.insertMarks(markList);
		return res;
	}
	
	/**
	 * 获取task信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<TaskVo> getTaskWithPhotoId(KeTeaSub keTeaSub) throws Exception {
		List<TaskVo> res = teaSubDao.getTaskWithPhotoId(keTeaSub);
		return res;
	}
	
	/**
	 * 查询老师总收入
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public KeTeaIncome selTeaIncomeTotal(KeTeaSub keTeaSub) throws Exception {
		KeTeaIncome res = teaSubDao.selTeaIncomeTotal(keTeaSub);
		return res;
	}
	
	/**
	 * 查询老师当天收入
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public String selTeaIncomeToday(KeTeaSub keTeaSub) throws Exception {
		String res = teaSubDao.selTeaIncomeToday(keTeaSub);
		return res;
	}
	
	/**
	 * 查询老师批改完成，学生未确认件数，作为即将到账
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public String selFinishCntWithTeaId(KeTeaSub keTeaSub) throws Exception {
		String res = teaSubDao.selFinishCntWithTeaId(keTeaSub);
		return res;
	}
	
	/**
	 * 查询老师当天提现记录
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaIncomeRcd> selOutMoneyToday(KeTeaSub keTeaSub) throws Exception {
		List<KeTeaIncomeRcd> res = teaSubDao.selOutMoneyToday(keTeaSub);
		return res;
	}
	
	/**
	 * 老师提现,更改已提现金额
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateTeaIncome(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.updateTeaIncome(keTeaSub);
		return res;
	}
	
	/**
	 * 添加老师提现记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insTeaOutRcd(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = teaSubDao.insTeaOutRcd(teaIncomeRcd);
		return res;
	}

	/**
	 * 取得批改作业老师的类型
	 */
	public String getType(KeTeaSub keTeaSub) throws Exception {
		return teaSubDao.getType(keTeaSub);
	}
	/**
	 * 取得批改作业老师的组织
	 */
	public String getOrgId(KeTeaSub keTeaSub) throws Exception {
		return teaSubDao.getOrgId(keTeaSub);
	}
	
	/**
	 * 查看当前最新一张未批改作业的上传时间
	 */
	public String upTime(KeTeaSub keTeaSub) throws Exception {
		return teaSubDao.upTime(keTeaSub);
	}
	
	/**
	 * 获取当前正在批改作业的时间超过10分钟的作业信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaSub> getTenMin() throws Exception {
		List<KeTeaSub> res = teaSubDao.getTenMin();
		return res;
	}
	
	/**
	 * 获取当前未批改作业的时间超过20分钟的作业份数
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public String getTwentyMin() throws Exception {
		String res = teaSubDao.getTwentyMin();
		return res;
	}
	
	/**
	 * 查询是否为首次批改
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public String selFirstSub(KeTeaSub keTeaSub) throws Exception {
		String res = teaSubDao.selFirstSub(keTeaSub);
		return res;
	}
	
	/**
	 * 登录首次批改记录
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer insFirstSub(KeTeaSub keTeaSub) throws Exception {
		Integer res = teaSubDao.insFirstSub(keTeaSub);
		return res;
	}
	
	/**
	 * 查看存在的支付宝信息
	 */
	public Map<String, Object> zhiInfo(KeTeaSub keTeaSub) throws Exception {
		return teaSubDao.zhiInfo(keTeaSub);
	}
}
