package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeSales;

@Scope("prototype")
@Repository
public class SalesDao extends BaseDao {
	
	/**
	 * 判断是否已注册
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> salRegist(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.salRegister", Kesales);
	}
	
	/**
	 * 用户信息添加
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer salAdd(KeSales Kesales) throws Exception {
		Integer res = this.getSqlSession().insert("sal.salInsert", Kesales);
		res = Kesales.getId();
		return res;
	}

	/**
	 * 老师登陆
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> salLogin(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.salLogin", Kesales);
	}
	
	/**
	 * 验证码添加
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer addCode(KeSales Kesales) throws Exception {
		Integer res = this.getSqlSession().insert("sal.insertCode", Kesales);
		res = Kesales.getId();
		return res;
	}

	/**
	 * 重置密码
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPW(KeSales Kesales) throws Exception {
		return this.getSqlSession().update("sal.pwReset", Kesales);
	}
	
	/**
	 * 老师信息修改
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer updateSalInfo(KeSales Kesales) throws Exception {
		return this.getSqlSession().update("sal.upSalInfo", Kesales);
	}
	
	/**
	 * 取得优惠码 
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String getSid(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.getSidCode", Kesales);
	}
	
	/**
	 * 取得省List
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public List<KeSales> listProvince() throws Exception {
		return this.getSqlSession().selectList("sal.listProvince");
	}
	
	/**
	 * 取得市List 
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public List<KeSales> listCity(String cityCode) throws Exception {
		return this.getSqlSession().selectList("sal.listCity", cityCode);
	}
	
	/**
	 * 判断优惠码是否有效
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String salSid(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.salSidCode", Kesales);
	}
	
	/**
	 * 添加SID码信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer salAddSid(KeSales Kesales) throws Exception {
		Integer res = this.getSqlSession().insert("sal.salInsertSid", Kesales);
		res = Kesales.getId();
		return res;
	}
	
	/**
	 * 更新SID优惠码使用次数
	 * 使用一次加1
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer updateSID(KeSales Kesales) throws Exception {
		return this.getSqlSession().update("sal.sidUse", Kesales);
	}
	
	/**
	 * 判断是否已经有FID码的使用记录
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String fidRegist(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.salFidCode", Kesales);
	}
	
	/**
	 * FID码使用记录插入
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer salAddFid(KeSales Kesales) throws Exception {
		Integer res = this.getSqlSession().insert("sal.fidInsert", Kesales);
		res = Kesales.getId();
		return res;
	}
	
	/**
	 * 查询优惠码对应的老师信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String getTeaInfo(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.getTeaInfo", Kesales);
	}
	
	/**
	 * 更新SID优惠码使用后给营销老师的金额
	 * 使用一次加1
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer updatePay(KeSales Kesales) throws Exception {
		return this.getSqlSession().update("sal.promoteSetMoney", Kesales);
	}
	
	/**
	 * 加入一条推广老师收益数据记录
	 */
	public Integer addSIDRecord(KeSales Kesales) throws Exception {
		Integer res = this.getSqlSession().insert("sal.sidRecord", Kesales);
		res = Kesales.getId();
		return res;
	}
	
	/**
	 * 活动取得优金额 
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String getSixOneSid(KeSales Kesales) throws Exception {
		return this.getSqlSession().selectOne("sal.getSixOneMoney", Kesales);
	}
}
