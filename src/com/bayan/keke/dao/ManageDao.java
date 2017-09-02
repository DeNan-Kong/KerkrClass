package com.bayan.keke.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.bayan.keke.base.BaseDao;
import com.bayan.keke.vo.KeManage;
import com.bayan.keke.vo.KeTeaIncome;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaUs;

@Scope("prototype")
@Repository
public class ManageDao extends BaseDao {

	/**
	 * 查询提现申请
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaIncomeRcd> searchPayRecord(KeManage keManage) throws Exception {
		List<KeTeaIncomeRcd> res = this.getSqlSession().selectList("manage.searchPayRecord", keManage);
		return res;
	}
	
	/**
	 * 查询推广提现申请
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public List<KeTeaIncomeRcd> searchPayRecordTg(KeManage keManage) throws Exception {
		List<KeTeaIncomeRcd> res = this.getSqlSession().selectList("manage.searchPayRecordTg", keManage);
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
		Integer res = this.getSqlSession().selectOne("manage.searchBatchNo", batchNo);
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
		Integer res = this.getSqlSession().selectOne("manage.searchBatchNoTg", batchNo);
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
		Integer res = this.getSqlSession().update("manage.updatePayStatus", keManage);
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
		Integer res = this.getSqlSession().update("manage.updatePayStatusTg", keManage);
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
		List<KeTeaUs> res = this.getSqlSession().selectList("manage.searchCertification", keManage);
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
		List<Map<String,Object>> res = this.getSqlSession().selectList("manage.searchReport", keManage);
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
		KeTeaIncomeRcd res = this.getSqlSession().selectOne("manage.selRcdWithSerNum", rcd);
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
		KeTeaIncomeRcd res = this.getSqlSession().selectOne("manage.selRcdWithSerNumTg", rcd);
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
		Integer res = this.getSqlSession().update("manage.updateApprvStatus", keManage);
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
		Integer res = this.getSqlSession().update("manage.invalidTeacher", keManage);
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
		Integer res = this.getSqlSession().update("manage.updateAipayInfo", keTeaIncomeRcd);
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
		Integer res = this.getSqlSession().update("manage.updateAipayInfoTg", keTeaIncomeRcd);
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
		Integer res = this.getSqlSession().update("manage.returnTeaIncome", keTeaIncomeRcd);
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
		Integer res = this.getSqlSession().update("manage.returnTeaIncomeTg", keTeaIncomeRcd);
		return res;
	}
	
	/**
	 * 添加老师退款记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insReturnRcd(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = this.getSqlSession().insert("manage.insReturnRcd", teaIncomeRcd);
		return res;
	}
	
	/**
	 * 推广添加老师退款记录
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public Integer insReturnRcdTg(KeTeaIncomeRcd teaIncomeRcd) throws Exception {
		Integer res = this.getSqlSession().insert("manage.insReturnRcdTg", teaIncomeRcd);
		return res;
	}
	
	/**
	 * 统计
	 * 
	 * @param teaIncomeRcd
	 * @return
	 * @throws Exception
	 */
	public List<Integer> tongji() throws Exception {
		List<Integer> res = this.getSqlSession().selectList("manage.selectTongji");
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
		List<Map<String,Object>> res = this.getSqlSession().selectList(sqlId, map);
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
		Map<String, Object> res = this.getSqlSession().selectOne("manage.dayCount", keManage);
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
		Integer res = this.getSqlSession().insert("manage.insertFids", fidList);
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
		Integer res = this.getSqlSession().selectOne("manage.countFid", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selFidInfo", map);
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
		Integer res = this.getSqlSession().selectOne("manage.selFid", map);
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
		Integer res = this.getSqlSession().selectOne("manage.countSid", map);
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
		Integer res = this.getSqlSession().selectOne("manage.countSidWithTeaId", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selSidInfo", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selSidInfoWithTeaId", map);
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
		Integer res = this.getSqlSession().update("manage.invalidSid", keManage);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selSidWithTeacherId", keManage);
		return res;
	}
	
	/**
	 * 查询推广老师总收入
	 * 
	 * @param keTeaSub
	 * @return
	 * @throws Exception
	 */
	public KeTeaIncome selTeaIncomeTotal(KeManage keManage) throws Exception {
		KeTeaIncome res = this.getSqlSession().selectOne("manage.selTeaIncomeTotal", keManage);
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
		List<KeTeaIncomeRcd> res = this.getSqlSession().selectList("manage.selOutMoneyToday", keManage);
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
		Integer res = this.getSqlSession().update("manage.updateTeaIncome", keManage);
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
		Integer res = this.getSqlSession().update("manage.insTeaOutRcd", teaIncomeRcd);
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
		Integer res = this.getSqlSession().selectOne("manage.countWish", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selWishList", map);
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
		Map<String, Object> res = this.getSqlSession().selectOne("manage.selIncomeOutgo", keManage);
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
		Map<String, Object> res = this.getSqlSession().selectOne("manage.selIncomeTotal", keManage);
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
		Map<String, Object> res = this.getSqlSession().selectOne("manage.selOutgoTotal", keManage);
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
		Integer res = this.getSqlSession().update("manage.updateReportResult", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selDevices", map);
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
		List<Map<String, Object>> res = this.getSqlSession().selectList("manage.selPhotoInfo", map);
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
		List<String> res = this.getSqlSession().selectList("manage.selDeviceWithSerial", serList);
		return res;
	}
}
