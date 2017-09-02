package com.bayan.keke.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.bayan.keke.dao.ManageDao;
import com.bayan.keke.vo.KeManage;
import com.bayan.keke.vo.KeTeaIncome;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaUs;

/**
 * 
 * @author zx
 *
 */
@Scope("prototype")
@Service
public class ManageService {
	/**
	 * 
	 */
	@Resource
	private ManageDao manageDao;

	/**
	 * 查询老师当天提现记录
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaIncomeRcd> searchPayRecord(KeManage keManage) throws Exception {
		List<KeTeaIncomeRcd> res = manageDao.searchPayRecord(keManage);
		return res;
	}
	
	/**
	 * 查询推广老师当天提现记录
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaIncomeRcd> searchPayRecordTg(KeManage keManage) throws Exception {
		List<KeTeaIncomeRcd> res = manageDao.searchPayRecordTg(keManage);
		return res;
	}
	
	/**
	 * 转账批次号和状态修改
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updatePayStatus(KeManage keManage) throws Exception {
		Integer res = manageDao.updatePayStatus(keManage);
		return res;
	}
	
	/**
	 * 推广转账批次号和状态修改
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updatePayStatusTg(KeManage keManage) throws Exception {
		Integer res = manageDao.updatePayStatusTg(keManage);
		return res;
	}
	
	/**
	 * 获取教师资格证
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaUs> searchCertification(KeManage keManage) throws Exception {
		List<KeTeaUs> res = manageDao.searchCertification(keManage);
		return res;
	}
	
	/**
	 * 获取举报内容
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> searchReport(KeManage keManage) throws Exception {
		List<Map<String,Object>> res = manageDao.searchReport(keManage);
		return res;
	}
	
	/**
	 * 审批资格证
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateApprvStatus(KeManage keManage) throws Exception {
		Integer res = manageDao.updateApprvStatus(keManage);
		return res;
	}
	
	/**
	 * 更新老师状态改为无效老师
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer invalidTeacher(KeManage keManage) throws Exception {
		Integer res = manageDao.invalidTeacher(keManage);
		return res;
	}
	
	/**
	 * 批次番号
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer searchBatchNo(String batchNo) throws Exception {
		Integer res = manageDao.searchBatchNo(batchNo);
		return res;
	}
	
	/**
	 * 推广批次番号
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer searchBatchNoTg(String batchNo) throws Exception {
		Integer res = manageDao.searchBatchNoTg(batchNo);
		return res;
	}
	
	/**
	 * 更新支付宝回调信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateAipayInfo(KeTeaIncomeRcd keTeaIncomeRcd) throws Exception {
		Integer res = manageDao.updateAipayInfo(keTeaIncomeRcd);
		return res;
	}
	
	/**
	 * 推广更新支付宝回调信息
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateAipayInfoTg(KeTeaIncomeRcd keTeaIncomeRcd) throws Exception {
		Integer res = manageDao.updateAipayInfoTg(keTeaIncomeRcd);
		return res;
	}
	
	/**
	 * 支付失败，退回金额
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer returnTeaIncome(KeTeaIncomeRcd keTeaIncomeRcd) throws Exception {
		Integer res = manageDao.returnTeaIncome(keTeaIncomeRcd);
		return res;
	}
	
	/**
	 * 推广支付失败，退回金额
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer returnTeaIncomeTg(KeTeaIncomeRcd keTeaIncomeRcd) throws Exception {
		Integer res = manageDao.returnTeaIncomeTg(keTeaIncomeRcd);
		return res;
	}
	
	/**
	 * 添加老师退款记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insTeaIncomeRcd(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = manageDao.insReturnRcd(teaIncomeRcd);
		return res;
	}
	
	/**
	 * 推广添加老师退款记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insTeaIncomeRcdTg(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = manageDao.insReturnRcdTg(teaIncomeRcd);
		return res;
	}
	
	/**
	 * 查询老师id
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public KeTeaIncomeRcd selRcdWithSerNum(KeTeaIncomeRcd rcd) throws Exception {
		KeTeaIncomeRcd res = manageDao.selRcdWithSerNum(rcd);
		return res;
	}
	
	/**
	 * 推广查询老师id
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public KeTeaIncomeRcd selRcdWithSerNumTg(KeTeaIncomeRcd rcd) throws Exception {
		KeTeaIncomeRcd res = manageDao.selRcdWithSerNumTg(rcd);
		return res;
	}
	
	/**
	 * 统计
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<Integer> tongji() throws Exception {
		List<Integer> res = manageDao.tongji();
		return res;
	}
	
	/**
	 * 获取老师或学生信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> selTeacherOrUserInfo(String sqlId, Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selTeacherOrUserInfo(sqlId, map);
		return res;
	}

	/**
	 * 获取老师学生日均增长
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> dayCount(KeManage keManage) throws Exception {
		Map<String, Object> res = manageDao.dayCount(keManage);
		return res;
	}
	
	/**
	 * 批量生成FID
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer insertFids(List<Map<String, String>> fidList) throws Exception {
		Integer res = manageDao.insertFids(fidList);
		return res;
	}
	
	/**
	 * 查询FID个数
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer countFid(Map<String, Object> map) throws Exception {
		Integer res = manageDao.countFid(map);
		return res;
	}
	
	/**
	 * 查询FID信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selFidInfo(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selFidInfo(map);
		return res;
	}
	
	/**
	 * 查询FID是否存在
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer selFid(Map<String, Object> map) throws Exception {
		Integer res = manageDao.selFid(map);
		return res;
	}
	
	/**
	 * 查询SID个数
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer countSid(Map<String, Object> map) throws Exception {
		Integer res = manageDao.countSid(map);
		return res;
	}
	
	/**
	 * 查询单个SID使用次数
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer countSidWithTeaId(Map<String, Object> map) throws Exception {
		Integer res = manageDao.countSidWithTeaId(map);
		return res;
	}
	
	/**
	 * 查询单个SID使用详情
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selSidInfoWithTeaId(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selSidInfoWithTeaId(map);
		return res;
	}
	
	/**
	 * 查询SID信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selSidInfo(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selSidInfo(map);
		return res;
	}
	
	/**
	 * SID作废
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer invalidSid(KeManage keManage) throws Exception {
		Integer res = manageDao.invalidSid(keManage);
		return res;
	}
	
	/**
	 * 查询单个老师的SID信息
	 * 
	 * @param keManage
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selSidWithTeacherId(KeManage keManage) throws Exception {
		List<Map<String, Object>> res = manageDao.selSidWithTeacherId(keManage);
		return res;
	}
	
	/**
	 * 查询老师总收入
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public KeTeaIncome selTeaIncomeTotal(KeManage keManage) throws Exception {
		KeTeaIncome res = manageDao.selTeaIncomeTotal(keManage);
		return res;
	}
	
	/**
	 * 查询推广老师当天提现记录
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaIncomeRcd> selOutMoneyToday(KeManage keManage) throws Exception {
		List<KeTeaIncomeRcd> res = manageDao.selOutMoneyToday(keManage);
		return res;
	}
	
	/**
	 * 添加推广老师提现记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insTeaOutRcd(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = manageDao.insTeaOutRcd(teaIncomeRcd);
		return res;
	}
	
	/**
	 * 推广老师提现,更改已提现金额
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateTeaIncome(KeManage keManage) throws Exception {
		Integer res = manageDao.updateTeaIncome(keManage);
		return res;
	}
	
	/**
	 * 查询心愿个数
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer countWish(Map<String, Object> map) throws Exception {
		Integer res = manageDao.countWish(map);
		return res;
	}
	
	/**
	 * 查询心愿信息
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selWishList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selWishList(map);
		return res;
	}
	
	/**
	 * 获取收入支出
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selIncomeOutgo(KeManage keManage) throws Exception {
		Map<String, Object> res = manageDao.selIncomeOutgo(keManage);
		return res;
	}
	
	/**
	 * 总收入查询
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selIncomeTotal(KeManage keManage) throws Exception {
		Map<String, Object> res = manageDao.selIncomeTotal(keManage);
		return res;
	}
	
	/**
	 * 总支出查询
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selOutgoTotal(KeManage keManage) throws Exception {
		Map<String, Object> res = manageDao.selOutgoTotal(keManage);
		return res;
	}
	
	/**
	 * 更新举报内容审核结果
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public Integer updateReportResult(Map<String, Object> map) throws Exception {
		Integer res = manageDao.updateReportResult(map);
		return res;
	}
	
	/**
	 * 查询设备ID
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selDevices(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selDevices(map);
		return res;
	}
	
	/**
	 * 查询作业批改情况
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selPhotoInfo(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> res = manageDao.selPhotoInfo(map);
		return res;
	}
	
	/**
	 * 查询序列号对应的设备
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<String> selDeviceWithSerial(List<String> serList) throws Exception {
		List<String> res = manageDao.selDeviceWithSerial(serList);
		return res;
	}
}
