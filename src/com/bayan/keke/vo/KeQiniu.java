package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeQiniu implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1L;
	
	//序列号Id(保留字段)
	private  String id;
	//用户唯一编号
	private String userId;
	//七牛存储key
	private String key;	
	//第三方认证token
	private String uploadToken;	
	//上传一份作业的组ID
	private String groupId;
	//上传的每张作业的ID
	private String photoId;
	
	/** default constructor */
	public KeQiniu() {
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUploadToken() {
		return uploadToken;
	}

	public void setUploadToken(String uploadToken) {
		this.uploadToken = uploadToken;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}
	
	



}