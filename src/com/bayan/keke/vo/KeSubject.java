package com.bayan.keke.vo;

import java.util.List;

/**
 * 
 * @author zx
 *
 */
public class KeSubject implements java.io.Serializable {

	/**
	 * 用户序列号
	 */
	private static final long serialVersionUID = 1L;

	// 序列号Id(保留字段)
	private String id;
	// 用户唯一编号
	private String userId;
	// 科目类别 语文:01 数学:02 英语:03
	private String subjectType;
	// 作业状态
	private String taskStatus;
	// 七牛存储key
	private String qiniuKey;
	// 模糊图片七牛存储key
	private String oldQiniuKey;
	// 模糊图片ID
	private String oldPhotoId;
	// 第三方认证token
	private String uploadToken;
	// 上传一份作业的组ID
	private String groupId;
	// 上传的每张作业的ID
	private String photoId;
	// 给的评价星星数
	private String result;
	// 周报疑难查询时间（年月日）
	private String createTime;
	// 查询历史疑难最开始加载的
	private String startIndex;
	// 查询历史疑难最后加载的
	private String endIndex;
	
	// 周报检索开始index
	private int selectIndex;
	//周报每次检索件数
	private int selectCount;
	
	// 本周一
	private String firstDayOfWeek;
	// 本周日
	private String lastDayOfWeek;
	
	// 学分
	private Integer pointAll;
	
	// 老师ID
	private String teacherId;
	
	// 上传图片个数
	private String photoCount;
	
	// 上传图片顺序
	private String photoSort;
	
	// 用户不满意的原因
	private String reason;
	
	// 用户不满意作业图片Id序列
	private String photoIdList;

	// 老师ID
	private String shareId;
	
	// 上传图片的原始宽度
	private String width;
	
	// 上传图片的原始高度
	private String height;
	//金额
	private String amount = null;
	//老师类型
	private String type=null;
	
	// 晚托班级ID
	private String wantuoId;

	//
	private int flg;

	/** default constructor */
	public KeSubject() {
	}

	public int getFlg() {
		return flg;
	}

	public void setFlg(int flg) {
		this.flg = flg;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public String getSubjectType() {
		return subjectType;
	}

	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	public String getQiniuKey() {
		return qiniuKey;
	}

	public void setQiniuKey(String qiniuKey) {
		this.qiniuKey = qiniuKey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUploadToken() {
		return uploadToken;
	}

	public void setUploadToken(String uploadToken) {
		this.uploadToken = uploadToken;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getFirstDayOfWeek() {
		return firstDayOfWeek;
	}

	public void setFirstDayOfWeek(String firstDayOfWeek) {
		this.firstDayOfWeek = firstDayOfWeek;
	}

	public String getLastDayOfWeek() {
		return lastDayOfWeek;
	}

	public void setLastDayOfWeek(String lastDayOfWeek) {
		this.lastDayOfWeek = lastDayOfWeek;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(String endIndex) {
		this.endIndex = endIndex;
	}

	public int getSelectIndex() {
		return selectIndex;
	}

	public void setSelectIndex(int selectIndex) {
		this.selectIndex = selectIndex;
	}

	public int getSelectCount() {
		return selectCount;
	}

	public void setSelectCount(int selectCount) {
		this.selectCount = selectCount;
	}

	public Integer getPointAll() {
		return pointAll;
	}

	public void setPointAll(Integer pointAll) {
		this.pointAll = pointAll;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getPhotoCount() {
		return photoCount;
	}

	public void setPhotoCount(String photoCount) {
		this.photoCount = photoCount;
	}

	public String getPhotoSort() {
		return photoSort;
	}

	public void setPhotoSort(String photoSort) {
		this.photoSort = photoSort;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getOldQiniuKey() {
		return oldQiniuKey;
	}

	public void setOldQiniuKey(String oldQiniuKey) {
		this.oldQiniuKey = oldQiniuKey;
	}

	public String getOldPhotoId() {
		return oldPhotoId;
	}

	public void setOldPhotoId(String oldPhotoId) {
		this.oldPhotoId = oldPhotoId;
	}

	public String getPhotoIdList() {
		return photoIdList;
	}

	public void setPhotoIdList(String photoIdList) {
		this.photoIdList = photoIdList;
	}

	public String getShareId() {
		return shareId;
	}

	public void setShareId(String shareId) {
		this.shareId = shareId;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWantuoId() {
		return wantuoId;
	}

	public void setWantuoId(String wantuoId) {
		this.wantuoId = wantuoId;
	}
	
	
}