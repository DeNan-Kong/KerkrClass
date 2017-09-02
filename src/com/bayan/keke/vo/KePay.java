package com.bayan.keke.vo;

public class KePay {
	// id
	private Integer id;
	// 用户ID
	private String userId;
	// 老师ID
	private String teacherId;
	// 充值类型 01:299 02:869 03:1699 04:免费码
	private String payType; 
	// 充值油量
	private String inputOil;
	// 剩余油量
	private String remainOil;
	// 充值后的油量
	private String count;
	// 充值金额
	private String payMoney;	
	// 充值时间
	private String createTime;
	// 收支类型：1:收入,0:支出
	private String type;
	//微信支付订单号
	private String orderNumber;
	/* 优惠码类型 .*/
	private String codeType;	
	/* SID码 .*/
	private String SIDCode;
	// 优惠金额
	private String discMoney;
	//说明
	private String comment;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(String payMoney) {
		this.payMoney = payMoney;
	}
	public String getInputOil() {
		return inputOil;
	}
	public void setInputOil(String inputOil) {
		this.inputOil = inputOil;
	}
	public String getRemainOil() {
		return remainOil;
	}
	public void setRemainOil(String remainOil) {
		this.remainOil = remainOil;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public String getSIDCode() {
		return SIDCode;
	}
	public void setSIDCode(String sIDCode) {
		SIDCode = sIDCode;
	}
	public String getDiscMoney() {
		return discMoney;
	}
	public void setDiscMoney(String discMoney) {
		this.discMoney = discMoney;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

}
