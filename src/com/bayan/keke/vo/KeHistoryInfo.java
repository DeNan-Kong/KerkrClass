package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeHistoryInfo implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -8987320584536721506L;

	// 日期
	private String date = null;
	
	// 错题数
	private String countError = null;

	/** default constructor */
	public KeHistoryInfo() {
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCountError() {
		return countError;
	}

	public void setCountError(String countError) {
		this.countError = countError;
	}


}