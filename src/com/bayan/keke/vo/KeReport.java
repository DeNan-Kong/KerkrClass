package com.bayan.keke.vo;

public class KeReport {
	// 序列号id
	private Integer id;
	// 用户ID
	private String userId;
	
	// 被举报老师ID
	private String teacherId;
	
	// 被举报作业照片的ID
	private String photoId;
	
	// 举报理由
	private String comment;
	
	// 是否需要重检（0不需要重检、1需要重检）
	private String reCheck;
	
	// 上传图片的原始宽度
	private String width;
	
	// 上传图片的原始高度
	private String height;
	
	/** default constructor */
	public KeReport() {
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

	public String getReCheck() {
		return reCheck;
	}

	public void setReCheck(String reCheck) {
		this.reCheck = reCheck;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
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
