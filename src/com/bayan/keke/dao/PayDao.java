package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KeTeaOutputRcd;

@Scope("prototype")
@Repository
public class PayDao extends BaseDao {
	
	/**
	 * 查询数据库剩余油量，自动见油量
	 */
	public List<String> shelf() throws Exception {
		return this.getSqlSession().selectList("pay.shelf");
	}
	
	/**
	 * 每天减去1L油量
	 */
	public void updateShelf() throws Exception {
		this.getSqlSession().update("pay.updateShelf");
	}
	
	/**
	 * 未充值，加入一条数据
	 */
	public Integer add(KePay Pay) throws Exception {
		Integer res = this.getSqlSession().insert("pay.insert", Pay);
		res = Pay.getId();
		return res;
	}

	/**
	 * 查看剩余油量
	 */
	public String remainCntOil(KePay Pay) throws Exception {
		return this.getSqlSession().selectOne("pay.remainCnt", Pay);
	}
	
	/**
	 * 查看充值后的油量
	 */
	public String countOil(KePay Pay) throws Exception {
		return this.getSqlSession().selectOne("pay.count", Pay);
	}
	
	/**
	 * 添加新的油量
	 */
	public Integer updateOil(KePay Pay) throws Exception {
		return this.getSqlSession().update("pay.update", Pay);
	}
	
	/**
	 * 检查用户是否有充值过
	 */
	public Map<String, Object> selectOil(KePay Pay) throws Exception {
		return this.getSqlSession().selectOne("pay.register", Pay);
	}
	
	/**
	 * 加入一条数据记录
	 */
	public Integer addRecord(KePay Pay) throws Exception {
		Integer res = this.getSqlSession().insert("pay.record", Pay);
		res = Pay.getId();
		return res;
	}
	
	/**
	 * 学生端查询充值记录
	 */
	public List<KePay> selectRecord(KePay Pay) throws Exception {
		return this.getSqlSession().selectList("pay.selcetRecord", Pay);
	}
	
	/**
	 * 老师端收益记录
	 */
	public List<KeTeaOutputRcd> getRecord(KePay Pay) throws Exception {
		return this.getSqlSession().selectList("pay.getRecord", Pay);
	}
	
	/**
	 * 查看订单号
	 */
	public String selectOrderNum(KePay Pay) throws Exception {
		return this.getSqlSession().selectOne("pay.selectOrder", Pay);
	}
	
	/**
	 * 查看支付宝订单号
	 */
	public Integer selorderNum(KePay Pay) throws Exception {
		return this.getSqlSession().selectOne("pay.selorderNum", Pay);
	}

	/**
	 * 更新用户类型
	 */
	public Integer updateType(KePay Pay) throws Exception {
		return this.getSqlSession().update("pay.changeOil", Pay);
	}
	
	/**
	 * 油量加减
	 */
	public Integer changeOil(Map<String, String> param) throws Exception {
		return this.getSqlSession().update("pay.changeOil", param);
	}
	
	/**
	 * 获取作业信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> getTaskInfo(Map<String, String> map) throws Exception {
		Map<String,String> res = this.getSqlSession().selectOne("pay.getTaskInfo", map);
		return res;
	}
}
