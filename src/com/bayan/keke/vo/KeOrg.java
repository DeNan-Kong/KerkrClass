package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeOrg implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1557071841178871725L;
	
	// ID
	private String id;
	
	//机构ID
	private String orgId;
	
	// 机构名
	private String orgName;
	
	// 机构地址
	private String orgAddress;
	
	//机构电话号码
	private String orgPhoneNumber;
	
	//用户电话号码
	private String phoneNumber;
	
	//用户登录密码
	private String password;
	
	//用户年级
	private String grade;
	
	// 用户姓名
	private String userName;
	
	//用户ID
	private String userId;

	// 老师ID
	private String teacherId;
	// 老师手机号
	private String teaPhone;
	
	// 老师名
	private String teaName;
	
	// 老师年级
	private String teaGrade;
	
	// 老师科目
	private String teaSubject;
	
	// 类型
	private String type;
	
	// 变换前年级
	private String gradeone;
	
	// 变换后年级
	private String gradetwo;

	//学生在校类型
	private Integer onType;

	/** default constructor */
	public KeOrg() {
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrgPhoneNumber() {
		return orgPhoneNumber;
	}

	public void setOrgPhoneNumber(String orgPhoneNumber) {
		this.orgPhoneNumber = orgPhoneNumber;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgAddress() {
		return orgAddress;
	}

	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}

	public String getTeaPhone() {
		return teaPhone;
	}

	public void setTeaPhone(String teaPhone) {
		this.teaPhone = teaPhone;
	}

	public String getTeaName() {
		return teaName;
	}

	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}

	public String getTeaGrade() {
		return teaGrade;
	}

	public void setTeaGrade(String teaGrade) {
		this.teaGrade = teaGrade;
	}

	public String getTeaSubject() {
		return teaSubject;
	}

	public void setTeaSubject(String teaSubject) {
		this.teaSubject = teaSubject;
	}

	public String getGradeone() {
		return gradeone;
	}

	public void setGradeone(String gradeone) {
		this.gradeone = gradeone;
	}

	public String getGradetwo() {
		return gradetwo;
	}

	public void setGradetwo(String gradetwo) {
		this.gradetwo = gradetwo;
	}

	public Integer getOnType() {
		return onType;
	}

	public void setOnType(Integer onType) {
		this.onType = onType;
	}
}