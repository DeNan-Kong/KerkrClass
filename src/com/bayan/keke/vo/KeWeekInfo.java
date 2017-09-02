package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeWeekInfo implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 9168459100504142200L;

	// 日期
	private String date = null;
	// 星期
	private String week = null;
	// 错题数
	private String countError = null;

	/** default constructor */
	public KeWeekInfo() {
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getCountError() {
		return countError;
	}

	public void setCountError(String countError) {
		this.countError = countError;
	}


}