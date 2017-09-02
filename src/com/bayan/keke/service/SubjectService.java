package com.bayan.keke.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.SubjectDao;
import com.bayan.keke.vo.KeDaily;
import com.bayan.keke.vo.KeHistoryInfo;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeWeekInfo;

/**
 * 
 * @author zx
 *
 */
@Scope("prototype")
@Service
public class SubjectService {
	/**
	 * 
	 */
	@Resource
	private SubjectDao subjectDao;
	
	/**
	 * 上传图片
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer addTask(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.addTask(keSubject);
		return res;
	}
	
	/**
	 * 获取已经上传件数
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer getPhotoCount(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.getPhotoCount(keSubject);
		return res;
	}
	
	/**
	 * 获取图片信息
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public KeSubject getPhotoInfo(KeSubject keSubject) throws Exception {
		KeSubject res = subjectDao.getPhotoInfo(keSubject);
		return res;
	}
		
	/**
	 * 删除模糊图片
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer delBlurImgTask(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.delBlurImgTask(keSubject);
		return res;
	}
	
	/**
	 * 作业结果确认
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer confirmSubject(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.confirmSubject(keSubject);
		return res;
	}
	
	/**
	 * 获取题目对错
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getErrorResult(KeSubject keSubject) throws Exception {
		List<Map<String,Object>> res = subjectDao.getErrorResult(keSubject);
		return res;
	}
	
	/**
	 * 更新学分
	 * 
	 * @param point
	 * @return
	 * @throws Exception
	 */
	public Integer updatePointAll(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.updatePointAll(keSubject);
		return res;
	}
	
	/**
	 * 学生确认后，给老师加钱
	 * 
	 * @param point
	 * @return
	 * @throws Exception
	 */
	public Integer addConfirmMoney(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.addConfirmMoney(keSubject);
		return res;
	}
	
	/**
	 * 获取日报信息
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public List<KeDaily> dayListSubject(KeSubject keSubject) throws Exception {
		List<KeDaily> res = subjectDao.dayListSubject(keSubject);
		return res;
	}
	
	/**
	 * 本周疑难
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public List<KeWeekInfo> thisWeekList(KeSubject keSubject) throws Exception {
		List<KeWeekInfo> res = subjectDao.thisWeekList(keSubject);
		return res;
	}
	
	/**
	 * 历史周疑难
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public List<KeHistoryInfo> historyWeekList(KeSubject keSubject) throws Exception {
		List<KeHistoryInfo> res = subjectDao.historyWeekList(keSubject);
		return res;
	}
	
	/**
	 * 已解决
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer resolved(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.resolved(keSubject);
		return res;
	}
	
	/**
	 * 判断是否还有未完成作业
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer selUncorrected(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.selUncorrected(keSubject);
		return res;
	}
	
	/**
	 * 已确认完成统计
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer selCorrected(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.selCorrected(keSubject);
		return res;
	}
	
	/**
	 * 读取单个图片
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public KeSubject getOneFile(KeSubject keSubject) throws Exception {
		KeSubject res = subjectDao.getOneFile(keSubject);
		return res;
	}
	
	/**
	 * 取得日报状态
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public List<KeSubject> getStatus(KeSubject keSubject) throws Exception {
		List<KeSubject> res = subjectDao.getStatus(keSubject);
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
		Integer res = subjectDao.insTeaIncomeRcd(teaIncomeRcd);
		return res;
	}
	
	/**
	 * 根据类型查找老师ID和设备推送消息
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<String> selDevices(Map<String, Object> map) throws Exception {
		List<String> res = subjectDao.selDevices(map);
		return res;
	}
	
	/**
	 * 取得当天学生作业的指定科目的所有pohotoId
	 * @param KeSubject
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<String> selPhotos(KeSubject keSubject) throws Exception {
		List<String> res = subjectDao.selPhotos(keSubject);
		return res;
	}	
	
	/**
	 * 单张作业结果确认
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer confirmOne(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.confirmOne(keSubject);
		return res;
	}

	/**
	 * 日报分享
	 *
	 * @param KeSubject
	 * @return
	 * @throws Exception
	 */
	public Integer shareInfo(KeSubject keSubject) throws Exception {
		Integer res = subjectDao.shareInfo(keSubject);
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
		Integer res = subjectDao.getUploadCnt(keSubject);
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
		Integer res = subjectDao.upConfirmStatus(keSubject);
		return res;
	}
	
}
