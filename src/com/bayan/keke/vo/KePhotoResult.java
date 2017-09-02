package com.bayan.keke.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author zx
 *
 */
public class KePhotoResult implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -766099802393149093L;

	// 老师id
	private String teacherId = null;
	// 老师名称
	private String teacherName = null;
	// 图片id
	private String photoId = null;
	// 图片七牛存储URL
	private String photoUrl = null;
	// 作业状态:UNCORRECTED未批改(默认)、CORRECTING批改中、CORRECTED已完成、INVALID无效或模糊
	private String taskStatus = null;
	// 老师头像url
	private String teacherHeadUrl = null;
	// 图片批改信息
	private List<KeMark> pointsResult = new ArrayList<KeMark>();
	//退回作业图片的理由
	private String cause = null;
	//是否被举报（0否、1是）
	private String hasReported = null;
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
	
	public KePhotoResult() {
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
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

	public List<KeMark> getPointsResult() {
		return pointsResult;
	}

	public void setPointsResult(List<KeMark> pointsResult) {
		this.pointsResult = pointsResult;
	}

	public String getTeacherHeadUrl() {
		return teacherHeadUrl;
	}

	public void setTeacherHeadUrl(String teacherHeadUrl) {
		this.teacherHeadUrl = teacherHeadUrl;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getHasReported() {
		return hasReported;
	}

	public void setHasReported(String hasReported) {
		this.hasReported = hasReported;
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
