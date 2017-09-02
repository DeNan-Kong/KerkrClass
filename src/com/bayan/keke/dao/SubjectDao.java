package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeDaily;
import com.bayan.keke.vo.KeHistoryInfo;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeWeekInfo;

@Scope("prototype")
@Repository
public class SubjectDao extends BaseDao {

	/**
	 * 上传图片
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer addTask(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().insert("subject.insertTask", keSubject);
		return res;
	}
	
	/**
	 * 已经上传件数
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer getPhotoCount(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().selectOne("subject.getPhotoCount", keSubject);
		return res;
	}
	
	/**
	 * 删除模糊图片
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer delBlurImgTask(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().insert("subject.delBlurImgTask", keSubject);
		return res;
	}
	
	/**
	 * 作业结果确认
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer confirmSubject(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().update("subject.confirmSubject", keSubject);
		return res;
	}
	
	/**
	 * 获取题目对错数目
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getErrorResult(KeSubject keSubject) throws Exception {
		List<Map<String,Object>> res = this.getSqlSession().selectList("subject.getErrorCount", keSubject);
		return res;
	}
	
	/**
	 * 更新学分
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer updatePointAll(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().update("subject.updatePointAll", keSubject);
		return res;
	}
	
	/**
	 * 日报请求
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<KeDaily> dayListSubject(KeSubject keSubject) throws Exception {
		List<KeDaily> res = this.getSqlSession().selectList("subject.dayListSubject", keSubject);
		return res;
	}
	
	/**
	 * 本周疑难
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<KeWeekInfo> thisWeekList(KeSubject keSubject) throws Exception {
		List<KeWeekInfo> res = this.getSqlSession().selectList("subject.thisWeekList", keSubject);
		return res;
	}
	
	/**
	 * 历史周疑难
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<KeHistoryInfo> historyWeekList(KeSubject keSubject) throws Exception {
		List<KeHistoryInfo> res = this.getSqlSession().selectList("subject.historyWeekList", keSubject);
		return res;
	}
	
	/**
	 * 已解决
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer resolved(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().selectOne("subject.resolved", keSubject);
		return res;
	}
	
	/**
	 * 作业结果确认
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer selUncorrected(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().selectOne("subject.selUncorrected", keSubject);
		return res;
	}
	
	/**
	 * 已完成统计
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer selCorrected(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().selectOne("subject.selCorrected", keSubject);
		return res;
	}
	
	/**
	 * 若学生不提交评分，则该组作业状态在次日12:00会自动评为5颗星
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer autoSetPoint() throws Exception {
		Integer res = this.getSqlSession().update("subject.autoSetPoint");
		return res;
	}
	
	/**
	 * 次日12点自动给老师算钱
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer addMoney(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().update("subject.autoSetMoney", keSubject);
		return res;
	}
	
	/**
	 * 学生确认后给老师加钱
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer addConfirmMoney(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().update("subject.addConfirmMoney", keSubject);
		return res;
	}
	
	/**
	 * 添加老师收入记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insTeaIncomeRcd(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = this.getSqlSession().update("subject.insTeaIncomeRcd", teaIncomeRcd);
		return res;
	}
	
	/**
	 * 获取没有评分的学生
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<KeSubject> getNoPointUser() throws Exception {
		List<KeSubject> res = this.getSqlSession().selectList("subject.getNoPointUser");
		return res;
	}
	
	/**
	 * 获取图片信息
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public KeSubject getPhotoInfo(KeSubject keSubject) throws Exception {
		KeSubject res = this.getSqlSession().selectOne("subject.getPhotoInfo", keSubject);
		return res;
	}
	
	/**
	 * 获取单张图片
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public KeSubject getOneFile(KeSubject keSubject) throws Exception {
		KeSubject result = this.getSqlSession().selectOne("subject.getOneKey", keSubject);
		return result;
	}
	
	/**
	 * 取得当天学生作业的指定科目的状态
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<KeSubject> getStatus(KeSubject keSubject) throws Exception {
		List<KeSubject> resultList = this.getSqlSession().selectList("subject.getStatus", keSubject);
		return resultList;
	}
	
	/**
	 * 根据类型查找老师ID和设备推送消息
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<String> selDevices(Map<String, Object> map) throws Exception {
		List<String> res = this.getSqlSession().selectList("subject.selDevices", map);
		return res;
	}
	
	/**
	 * 取得当天学生作业的指定科目的所有pohotoId
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public List<String> selPhotos(KeSubject keSubject) throws Exception {
		List<String> res = this.getSqlSession().selectList("subject.getPhotos", keSubject);
		return res;
	}
	
	/**
	 * 单张作业结果确认
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer confirmOne(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().update("subject.confirmOne", keSubject);
		return res;
	}

	/**
	 * 分享日报
	 *
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer shareInfo(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().insert("subject.insShareInfo", keSubject);
		return res;
	}


	/**
	 * 获取当天有效批改件数
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer getUploadCnt(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().selectOne("subject.getUploadCount", keSubject);
		return res;
	}
	
	/**
	 * 更新已评分状态
	 * 
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer upConfirmStatus(KeSubject keSubject) throws Exception {
		Integer res = this.getSqlSession().update("subject.upConfirmStatus", keSubject);
		return res;
	}
}
