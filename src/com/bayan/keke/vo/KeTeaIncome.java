package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeTeaIncome implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -1463249429935999911L;

	// 教师id
	private String teacherId = null;
	
	// 老师总收入
	private String totalIncome = null;
	
	// 未提现金额
	private String inputIncome = null;
	
	// 已提现金额
	private String outputIncome = null;

	// 创建时间
	private String createTime = null;
	
	// 更新时间
	private String updateTime = null;
	
	/** default constructor */
	public KeTeaIncome() {
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(String totalIncome) {
		this.totalIncome = totalIncome;
	}

	public String getInputIncome() {
		return inputIncome;
	}

	public void setInputIncome(String inputIncome) {
		this.inputIncome = inputIncome;
	}

	public String getOutputIncome() {
		return outputIncome;
	}

	public void setOutputIncome(String outputIncome) {
		this.outputIncome = outputIncome;
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

	
}