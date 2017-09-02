package com.bayan.keke.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author zx
 *
 */
public class WorkJsonVo implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1L;

	// 老师ID
	private String teacherId;
	// 科目类别 语文:01 数学:02 英语:03
	private String subjectType;
	// 上传的每张作业的ID
	private String photoId;
	// 图片批改信息
	private KeMark[] pointsResult = null;
	
	/** default constructor */
	public WorkJsonVo() {
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

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}

	public KeMark[] getPointsResult() {
		return pointsResult;
	}

	public void setPointsResult(KeMark[] pointsResult) {
		this.pointsResult = pointsResult;
	}
	

}
