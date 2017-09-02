package com.bayan.keke.vo;

public class KeVersion implements java.io.Serializable {
	/* */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 系列号ID .
	 */
	private Integer id;

	/**
	 * 课课最新版本号 .
	 */
	private String versionNo;

	/**
	 * 更新内容 .
	 */
	private String comment;

	/**
	 * 是否要强制更新：1要、0不要 .
	 */
	private String force;
	
	/**
	 * 是否要提醒用户更新：1要、0不要 .
	 */
	private String notice;
	
	/**
	 * 用户类型:0家长、1老师 .
	 */
	private String type;
	
	/**
	 * 设备类型:0iPhone、1Android .
	 */
	private String deviceType;
	
	/**
	 * 创建时间 .
	 */
	private String createTime;
	
	/**
	 * 更新时间 .
	 */
	private String updateTime;
	
	/**
	 * 安卓下载地址 .
	 */
	private String downloadUrl;
	
	/** default constructor */
	public KeVersion(){
		
	}
	
	/**
	 * 系列号ID的设定 .
	 * 
	 * @param id 系列号ID
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 系列号ID的取得 .
	 * 
	 * @return 系列号ID
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 课课最新版本号的设定 .
	 * 
	 * @param versionNo 课课最新版本号
	 */
	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}

	/**
	 * 课课最新版本号的取得 .
	 * 
	 * @return 课课最新版本号
	 */
	public String getVersionNo() {
		return versionNo;
	}

	/**
	 * 创建时间的设定 .
	 * 
	 * @param createTime 创建时间
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	/**
	 * 创建时间的取得 .
	 * 
	 * @return 创建时间
	 */
	public String getCreateTime() {
		return createTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getForce() {
		return force;
	}

	public void setForce(String force) {
		this.force = force;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getDownloadUrl() {
		return downloadUrl;
	}

	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
}
