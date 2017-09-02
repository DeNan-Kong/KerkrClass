package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeNetease implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 序列号Id .
	 */
	private Integer id = 0;
	
	// 用户唯一编号
	private String userId;

	/**
	 * 老师ID .
	 */
	private String teacherId;
	
	/**
	 * 云信ID .
	 */
	private String yunxinId;
	
	/**
	 * 云信Token .
	 */
	private String yunxinToken;
	
	/**
	 * 答疑时间   .
	 */
	private String costTime;
	
	/**
	 * 答疑开始时间   .
	 */
	private String startTime;
	
	/**
	 * 答疑结束时间   .
	 */
	private String endTime;
	
	/**
	 * 答疑费用   .
	 */
	private String answerPay;
	
	/**
	 * 答疑耗油   .
	 */
	private String costOil;
	
	/**
	 * 云信登录状态   .
	 */
	private String accStatus;
	
	/**
	 * 答疑老师云信ID   .
	 */
	private String teaAccId;
	
	/**
	 * 记录ID，通话结束后返回后台   .
	 */
	private String recordId;
	
	/**
	 * 请求结果标记   .
	 */
	private String flag;
	
	/**
	 * 答疑状态   .
	 */
	private String serviceStatus;
	
	/**
	 * 对答疑老师的评价   .
	 */
	private String comment;
	
	/**
	 * 给学生推送消息的时间   .
	 */
	private String toStuTime;
	
	/**
	 * 给答疑老师推送消息的时间   .
	 */
	private String toTeaTime;
	
	/**
	 * 学生推送标记(0:未推送 1：已推送) .
	 */
	private String sendFlagStu;
	
	/**
	 * 老师推送标记(0:未推送 1：已推送) .
	 */
	private String sendFlagTea;
	
	/**
	 * 0:超时挂断 1：学生挂断 2：老师挂断   .
	 */
	private String hangUp;
	
	/** default constructor */
	public KeNetease() {
	}

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

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getYunxinId() {
		return yunxinId;
	}

	public void setYunxinId(String yunxinId) {
		this.yunxinId = yunxinId;
	}

	public String getYunxinToken() {
		return yunxinToken;
	}

	public void setYunxinToken(String yunxinToken) {
		this.yunxinToken = yunxinToken;
	}

	public String getAccStatus() {
		return accStatus;
	}

	public void setAccStatus(String accStatus) {
		this.accStatus = accStatus;
	}

	public String getTeaAccId() {
		return teaAccId;
	}

	public void setTeaAccId(String teaAccId) {
		this.teaAccId = teaAccId;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getServiceStatus() {
		return serviceStatus;
	}

	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	public String getAnswerPay() {
		return answerPay;
	}

	public void setAnswerPay(String answerPay) {
		this.answerPay = answerPay;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCostOil() {
		return costOil;
	}

	public void setCostOil(String costOil) {
		this.costOil = costOil;
	}

	public String getCostTime() {
		return costTime;
	}

	public void setCostTime(String costTime) {
		this.costTime = costTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getSendFlagStu() {
		return sendFlagStu;
	}

	public void setSendFlagStu(String sendFlagStu) {
		this.sendFlagStu = sendFlagStu;
	}

	public String getSendFlagTea() {
		return sendFlagTea;
	}

	public void setSendFlagTea(String sendFlagTea) {
		this.sendFlagTea = sendFlagTea;
	}

	public String getHangUp() {
		return hangUp;
	}

	public void setHangUp(String hangUp) {
		this.hangUp = hangUp;
	}

	public String getToTeaTime() {
		return toTeaTime;
	}

	public void setToTeaTime(String toTeaTime) {
		this.toTeaTime = toTeaTime;
	}

	public String getToStuTime() {
		return toStuTime;
	}

	public void setToStuTime(String toStuTime) {
		this.toStuTime = toStuTime;
	}

}