package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeTeaOutputRcd implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -5338867911125318482L;
	//金额
	private String amount = null;
	//0:收入,1:支出
	private String type = null;	
	//申请提现时间或入账时间
	private String createTime = null;
	//补充说明
	private String comment = null;

	/** default constructor */
	public KeTeaOutputRcd() {
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	
	
}