package com.bayan.keke.vo;

public class KeFeedback implements java.io.Serializable {
	/* */
	private static final long serialVersionUID = 1L;
	//系列号ID
	private Integer id;
	//用户ID
	private String userId;
	//反馈内容
	private String content;
	//用户名称
	private String userName;
	//用户电话号码
	private String phoneNumber;
	//用户类型:学生反馈:0,老师反馈:1
	private String type;
	//反馈时间
	private String createTime;
	
	/* defultContactor*/
	public KeFeedback(){		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}	
}
