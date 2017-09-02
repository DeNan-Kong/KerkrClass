package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeMarkDb implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 6432355789452982320L;

	// 用户唯一编号
	private String userId = null;
	// 上传的每张作业的ID
	private String photoId = null;
	// 上传一份作业的组ID
	private String groupId = null;
	//x坐标
	private String pointx = null;
	//y坐标
	private String pointy = null;
	//标签方向 -1向左，+1向右
	private String direction = null;
	//若正确则为right,错误则为错误原因
	private String content = null;
	//对或错:0错误、1正确
	private String result = null;
	//已解决
	private String resolvedFlag = null;
	
	/** default constructor */
	public KeMarkDb() {
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

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getResolvedFlag() {
		return resolvedFlag;
	}

	public void setResolvedFlag(String resolvedFlag) {
		this.resolvedFlag = resolvedFlag;
	}
	
}