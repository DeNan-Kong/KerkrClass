package com.bayan.keke.vo;

/**
 * 
 * @author zx
 *
 */
public class KeMark implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = -7437033410429346879L;

	//x坐标
	private String pointx = null;
	//y坐标
	private String pointy = null;
	//标签方向 -1向左，+1向右
	private String direction = null;
	//若正确则为right,错误则为错误原因
	private String content = null;
	//对或错:0错误、1正确
	private String result = null;
	
	/** default constructor */
	public KeMark() {
	}

	public String getPointx() {
		return pointx;
	}

	public void setPointx(String pointx) {
		this.pointx = pointx;
	}

	public String getPointy() {
		return pointy;
	}

	public void setPointy(String pointy) {
		this.pointy = pointy;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
}