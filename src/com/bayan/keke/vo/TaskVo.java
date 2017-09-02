package com.bayan.keke.vo;

public class TaskVo implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1443361378167413382L;

	// 用户唯一编号
	private String userId;
	// 用户唯一编号
	private String userName;
	// 老师ID
	private String teacherId;
	// 上传的每张作业的ID
	private String photoId;
	// 上传图片顺序
	private String photoSort;
	// 上传一份作业的组ID
	private String groupId;
	// 每张作业照片URL(七牛云存储)
	private String photoUrl;
	// 作业状态
	private String taskStatus;
	// 学生给的星星
	private String point;
	// 科目类别 语文:01 数学:02 英语:03
	private String subjectId;
	// 模糊图片删除标记
	private String deleteFlag;
	// 老师给的评语
	private String comment;
	// 作业上传时间
	private String createTime;
	// 作业批改时间
	private String updateTime;
	//所在城市的编号
	private String cityCode;
	//所在省份的编号
	private String provinceCode;
	// 上传图片的原始宽度
	private String width;	
	// 上传图片的原始高度
	private String height;
	
	/** default constructor */
	public TaskVo() {
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

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}

	public String getPhotoSort() {
		return photoSort;
	}

	public void setPhotoSort(String photoSort) {
		this.photoSort = photoSort;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getProvinceCode() {
		return provinceCode;
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

}
