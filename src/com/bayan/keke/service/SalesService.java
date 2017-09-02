package com.bayan.keke.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.SalesDao;
import com.bayan.keke.vo.KeSales;

@Scope("prototype")
@Service
public class SalesService {
	/* */
	@Resource
	private SalesDao SalesDao;

	/**
	 * 判断是否已注册
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> salRegist(KeSales kesales) throws Exception {
		return SalesDao.salRegist(kesales);
	}
	
	/**
	 * 添加信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer salAdd(KeSales kesales) throws Exception {
		SalesDao.salAdd(kesales);
		return kesales.getId();
	}
	
	/**
	 * 老师登陆
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> salLogin(KeSales kesales) throws Exception {
		return SalesDao.salLogin(kesales);
	}
	
	/**
	 * 重置密码
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer reSetPW(KeSales kesales) throws Exception {
		return SalesDao.reSetPW(kesales);
	}
	
	/**
	 * 老师信息修改
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer updateSalInfo(KeSales kesales) throws Exception {
		return SalesDao.updateSalInfo(kesales);
	}
	
	/**
	 * 验证码添加
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer addCode(KeSales kesales) throws Exception {
		return SalesDao.addCode(kesales);
	}
	
	/**
	 * 取得优惠码 
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String getSid(KeSales kesales) throws Exception {
		return SalesDao.getSid(kesales);
	}
	
	/**
	 * 取得省List
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public List<KeSales> listProvince() throws Exception {
		return SalesDao.listProvince();
	}
	
	/**
	 * 取得市List
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public List<KeSales> listCity(String cityCode) throws Exception {
		return SalesDao.listCity(cityCode);
	}
	
	/**
	 * 判断优惠码是否有效
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String salSid(KeSales kesales) throws Exception {
		return SalesDao.salSid(kesales);
	}
	
	/**
	 * 添加SID码信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer salAddSid(KeSales kesales) throws Exception {
		SalesDao.salAddSid(kesales);
		return kesales.getId();
	}
	
	/**
	 * 更新SID优惠码使用次数
	 * 使用一次加1
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updateSID(KeSales kesales) throws Exception {
		return SalesDao.updateSID(kesales);
	}
	
	/**
	 * 判断是否已经有FID码的使用记录
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String fidRegist(KeSales kesales) throws Exception {
		return SalesDao.fidRegist(kesales);
	}
	
	/**
	 * FID码使用记录插入
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public Integer salAddFid(KeSales kesales) throws Exception {
		SalesDao.salAddFid(kesales);
		return kesales.getId();
	}
	
	/**
	 * 查询优惠码对应的老师信息
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String getTeaInfo(KeSales kesales) throws Exception {
		return SalesDao.getTeaInfo(kesales);
	}
	
	/**
	 * 更新SID优惠码使用后给营销老师的金额
	 * 使用一次加1
	 * 
	 * @param keUser
	 * @return
	 * @throws Exception
	 */
	public Integer updatePay(KeSales kesales) throws Exception {
		return SalesDao.updatePay(kesales);
	}
	
	/**
	 * 加入一条推广老师收益数据记录
	 */
	public Integer addSIDRecord(KeSales kesales) throws Exception {
		return SalesDao.addSIDRecord(kesales);
	}
	
	/**
	 * 活动取得优金额 
	 * 
	 * @param KeSales
	 * @return
	 * @throws Exception
	 */
	public String getSixOneSid(KeSales kesales) throws Exception {
		return SalesDao.getSixOneSid(kesales);
	}
}
