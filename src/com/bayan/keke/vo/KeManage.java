package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeManage implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1L;
	
	// 照片ID
	private String photoId;
	
	// 检索类型 0:用户申请中 1:商户申请中 2:支付宝处理完成
	private String searchType;
	
	//用户电话号码
	private String phoneNumber;
	
	//用户登录密码
	private String password;
	
	//批次号
	private String batchNo;
	
	//付款件数
	private String batchNum;
	
	//登陆者用户ID
	private String userId;
	
	//教师id
	private String teacherId;
	
	//资格证状态查询
	private String approveStatus;
	
	//统计老师学生类型 0:学生 1：老师
	private String tongjiType;
	
	// 日均增长开始时间
	private String startDate;
	
	// 日均增长结束时间
	private String endDate;
	
	// FID生成个数
	private String fidNum;
	
	// FIDSID查询类型
	private String fidSidType;
	
	// SID
	private String sid;
	
	// 提现金额
	private String outputMoney;
	//收款方支付宝账号
	private String toAccount = null;
	//姓名
	private String toName = null;
	
	// 用户区分 0:老师 1:推广机构
	private String userFlag = null;
	
	// 油量
	private String oil = null;
	
	//举报内容查询
	private String reportStatus = null;
	
	// 说明
	private String comment = null;
	
	/** default constructor */
	public KeManage() {
	}

	
	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getBatchNum() {
		return batchNum;
	}


	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}


	public String getBatchNo() {
		return batchNo;
	}


	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getApproveStatus() {
		return approveStatus;
	}


	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}


	public String getTeacherId() {
		return teacherId;
	}


	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}


	public String getTongjiType() {
		return tongjiType;
	}


	public void setTongjiType(String tongjiType) {
		this.tongjiType = tongjiType;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getFidNum() {
		return fidNum;
	}


	public void setFidNum(String fidNum) {
		this.fidNum = fidNum;
	}


	public String getFidSidType() {
		return fidSidType;
	}


	public void setFidSidType(String fidSidType) {
		this.fidSidType = fidSidType;
	}


	public String getSid() {
		return sid;
	}


	public void setSid(String sid) {
		this.sid = sid;
	}


	public String getOutputMoney() {
		return outputMoney;
	}


	public void setOutputMoney(String outputMoney) {
		this.outputMoney = outputMoney;
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


	public String getUserFlag() {
		return userFlag;
	}


	public void setUserFlag(String userFlag) {
		this.userFlag = userFlag;
	}


	public String getOil() {
		return oil;
	}


	public void setOil(String oil) {
		this.oil = oil;
	}


	public String getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}


	public String getPhotoId() {
		return photoId;
	}


	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}
	
}