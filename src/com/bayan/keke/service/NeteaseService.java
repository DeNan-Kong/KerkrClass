package com.bayan.keke.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.NeteaseDao;
import com.bayan.keke.vo.KeNetease;
import com.bayan.keke.vo.KeTeaUs;

@Scope("prototype")
@Service
public class NeteaseService {
	/**
	 * 
	 */
	@Resource
	private NeteaseDao neteaseDao;

	/**
	 * 判断家长是否已注册云信ID
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> stuRegist(KeNetease kenetease) throws Exception {
		return neteaseDao.stuRegist(kenetease);
	}
	
	/**
	 * 判断老师是否已注册云信ID
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> TeaRegist(KeNetease kenetease) throws Exception {
		return neteaseDao.teaRegist(kenetease);
	}
	
	/**
	 * 插入家长和云信关系信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addStuYunxin(KeNetease kenetease) throws Exception {
		neteaseDao.addStuYunxin(kenetease);
		return kenetease.getId();
	}
	
	/**
	 * 插入老师和云信关系信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addTeaYunxin(KeNetease kenetease) throws Exception {
		neteaseDao.addTeaYunxin(kenetease);
		return kenetease.getId();
	}
	
	/**
	 * 判断在线通话人数
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public String callingCnt() throws Exception {
		return neteaseDao.callingCnt();
	}
	
	/**
	 * 插入一次云信通话记录信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addCallYunxin(KeNetease kenetease) throws Exception {
		neteaseDao.addCallYunxin(kenetease);
		return kenetease.getId();
	}
	
	/**
	 * 插入一次云信消息推送记录
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addMSGYunxin(KeNetease kenetease) throws Exception {
		neteaseDao.addMSGYunxin(kenetease);
		return kenetease.getId();
	}
	
	/**
	 * 查询家长端用户的类型对应的设备号
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public String selStuDevice(KeNetease kenetease) throws Exception {
		return neteaseDao.selStuDevice(kenetease);
	}
	
	/**
	 * 查询老师端用户的类型对应的设备号
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public String selTeaDevice(KeNetease kenetease) throws Exception {
		return neteaseDao.selTeaDevice(kenetease);
	}
	
	/**
	 * 更新学生答疑的状态
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upStuStatusYX(KeNetease kenetease) throws Exception {
		return neteaseDao.upStuStatusYX(kenetease);
	}
	
	/**
	 * 更新学生答疑的状态
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upTeaStatusYX(KeNetease kenetease) throws Exception {
		return neteaseDao.upTeaStatusYX(kenetease);
	}
	
	/**
	 * 取得通话记录信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getRecordInfo(KeNetease kenetease) throws Exception {
		return neteaseDao.getRecordInfo(kenetease);
	}
	
	/**
	 * 更新老师答疑的收入
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upAnswerPay(KeNetease kenetease) throws Exception {
		return neteaseDao.upAnswerPay(kenetease);
	}
	
	/**
	 * 更新老师答疑结果信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upAnswerInfo(KeNetease kenetease) throws Exception {
		return neteaseDao.upAnswerInfo(kenetease);
	}
	
	/**
	 * 更新老师答疑结果信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upAnswerComment(KeNetease kenetease) throws Exception {
		return neteaseDao.upAnswerComment(kenetease);
	}
	
	/**
	 * 查询超时未接通的学生推送消息记录信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public List<KeNetease> selListRcd(KeNetease kenetease) throws Exception {
		return neteaseDao.selListRcd(kenetease);
	}
	
	/**
	 * 更新超时提醒学生的记录状态
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upMSGRcd(KeNetease kenetease) throws Exception {
		return neteaseDao.upMSGRcd(kenetease);
	}
}
