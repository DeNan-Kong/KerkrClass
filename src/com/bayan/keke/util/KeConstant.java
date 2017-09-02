package com.bayan.keke.util;

public class KeConstant {

	// 等号
	public static final String DENGHAO = "=";
	// 逗号
	public static final String DOUHAO = ",";
	// 空格
	public static final String BLANK = "";
	// 0
	public static final String ZERO = "0";
    /*模糊图片回传，图片末尾id*/
    public static final String PHOTO_END = "9";
    /*举报图片回传，图片末尾id*/
    public static final String PHOTO_REP_END = "8";
	
    /* 作业状态:未批改(默认)*/
    public static final String UNCORRECTED = "UNCORRECTED";
    /* 作业状态:批改中*/
    public static final String CORRECTING = "CORRECTING";
    /* 作业状态:批改完成*/
    public static final String FINISH = "FINISH";
    /* 作业状态:已完成*/
    public static final String CORRECTED = "CORRECTED";
    /* 作业状态:无效或模糊*/
    public static final String INVALID = "INVALID";
    
    /*批改结果：对*/
    public static final String RIGHT = "1";
    /*批改结果：错误*/
    public static final String ERROR = "0";
    
	/*成功*/
	public static final String SUCCESS = "0";
	/*失败*/
	public static final String FALSE = "-1";
    
    /*0:已解决，*/
    public static final String RESOLVEDFLAG_OK = "0";
    /*1:未解决*/
    public static final String RESOLVEDFLAG_NG = "1";
    
    /* 分隔符*/
    public static final String DELIMITER = "/";
    
    /* 支付宝分隔符*/
    public static final String ALIPAY_DELIMITER = "^";
    public static final String ALIPAY_DELIMITER_TWO = "\\^";
    public static final String VERTICAL_LINE = "|";
    public static final String ALIPAY_VERTICAL_LINE = "\\|";
    
    /*操作成功：1000*/
    public static final String KE_SUCCESS = "1000";
    /*操作失败：1001*/
    public static final String KE_FALSE = "1001";    
	/*不存在记录：1002*/
	public static final String KE_NOTEXIST = "1002";	
	/*存在记录：1003*/
	public static final String KE_EXIST = "1003";    
	/*输入参数为空*/
	public static final String KE_ISNULL = "1005";	
	/*服务器错误：2001*/
	public static final String KE_SERVER_ERR = "2001";
    /*没有对应的日报：1003*/
    public static final String NO_DAILY = "1003";
    /*有未批改完成的作业：1002*/
    public static final String KE_UNCORRECTED = "1002";
	/*错误原因*/
	public String KE_ERR_MSG = "";
	
    /*第一张图片顺序*/
    public static final String PHOTO_SORT_FIRST = "01";
    
    /*一天开始*/
    public static final String TIME_DAY_START = " 00:00:00";
    
    /*一天结束*/
    public static final String TIME_DAY_END = " 23:59:59";
    
    /*批改收入*/
    public static final String MONEY_ONE = "1";
    
    /*批改收入0.5*/
    public static final String MONEY_DOT_FIVE = "0.5";
    
    /*收支种类：收入*/
    public static final String TYPE_IN = "0";
    
    /*收支种类：支出*/
    public static final String TYPE_OUT = "1";
    
    /*申请结果：申请中*/
    public static final String APPLICATION_STATUS_ZERO = "0";
    
    /*申请结果：处理完成*/
    public static final String APPLICATION_STATUS_ONE = "1";
    
    /*批改作业消耗油量1L*/
    public static final String ONE_OIL = "1";
    
    /* 判断字符串是否是URL(http://plinks.me/t9fxdk) */
  	public static final String regex = "(((https|http)?://)?([a-z0-9]+[.])|(www.))"
  			+ "\\w+[.|\\/]([a-z0-9]{0,})?[[.]([a-z0-9]{0,})]+((/[\\S&&[^,;\u4E00-\u9FA5]]+)+)?([.][a-z0-9]{0,}+|/?)";

  	/* 动态评分最低分*/
  	public static final String BASEPOINT = "0.0";
  	
  	/* 动态评分最高分*/
  	public static final String HIGHPOINT = "5.0";
  	
  	/* 动态评分合格分*/
  	public static final double PASSPOINT = 4.8;
  	
  	/* 老师培训天数*/
  	public static final int DAYS = -4;
  	
  	/* 正式老师每天批改的上限作业数*/
  	public static final int SANBYAKU = 2000;
  	
  	/* 经纬度半径范围*/
  	public static final int GOSEN = 5000;
  	
  	/* 3天内批改作业量达到30份*/
  	public static final int SANJU = 30;
  	
  	/* 批改收入*/
  	public static final String PGZY = "批改收入";
  	
  	/* 答疑收入*/
  	public static final String DY = "答疑收入";
  	
  	/* 作业城市推广结算单价*/
  	public static final Double DANJIA = 0.01;
}
