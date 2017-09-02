package com.bayan.keke.vo;

public class KeTeaUs implements java.io.Serializable {

	/* */
	private static final long serialVersionUID = 5648707640746162049L;
	
	/**
	 * 序列号Id .
	 */
	private Integer id;

	/**
	 * 老师ID .
	 */
	private String teacherId;

	/**
	 * 老师姓名 .
	 */
	private String userName;

	/**
	 * 老师性别：男：01,女：00 .
	 */
	private String sex;

	/**
	 * 电话号码 .
	 */
	private String phoneNumber;

	/**
	 * 登录密码 .
	 */
	private String password;

	/**
	 * 移动设备Id .
	 */
	private String deviceId;

	/**
	 * 设备类型(android:1,iphone:0) .
	 */
	private String deviceType;

	/**
	 * 设备使用用户类型：0学生,1老师 .
	 */
	private String flag;

	/**
	 * 年级（01,02,03,04,05,06） .
	 */
	private String grade;

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
	 * 教师资格证照片地址 .
	 */
	private String certificateUrl;

	/**
	 * 教师资格证认证状态 .
	 */
	private String approveStatus;

	/**
	 * 老师在线离线状态 .
	 */
	private String activeStatus;

	/**
	 * 同时在线人数 .
	 */
	private String total;

	/**
	 * 验证码 .
	 */
	private String verifyCode;

	/**
	 * 用户头像URL .
	 */
	private String headUrl;

	/**
	 * 每份作业得到的星星数 .
	 */
	private String score;

	/**
	 * 本月第一天日期 .
	 */
	private String firstDofM;

	/**
	 * 上月第一天日期 .
	 */
	private String firstDoflastM;

	/**
	 * 上月最后一天日期 .
	 */
	private String lastDoflastM;

	/**
	 * 老师信息修改区分：0:信息修改、1:重新上传资格证 .
	 */
	private String infoFlag;

	/**
	 * 注册老师类型(0:内部老师,1:外部老师) .
	 */
	private String type;
	
	/**
	 * 云信登录状态   .
	 */
	private String accStatus;
	
	// 所属机构
	private String orgId;
	
	/** default constructor */
	public KeTeaUs() {		
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
	 * 老师ID的设定 .
	 * 
	 * @param teacherId 老师ID
	 */
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	/**
	 * 老师ID的取得 .
	 * 
	 * @return 老师ID
	 */
	public String getTeacherId() {
		return teacherId;
	}

	/**
	 * 老师姓名的设定 .
	 * 
	 * @param userName 老师姓名
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 老师姓名的取得 .
	 * 
	 * @return 老师姓名
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 老师性别：男：01,女：00的设定 .
	 * 
	 * @param sex 老师性别：男：01,女：00
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * 老师性别：男：01,女：00的取得 .
	 * 
	 * @return 老师性别：男：01,女：00
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * 电话号码的设定 .
	 * 
	 * @param phoneNumber 电话号码
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * 电话号码的取得 .
	 * 
	 * @return 电话号码
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * 登录密码的设定 .
	 * 
	 * @param password 登录密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 登录密码的取得 .
	 * 
	 * @return 登录密码
	 */
	public String getPassword() {
		return password;
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
	 * 设备使用用户类型：0学生,1老师的设定 .
	 * 
	 * @param flag 设备使用用户类型：0学生,1老师
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * 设备使用用户类型：0学生,1老师的取得 .
	 * 
	 * @return 设备使用用户类型：0学生,1老师
	 */
	public String getFlag() {
		return flag;
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
	 * 教师资格证照片地址的设定 .
	 * 
	 * @param certificateUrl 教师资格证照片地址
	 */
	public void setCertificateUrl(String certificateUrl) {
		this.certificateUrl = certificateUrl;
	}

	/**
	 * 教师资格证照片地址的取得 .
	 * 
	 * @return 教师资格证照片地址
	 */
	public String getCertificateUrl() {
		return certificateUrl;
	}

	/**
	 * 教师资格证认证状态的设定 .
	 * 
	 * @param approveStatus 教师资格证认证状态
	 */
	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

	/**
	 * 教师资格证认证状态的取得 .
	 * 
	 * @return 教师资格证认证状态
	 */
	public String getApproveStatus() {
		return approveStatus;
	}

	/**
	 * 老师在线离线状态的设定 .
	 * 
	 * @param activeStatus 老师在线离线状态
	 */
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}

	/**
	 * 老师在线离线状态的取得 .
	 * 
	 * @return 老师在线离线状态
	 */
	public String getActiveStatus() {
		return activeStatus;
	}

	/**
	 * 同时在线人数的设定 .
	 * 
	 * @param total 同时在线人数
	 */
	public void setTotal(String total) {
		this.total = total;
	}

	/**
	 * 同时在线人数的取得 .
	 * 
	 * @return 同时在线人数
	 */
	public String getTotal() {
		return total;
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
	 * 用户头像URL的设定 .
	 * 
	 * @param headUrl 用户头像URL
	 */
	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	/**
	 * 用户头像URL的取得 .
	 * 
	 * @return 用户头像URL
	 */
	public String getHeadUrl() {
		return headUrl;
	}

	/**
	 * 每份作业得到的星星数的设定 .
	 * 
	 * @param score 每份作业得到的星星数
	 */
	public void setScore(String score) {
		this.score = score;
	}

	/**
	 * 每份作业得到的星星数的取得 .
	 * 
	 * @return 每份作业得到的星星数
	 */
	public String getScore() {
		return score;
	}

	/**
	 * 本月第一天日期的设定 .
	 * 
	 * @param firstDofM 本月第一天日期
	 */
	public void setFirstDofM(String firstDofM) {
		this.firstDofM = firstDofM;
	}

	/**
	 * 本月第一天日期的取得 .
	 * 
	 * @return 本月第一天日期
	 */
	public String getFirstDofM() {
		return firstDofM;
	}

	/**
	 * 上月第一天日期的设定 .
	 * 
	 * @param firstDoflastM 上月第一天日期
	 */
	public void setFirstDoflastM(String firstDoflastM) {
		this.firstDoflastM = firstDoflastM;
	}

	/**
	 * 上月第一天日期的取得 .
	 * 
	 * @return 上月第一天日期
	 */
	public String getFirstDoflastM() {
		return firstDoflastM;
	}

	/**
	 * 上月最后一天日期的设定 .
	 * 
	 * @param lastDoflastM 上月最后一天日期
	 */
	public void setLastDoflastM(String lastDoflastM) {
		this.lastDoflastM = lastDoflastM;
	}

	/**
	 * 上月最后一天日期的取得 .
	 * 
	 * @return 上月最后一天日期
	 */
	public String getLastDoflastM() {
		return lastDoflastM;
	}

	/**
	 * 老师信息修改区分：0:信息修改、1:重新上传资格证的设定 .
	 * 
	 * @param infoFlag 老师信息修改区分：0:信息修改、1:重新上传资格证
	 */
	public void setInfoFlag(String infoFlag) {
		this.infoFlag = infoFlag;
	}

	/**
	 * 老师信息修改区分：0:信息修改、1:重新上传资格证的取得 .
	 * 
	 * @return 老师信息修改区分：0:信息修改、1:重新上传资格证
	 */
	public String getInfoFlag() {
		return infoFlag;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAccStatus() {
		return accStatus;
	}

	public void setAccStatus(String accStatus) {
		this.accStatus = accStatus;
	}
}
