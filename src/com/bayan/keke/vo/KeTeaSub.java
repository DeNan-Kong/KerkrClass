package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeTeaSub implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1L;

	// 老师ID
	private String teacherId;
	// 科目类别 语文:01 数学:02 英语:03
	private String subjectType;
	// 作业状态
	private String taskStatus;
	// 上传的每张作业的ID
	private String photoId;
	// 评语
	private String comment;
	// 作业的组ID
	private String groupId;
	// 图片顺序
	private String photoSort;
	// 提现金额
	private String outputMoney;
	// 提现密码
	private String password;
	// 图片批改信息
	private KeMark[] pointsResult = null;
	//收款方支付宝账号
	private String toAccount = null;
	//姓名
	private String toName = null;
	//按钮区分，收工，下一份 0:收工 1:下一份
	private String buttonFlag = null;	
	//当前作业份数
	private String total;
	//作业批改结果
	private String workJson;
	/**
	 * 批改作业老师类型(0:内部老师,1:外部老师) .
	 */
	private String type;
	/**
	 * 作业退回的理由,存在DB里是comment字段
	 */
	private String cause;
	
	//所属组织
	private String orgId;
	
	/** default constructor */
	public KeTeaSub() {
	}

	
	public String getOrgId() {
		return orgId;
	}


	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}


	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getSubjectType() {
		return subjectType;
	}

	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPhotoSort() {
		return photoSort;
	}

	public void setPhotoSort(String photoSort) {
		this.photoSort = photoSort;
	}

	
	public String getOutputMoney() {
		return outputMoney;
	}

	public void setOutputMoney(String outputMoney) {
		this.outputMoney = outputMoney;
	}



	public KeMark[] getPointsResult() {
		return pointsResult;
	}

	public void setPointsResult(KeMark[] pointsResult) {
		this.pointsResult = pointsResult;
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

	public String getButtonFlag() {
		return buttonFlag;
	}

	public void setButtonFlag(String buttonFlag) {
		this.buttonFlag = buttonFlag;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getWorkJson() {
		return workJson;
	}

	public void setWorkJson(String workJson) {
		this.workJson = workJson;
	}

	

	
}