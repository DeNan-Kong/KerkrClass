package com.bayan.keke.vo;

/**
 * KeUser entity. @author MyEclipse Persistence Tools
 */
public class KeUser implements java.io.Serializable {

	/**
	 * 学生序列号
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 序列号Id .
	 */
	private Integer id = 0;

	/**
	 * 学生ID .
	 */
	private String userId;

	/**
	 * 学生姓名 .
	 */
	private String userName;

	/**
	 * 学生昵称 .
	 */
	private String nickName;

	/**
	 * 学生电话号码 .
	 */
	private String phoneNumber;

	/**
	 * 学生登录密码 .
	 */
	private String password;

	/**
	 * 学生头像URL .
	 */
	private String headUrl;

	/**
	 * 年级（01,02,03,04,05,06） .
	 */
	private String grade;

	/**
	 * 移动设备Id .
	 */
	private String deviceId;

	/**
	 * 设备类型(android:1,iphone:0) .
	 */
	private String deviceType;

	/**
	 * 设备使用学生类型：0学生,1老师 .
	 */
	private String flag;

	/**
	 * 验证码 .
	 */
	private String verifyCode;

	/**
	 * 科目类别(01:语文,02:数学,03:英语) .
	 */
	private String subjectType;

	/**
	 * 所在城市的编号 .
	 */
	private String cityCode;

	/**
	 * 所在省份的编号 .
	 */
	private String provinceCode;

	/**
	 * 作业状态 .
	 * 作业状态:UNCORRECTED未批改(默认)、CORRECTING批改中、
	 * FINISH批改完成、CORRECTED已完成、INVALID无效或模糊
	 */
	private String taskStatus;

	/**
	 * 优秀学生标记(0:普通,1:优秀) .
	 */
	private String stuLevel;
	
	/**
	 * 用户类型(0:试用用户,1:充值用户) .
	 */
	private String type;

	// 所属机构
	private String orgId;

	//学生在校类型
	private Integer onType;

	private String address;

	/** default constructor */
	public KeUser() {
	}
	
	
	public String getOrgId() {
		return orgId;
	}


	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}


	/**
	 * 序列号Id的设定 .
	 * 
	 * @param id 序列号Id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 序列号Id的取得 .
	 * 
	 * @return 序列号Id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 学生ID的设定 .
	 * 
	 * @param userId 学生ID
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * 学生ID的取得 .
	 * 
	 * @return 学生ID
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * 学生姓名的设定 .
	 * 
	 * @param userName 学生姓名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 学生姓名的取得 .
	 * 
	 * @return 学生姓名
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 学生昵称的设定 .
	 * 
	 * @param nickName 学生昵称
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	/**
	 * 学生昵称的取得 .
	 * 
	 * @return 学生昵称
	 */
	public String getNickName() {
		return nickName;
	}

	/**
	 * 学生电话号码的设定 .
	 * 
	 * @param phoneNumber 学生电话号码
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * 学生电话号码的取得 .
	 * 
	 * @return 学生电话号码
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * 学生登录密码的设定 .
	 * 
	 * @param password 学生登录密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 学生登录密码的取得 .
	 * 
	 * @return 学生登录密码
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 学生头像URL的设定 .
	 * 
	 * @param headUrl 学生头像URL
	 */
	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	/**
	 * 学生头像URL的取得 .
	 * 
	 * @return 学生头像URL
	 */
	public String getHeadUrl() {
		return headUrl;
	}

	/**
	 * 年级（01,02,03,04,05,06）的设定 .
	 * 
	 * @param grade 年级（01,02,03,04,05,06）
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * 年级（01,02,03,04,05,06）的取得 .
	 * 
	 * @return 年级（01,02,03,04,05,06）
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * 移动设备Id的设定 .
	 * 
	 * @param deviceId 移动设备Id
	 */
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	/**
	 * 移动设备Id的取得 .
	 * 
	 * @return 移动设备Id
	 */
	public String getDeviceId() {
		return deviceId;
	}

	/**
	 * 设备类型(android:1,iphone:0)的设定 .
	 * 
	 * @param deviceType 设备类型(android:1,iphone:0)
	 */
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	/**
	 * 设备类型(android:1,iphone:0)的取得 .
	 * 
	 * @return 设备类型(android:1,iphone:0)
	 */
	public String getDeviceType() {
		return deviceType;
	}

	/**
	 * 设备使用学生类型：0学生,1老师的设定 .
	 * 
	 * @param flag 设备使用学生类型：0学生,1老师
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * 设备使用学生类型：0学生,1老师的取得 .
	 * 
	 * @return 设备使用学生类型：0学生,1老师
	 */
	public String getFlag() {
		return flag;
	}

	/**
	 * 验证码的设定 .
	 * 
	 * @param verifyCode 验证码
	 */
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	/**
	 * 验证码的取得 .
	 * 
	 * @return 验证码
	 */
	public String getVerifyCode() {
		return verifyCode;
	}

	/**
	 * 科目类别(01:语文,02:数学,03:英语)的设定 .
	 * 
	 * @param subjectType 科目类别(01:语文,02:数学,03:英语)
	 */
	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	/**
	 * 科目类别(01:语文,02:数学,03:英语)的取得 .
	 * 
	 * @return 科目类别(01:语文,02:数学,03:英语)
	 */
	public String getSubjectType() {
		return subjectType;
	}

	/**
	 * 所在城市的编号的设定 .
	 * 
	 * @param cityCode 所在城市的编号
	 */
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	/**
	 * 所在城市的编号的取得 .
	 * 
	 * @return 所在城市的编号
	 */
	public String getCityCode() {
		return cityCode;
	}

	/**
	 * 所在省份的编号的设定 .
	 * 
	 * @param provinceCode 所在省份的编号
	 */
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	/**
	 * 所在省份的编号的取得 .
	 * 
	 * @return 所在省份的编号
	 */
	public String getProvinceCode() {
		return provinceCode;
	}

	/**
	 * 作业状态的设定 .
	 * 
	 * @param taskStatus 作业状态
	 */
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	/**
	 * 作业状态的取得 .
	 * 
	 * @return 作业状态
	 */
	public String getTaskStatus() {
		return taskStatus;
	}

	/**
	 * 优秀学生标记(0:普通,1:优秀)的设定 .
	 * 
	 * @param stuLevel 优秀学生标记(0:普通,1:优秀)
	 */
	public void setStuLevel(String stuLevel) {
		this.stuLevel = stuLevel;
	}

	/**
	 * 优秀学生标记(0:普通,1:优秀)的取得 .
	 * 
	 * @return 优秀学生标记(0:普通,1:优秀)
	 */
	public String getStuLevel() {
		return stuLevel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getOnType() {
		return onType;
	}

	public void setOnType(Integer onType) {
		this.onType = onType;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}