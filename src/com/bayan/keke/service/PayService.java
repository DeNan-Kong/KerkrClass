package com.bayan.keke.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.bayan.keke.dao.PayDao;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KeTeaOutputRcd;

@Scope("prototype")
@Service
public class PayService {
	/**
	 * 
	 */
	@Resource
	private PayDao payDao;

	/**
	 * 未充值，加入一条数据
	 */
	public Integer add(KePay Pay) throws Exception {
		return payDao.add(Pay);
	}

	/**
	 * 查看剩余油量
	 */
	public String remainCntOil(KePay Pay) throws Exception {
		return payDao.remainCntOil(Pay);
	}
	
	/**
	 * 添加新的油量
	 */
	public Integer updateOil(KePay Pay) throws Exception {
		return payDao.updateOil(Pay);
	}
	
	/**
	 * 查看充值后的油量
	 */
	public String countOil(KePay Pay) throws Exception {
		return payDao.countOil(Pay);
	}
	
	/**
	 * 检查用户是否有充值过
	 */
	public Map<String, Object> selectOil(KePay Pay) throws Exception {
		return payDao.selectOil(Pay);
	}
	
	/**
	 * 加入一条数据记录
	 */
	public Integer addRecord(KePay Pay) throws Exception {
		return payDao.addRecord(Pay);
	}
	
	/**
	 * 学生端查询充值记录
	 */
	public List<KePay> selectRecord(KePay Pay) throws Exception {
		return payDao.selectRecord(Pay);
	}
	
	/**
	 * 老师端收益记录
	 */
	public List<KeTeaOutputRcd> getRecord(KePay Pay) throws Exception {
		return payDao.getRecord(Pay);
	}
	
	/**
	 * 查看订单号
	 */
	public String selectOrderNum(KePay Pay) throws Exception {
		return payDao.selectOrderNum(Pay);
	}
	
	/**
	 * 查看支付宝订单号
	 */
	public Integer selorderNum(KePay Pay) throws Exception {
		return payDao.selorderNum(Pay);
	}
	
	/**
	 * 添加新的油量
	 */
	public Integer updateType(KePay Pay) throws Exception {
		return payDao.updateType(Pay);
	}
	
	/**
	 * 油量加减
	 */
	public Integer changeOil(Map<String, String> param) throws Exception {
		return payDao.changeOil(param);
	}
	
	/**
	 * 获取作业信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> getTaskInfo(Map<String, String> map) throws Exception {
		return payDao.getTaskInfo(map);
	}
}
