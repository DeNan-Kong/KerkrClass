package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeDaily implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -8527362199254918013L;

	// 作业状态:UNCORRECTED未批改(默认)、CORRECTING批改中、CORRECTED已完成、INVALID无效或模糊
	private String taskStatus = null;
	// 上传作业时间
	private String createTime = null;
	// 作业批改完成时间
	private String updateTime = null;
	// 老师id
	private String teacherId = null;
	// 老师姓名
	private String teacherName = null;
	// 照片ID
	private String photoId = null;
	// 作业组ID
	private String groupId = null;
	// 图片流URL（从七牛上取照片）
	private String photoUrl = null;
	// 对或错
	private String result = null;
	// 图片位置x
	private String pointx = null;
	// 图片位置y
	private String pointy = null;
	// 错误原因
	private String reason = null;
	// 错误原因箭头方向
	private String direction = null;
	// 老师评语
	private String comment = null;
	// 老师头像url
	private String teacherHeadUrl = null;
	// 上传图片的原始宽度
	private String width;	
	// 上传图片的原始高度
	private String height;
	//机构ID
	private String orgId;
	//广告图片
	private String adphoto;
	//图片链接
	private String adlink;
	// 机构名
	private String orgName;
	/** default constructor */
	public KeDaily() {
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}


	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getPointx() {
		return pointx;
	}

	public void setPointx(String pointx) {
		this.pointx = pointx;
	}

	public String getPointy() {
		return pointy;
	}

	public void setPointy(String pointy) {
		this.pointy = pointy;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherHeadUrl() {
		return teacherHeadUrl;
	}

	public void setTeacherHeadUrl(String teacherHeadUrl) {
		this.teacherHeadUrl = teacherHeadUrl;
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

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getAdphoto() {
		return adphoto;
	}

	public void setAdphoto(String adphoto) {
		this.adphoto = adphoto;
	}

	public String getAdlink() {
		return adlink;
	}

	public void setAdlink(String adlink) {
		this.adlink = adlink;
	}
}