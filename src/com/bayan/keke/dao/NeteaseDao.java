package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeNetease;
import com.bayan.keke.vo.KeTeaUs;

@Scope("prototype")
@Repository
public class NeteaseDao extends BaseDao {
		
	/**
	 * 判断家长是否已注册云信ID
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> stuRegist(KeNetease kenetease) throws Exception {
		return this.getSqlSession().selectOne("netease.stuRegister", kenetease);
	}
	
	/**
	 * 判断老师是否已注册云信ID
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> teaRegist(KeNetease kenetease) throws Exception {
		return this.getSqlSession().selectOne("netease.teaRegister", kenetease);
	}
	
	/**
	 * 插入家长和云信关系信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addStuYunxin(KeNetease kenetease) throws Exception {
		Integer res = this.getSqlSession().insert("netease.insertStuYunxin", kenetease);
		res = kenetease.getId();
		return res;
	}

	/**
	 * 插入老师和云信关系信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addTeaYunxin(KeNetease kenetease) throws Exception {
		Integer res = this.getSqlSession().insert("netease.insertTeaYunxin", kenetease);
		res = kenetease.getId();
		return res;
	}
	
	/**
	 * 判断在线通话人数
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public String callingCnt() throws Exception {
		return this.getSqlSession().selectOne("netease.callingCnt");
	}
	
	/**
	 * 插入一次云信通话记录信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addCallYunxin(KeNetease kenetease) throws Exception {
		Integer res = this.getSqlSession().insert("netease.insertCallYunxin", kenetease);
		res = kenetease.getId();
		return res;
	}
	
	/**
	 * 插入一次云信消息推送记录
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer addMSGYunxin(KeNetease kenetease) throws Exception {
		Integer res = this.getSqlSession().insert("netease.insertMSGYunxin", kenetease);
		res = kenetease.getId();
		return res;
	}
	
	/**
	 * 查询家长端用户的类型对应的设备号
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public String selStuDevice(KeNetease kenetease) throws Exception {
		return this.getSqlSession().selectOne("netease.selectStuDevice", kenetease);
	}
	
	/**
	 * 查询老师端用户的类型对应的设备号
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public String selTeaDevice(KeNetease kenetease) throws Exception {
		return this.getSqlSession().selectOne("netease.selectTeaDevice", kenetease);
	}
	
	/**
	 * 更新学生答疑的状态
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upStuStatusYX(KeNetease kenetease) throws Exception {
		return this.getSqlSession().update("netease.upStuStatusYX", kenetease);
	}
	
	/**
	 * 更新老师答疑的状态
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upTeaStatusYX(KeNetease kenetease) throws Exception {
		return this.getSqlSession().update("netease.upTeaStatusYX", kenetease);
	}
	
	/**
	 * 取得通话记录信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getRecordInfo(KeNetease kenetease) throws Exception {
		return this.getSqlSession().selectOne("netease.getRecordInfo", kenetease);
	}
	
	/**
	 * 更新老师答疑的收入
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upAnswerPay(KeNetease kenetease) throws Exception {
		return this.getSqlSession().update("netease.upAnswerPay", kenetease);
	}
	
	/**
	 * 更新老师答疑结果信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upAnswerInfo(KeNetease kenetease) throws Exception {
		return this.getSqlSession().update("netease.upAnswerInfo", kenetease);
	}
	
	/**
	 * 更新学生对答疑老师的评价
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upAnswerComment(KeNetease kenetease) throws Exception {
		return this.getSqlSession().update("netease.upAnswerComment", kenetease);
	}
	
	/**
	 * 查询超时未接通的学生推送消息记录信息
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public List<KeNetease> selListRcd(KeNetease kenetease) throws Exception {
		return this.getSqlSession().selectList("netease.getMSGRecordInfo", kenetease);
	}
	
	/**
	 * 更新超时提醒学生的记录状态
	 * 
	 * @param KeNetease
	 * @return
	 * @throws Exception
	 */
	public Integer upMSGRcd(KeNetease kenetease) throws Exception {
		return this.getSqlSession().update("netease.upStuMSGStatusYX", kenetease);
	}
	
}
