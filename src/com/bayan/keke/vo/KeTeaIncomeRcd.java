package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeTeaIncomeRcd implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -5338867911125318482L;

	// ID
	private String id = null;
	//老师id
	private String teacherId = null;
	//金额
	private String amount = null;
	//0:收入,1:支出
	private String type = null;
	//手续费
	private String charge = null;
	//0:申请中 1:商户申请中 2:处理完成（可能成功，可能失败）
	private String status = null;
	//转账批次号
	private String batchNo = null;
	//是否转账成功
	private String result = null;
	//流水号
	private String serialNumber = null;
	//收款方支付宝账号
	private String toAccount = null;
	//姓名
	private String toName = null;
	//支付宝内部流水号
	private String alipayNumber = null;
	//成功或失败原因
	private String reason = null;
	//申请提现时间或入账时间
	private String createTime = null;
	//支付完成时间
	private String finishTime = null;
	//更新时间
	private String updateTime = null;
	// 说明
	private String comment = null;
	
	/** default constructor */
	public KeTeaIncomeRcd() {
	}

	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getToAccount() {
		return toAccount;
	}

	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getAlipayNumber() {
		return alipayNumber;
	}

	public void setAlipayNumber(String alipayNumber) {
		this.alipayNumber = alipayNumber;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}


	public String getCharge() {
		return charge;
	}


	public void setCharge(String charge) {
		this.charge = charge;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}
	
}