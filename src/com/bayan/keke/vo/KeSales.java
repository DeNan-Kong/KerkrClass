package com.bayan.keke.vo;

public class KeSales implements java.io.Serializable {

	/* */
	private static final long serialVersionUID = 5648707640746162049L;
	
	/**
	 * 系列号ID .
	 */
	private Integer id;

	/**
	 * 学生ID .
	 */
	private String userId;
	
	/**
	 * 营销老师ID .
	 */
	private String teacherId;

	/**
	 * 电话号码 .
	 */
	private String phoneNumber;

	/**
	 * 注册密码 .
	 */
	private String password;

	/**
	 * 老师姓名 .
	 */
	private String userName;

	/**
	 * 老师性别：男：01,女：00 .
	 */
	private String sex;
	
	/**
	 * 用户头像URL .
	 */
	private String headUrl;
	
	/**
	 * 教师资格证认证状态 .
	 */
	private String approveStatus;

	/**
	 * 老师在线离线状态 .
	 */
	private String activeStatus;
	
	/**
	 * 年级 .
	 */
	private String grade;

	/**
	 * 科目类别 .
	 */
	private String subjectType;

	/**
	 * 所在城市编号 .
	 */
	private String cityCode;

	/**
	 * 所在省份编号 .
	 */
	private String provinceCode;

	/**
	 * 验证码 .
	 */
	private String verifyCode;
	
	/**
	 * 优惠码类型 .
	 */
	private String codeType;
	
	/**
	 * SID码 .
	 */
	private String SIDCode;

	/**
	 * 使用该SID码的注册学生总数 .
	 */
	private String count;
	
	/**
	 * 使用该SID码的优惠金额 .
	 */
	private String money;

	/**
	 * 所在城市名.
	 */
	private String city;

	/**
	 * 所在省份名 .
	 */
	private String province;
	
	/**
	 * 注册老师类型(0:内部老师,1:外部老师,2:营销老师) .
	 */
	private String type;
	
	/**
	 * 反馈信息的类型(0:学生反馈,1:老师反馈,2:低评分的原因反馈) .
	 */
	private String feedType;
	
	/** default constructor */
	public KeSales() {
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
	 * 营销老师ID的设定 .
	 * 
	 * @param teacherId 营销老师ID
	 */
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	/**
	 * 营销老师ID的取得 .
	 * 
	 * @return 营销老师ID
	 */
	public String getTeacherId() {
		return teacherId;
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
	 * 注册密码的设定 .
	 * 
	 * @param password 注册密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 注册密码的取得 .
	 * 
	 * @return 注册密码
	 */
	public String getPassword() {
		return password;
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
	 * 年级的设定 .
	 * 
	 * @param grade 年级
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * 年级的取得 .
	 * 
	 * @return 年级
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * 科目类别的设定 .
	 * 
	 * @param subjectType 科目类别
	 */
	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	/**
	 * 科目类别的取得 .
	 * 
	 * @return 科目类别
	 */
	public String getSubjectType() {
		return subjectType;
	}

	/**
	 * 所在城市编号的设定 .
	 * 
	 * @param cityCode 所在城市编号
	 */
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	/**
	 * 所在城市编号的取得 .
	 * 
	 * @return 所在城市编号
	 */
	public String getCityCode() {
		return cityCode;
	}

	/**
	 * 所在省份编号的设定 .
	 * 
	 * @param provinceCode 所在省份编号
	 */
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	/**
	 * 所在省份编号的取得 .
	 * 
	 * @return 所在省份编号
	 */
	public String getProvinceCode() {
		return provinceCode;
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
	 * SID码的设定 .
	 * 
	 * @param SIDCode SID码
	 */
	public void setSIDCode(String SIDCode) {
		this.SIDCode = SIDCode;
	}

	/**
	 * SID码的取得 .
	 * 
	 * @return SID码
	 */
	public String getSIDCode() {
		return SIDCode;
	}

	/**
	 * 使用该SID码的注册学生总数的设定 .
	 * 
	 * @param count 使用该SID码的注册学生总数
	 */
	public void setCount(String count) {
		this.count = count;
	}

	/**
	 * 使用该SID码的注册学生总数的取得 .
	 * 
	 * @return 使用该SID码的注册学生总数
	 */
	public String getCount() {
		return count;
	}

	/**
	 * 使用该SID码的优惠金额的设定 .
	 * 
	 * @param count 使用该SID码的优惠金额
	 */
	public String getMoney() {
		return money;
	}

	/**
	 * 使用该SID码的优惠金额的取得 .
	 * 
	 * @return 使用该SID码的优惠金额
	 */
	public void setMoney(String money) {
		this.money = money;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public String getApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

	public String getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}

	public String getFeedType() {
		return feedType;
	}

	public void setFeedType(String feedType) {
		this.feedType = feedType;
	}
	
}
