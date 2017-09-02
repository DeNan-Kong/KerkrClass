package com.bayan.keke.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author zx
 *
 */
public class KeDailyOpt implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -8527362199254918013L;

	// 作业组ID
	private String groupId = null;
	// 本组作业总的错误题数
	private String countError = null;
	// 本组作业总的正确题数
	private String countRight = null;
	// 该份作业的评级（A，B,C,D,E）
	private String level = null;
	// 老师评语
	private String comment = null;
	// 上传作业时间
	private String createTime = null;
	// 作业批改完成时间
	private String updateTime = null;
	
	// 图片信息
	private List<KePhotoResult> photoResult = new ArrayList<KePhotoResult>();

	
	/** default constructor */
	public KeDailyOpt() {
	}


	public String getGroupId() {
		return groupId;
	}


	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}


	public String getCountError() {
		return countError;
	}


	public void setCountError(String countError) {
		this.countError = countError;
	}


	public String getCountRight() {
		return countRight;
	}


	public void setCountRight(String countRight) {
		this.countRight = countRight;
	}


	public String getLevel() {
		return level;
	}


	public void setLevel(String level) {
		this.level = level;
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


	public List<KePhotoResult> getPhotoResult() {
		return photoResult;
	}


	public void setPhotoResult(List<KePhotoResult> photoResult) {
		this.photoResult = photoResult;
	}


	
}