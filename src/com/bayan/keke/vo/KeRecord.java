package com.bayan.keke.vo;

import java.util.List;

public class KeRecord {
	// 用户ID
	private String month;
	
	// 被举报老师ID
	private List<KeTeaOutputRcd> record;
	
	/** default constructor */
	public KeRecord() {
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public List<KeTeaOutputRcd> getRecord() {
		return record;
	}

	public void setRecord(List<KeTeaOutputRcd> record) {
		this.record = record;
	}
	
}
