package com.bayan.keke.vo;

import net.sf.json.JSONObject;

import java.sql.Date;

/**
 * @author xsx
 */
public class KeVideos implements java.io.Serializable {

    private static final long serialVersionUID = -6982455748191211774L;
    /**
     * 表序列ID
     */
    private Integer id;
    /**
     * 上传者ID
     */
    private String orgId;
    /**
     * 缩略图
     */
    private String topicImg;
    /**
     * 时长
     */
    private Integer length;
    /**
     * 视频七牛key
     */
    private String videoUrl;
    /**
     * 上传事件
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

    private String title;

    private String description;
    /**
     * 1,显示 2，不显示
     */
    private Integer status;
    /**
     * 登入用户id
     */
    private String userId;
    /**
     * 分页参数
     */
    private Integer start;

    private Integer size;
    /**
     * 视频文件hash
     */
    private String hash;
    /**
     * 年级
     */
    private String grade;
    //观看权限
    private String watchAuthor;
    //前端checkbox值
    private String checkboxValue;
    //观看标签
    private String[] tagIds;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getTopicImg() {
        return topicImg;
    }

    public void setTopicImg(String topicImg) {
        this.topicImg = topicImg;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public KeVideos() {

    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getWatchAuthor() {
        return watchAuthor;
    }

    public void setWatchAuthor(String watchAuthor) {
        this.watchAuthor = watchAuthor;
    }

    public String getCheckboxValue() {
        return checkboxValue;
    }

    public void setCheckboxValue(String checkboxValue) {
        this.checkboxValue = checkboxValue;
    }

    public String[] getTagIds() {
        return tagIds;
    }

    public void setTagIds(String[] tagIds) {
        this.tagIds = tagIds;
    }
}
