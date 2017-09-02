package com.bayan.keke.vo;

/**
 * @author xsx
 */
public class KeHtml implements java.io.Serializable {

    /**
     * 用户序列号
     */
    private static final long serialVersionUID = 1L;


    // 分享ID
    private String shareId;


    /** default constructor */
    public KeHtml() {
    }


    public String getShareId() {
        return shareId;
    }


    public void setShareId(String shareId) {
        this.shareId = shareId;
    }


}
