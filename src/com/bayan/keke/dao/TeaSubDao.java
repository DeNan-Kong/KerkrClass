package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeMarkDb;
import com.bayan.keke.vo.KeTeaIncome;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaSub;
import com.bayan.keke.vo.TaskVo;

@Scope("prototype")
@Repository
public class TeaSubDao extends BaseDao {

	/**
	 * 查询老师有没有批改中的作业
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<TaskVo> getCorrectingTask(KeTeaSub keTeaSub) throws Exception {
		List<TaskVo> res = this.getSqlSession().selectList("teaSub.getCorrectingTask", keTeaSub);
		return res;
	}
	
	/**
	 * 查看当前未批改作业份数
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String taskActive(KeTeaSub keTeaSub) throws Exception {
		return this.getSqlSession().selectOne("teaSub.taskCount", keTeaSub);
	}
	
	/**
	 * 获取未批改的作业
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public TaskVo getUncorrectedTask(KeTeaSub keTeaSub) throws Exception {
		TaskVo res = this.getSqlSession().selectOne("teaSub.getUncorrectedTask", keTeaSub);
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
		Integer res = this.getSqlSession().update("teaSub.updateTaskStatus", taskVo);
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
		TaskVo res = this.getSqlSession().selectOne("teaSub.getPreviousTask", keTeaSub);
		return res;
	}
	
	/**
	 * 作业批改
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer giveUpTask(KeTeaSub keTeaSub) throws Exception {
		Integer res = this.getSqlSession().update("teaSub.giveUpTask", keTeaSub);
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
		Integer res = this.getSqlSession().update("teaSub.fuzzyTask", keTeaSub);
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
		Integer res = this.getSqlSession().delete("teaSub.delMark", keTeaSub);
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
		Integer res = this.getSqlSession().update("teaSub.addComment", keTeaSub);
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
		List<String> res = this.getSqlSession().selectList("teaSub.getDevices", keTeaSub);
		return res;
	}
	
	/**
	 * 获取未批改的作业件数
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer getUncorrectedCount(KeTeaSub keTeaSub) throws Exception {
		Integer res = this.getSqlSession().selectOne("teaSub.getUncorrectedCount", keTeaSub);
		return res;
	}
	
	/**
	 * 登录批改结果
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer insertMarks(List<KeMarkDb> markList) throws Exception {
		Integer res = this.getSqlSession().insert("teaSub.insertMarks", markList);
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
		List<TaskVo> res = this.getSqlSession().selectList("teaSub.getTaskWithPhotoId", keTeaSub);
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
		KeTeaIncome res = this.getSqlSession().selectOne("teaSub.selTeaIncomeTotal", keTeaSub);
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
		String res = this.getSqlSession().selectOne("teaSub.selTeaIncomeToday", keTeaSub);
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
		String res = this.getSqlSession().selectOne("teaSub.selFinishCntWithTeaId", keTeaSub);
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
		List<KeTeaIncomeRcd> res = this.getSqlSession().selectList("teaSub.selOutMoneyToday", keTeaSub);
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
		Integer res = this.getSqlSession().update("teaSub.updateTeaIncome", keTeaSub);
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
		Integer res = this.getSqlSession().update("teaSub.insTeaOutRcd", teaIncomeRcd);
		return res;
	}
	
	/**
	 * 取得批改作业老师的类型
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String getType(KeTeaSub keTeaSub) throws Exception {
		return this.getSqlSession().selectOne("teaSub.getType", keTeaSub);
	}
	/**
	 * 取得批改作业老师的组织
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String getOrgId(KeTeaSub keTeaSub) throws Exception {
		return this.getSqlSession().selectOne("teaSub.getOrgId", keTeaSub);
	}
	
	/**
	 * 查看当前最新一张未批改作业的上传时间
	 * 
	 * @param KeTeaUs
	 * @return
	 * @throws Exception
	 */
	public String upTime(KeTeaSub keTeaSub) throws Exception {
		return this.getSqlSession().selectOne("teaSub.uploadTime", keTeaSub);
	}
	
	/**
	 * 获取当前正在批改作业的时间超过10分钟的作业信息
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaSub> getTenMin() throws Exception {
		List<KeTeaSub> res = this.getSqlSession().selectList("teaSub.tenMinTime");
		return res;
	}
	
	/**
	 * 获取当前未批改作业的时间超过20分钟的作业份数
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public String getTwentyMin() throws Exception {
		String res = this.getSqlSession().selectOne("teaSub.twentyMinTime");
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
		String res = this.getSqlSession().selectOne("teaSub.selFirstSub", keTeaSub);
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
		Integer res = this.getSqlSession().insert("teaSub.insFirstSub", keTeaSub);
		return res;
	}
	
	/**
	 * 查看存在的支付宝信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> zhiInfo(KeTeaSub keTeaSub) throws Exception {
		return this.getSqlSession().selectOne("teaSub.zhiInfo", keTeaSub);
	}
}
