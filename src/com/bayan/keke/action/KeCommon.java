package com.bayan.keke.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.bayan.keke.service.PayService;
import com.bayan.keke.service.SubjectService;
import com.bayan.keke.service.TeaUsService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KeSubject;
import com.bayan.keke.vo.KeTeaIncomeRcd;
import com.bayan.keke.vo.KeTeaUs;
import com.qiniu.util.Auth;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;
import net.sf.json.JSONObject;

public class KeCommon {

	//输出日志
	private static final Logger logger = Logger.getLogger(UserAction.class);
		
    /* 分隔符*/
    public static final String DELIMITER = "/";
    
    /** ==========课课小教室测试环境====start===========*/
    //极光推送测试环境
    private static final boolean APNS_PRODUCTION = false;
    /* 七牛作业域名*/
    private static final String QINIU_URL = "http://testqiniu.kerkr.com";
    // 七牛作业空间
    public static final String QINIU_BUCKET = "testkerkr";
	// 七牛视频空间
    public static final String QINIU_VIDEO_BUCKET = "test-class-video";
    /* 七牛域名:头像*/
    private static final String QINIU_HEAD = "http://testqiniu.kerkr.com";
    // 七牛空间:头像
    public static final String QINIU_BUCKET_HEADURL = "testkerkr";
    /** ==========课课小教室测试环境====end=============*/
    
    /** ==========课课小教室发布环境====start===========*/
//    //极光推送发布环境
//    private static final boolean APNS_PRODUCTION = true;
//    /* 七牛作业域名*/
//    private static final String QINIU_URL = "http://workclass.kerkr.com";
//    // 七牛空间
//    public static final String QINIU_BUCKET = "workclass";
//    /* 七牛域名:头像*/
//    private static final String QINIU_HEAD = "http://headclass.kerkr.com";
//    // 七牛空间:头像
//    public static final String QINIU_BUCKET_HEADURL = "headclass";
    /** ==========课课小教室发布环境====end=============*/
    
    //==================================================================================//


    /** ==========测试环境====start===========*/
//    /* 七牛域名*/
//    private static final String QINIU_URL = "http://testqiniu.kerkr.com";
//    // 七牛空间
//    public static final String QINIU_BUCKET = "testkerkr";
    // 批改作业支付宝回调URL
    public static final String ALIPAY_NOTIFY_URL = "http://test.kerkr.com.cn:9000/kerkr/alipayNotifyManage.jspx";
    // 推广老师支付宝回调URL
    public static final String ALIPAY_NOTIFY_TG_URL = "http://test.kerkr.com.cn:9000/kerkr/alipayNotifyTgManage.jspx";
	// 学生充值支付宝回调URL
	public static final String ALIPAY_DIRECT_NOTIFY_URL = "http://test.kerkr.com.cn:9000/kerkr/alipayDirectPay.jspx";
	// 学生充值微信支付回调URL
	public static final String WX_NOTIFY_URL = "http://test.kerkr.com.cn:9000/kerkr/onRespPay.jspx";
//    //极光推送测试环境
//    private static final boolean APNS_PRODUCTION = false;
    /** ==========测试环境====start===========*/
    
//    /** ==========发布环境====start===========*/
//    // 七牛域名:作业
//    private static final String QINIU_URL = "http://qiniu.kerkr.com";
//    // 七牛空间:作业
//    public static final String QINIU_BUCKET = "kerkr";
////    // 批改作业支付宝回调URL
//	public static final String ALIPAY_NOTIFY_URL = "http://ios.kerkr.com/kerkr/alipayNotifyManage.jspx";
//	// 推广老师支付宝回调URL
//	public static final String ALIPAY_NOTIFY_TG_URL = "http://ios.kerkr.com/kerkr/alipayNotifyTgManage.jspx";
//	// 学生充值支付宝回调URL
//	public static final String ALIPAY_DIRECT_NOTIFY_URL = "http://ios.kerkr.com/kerkr/alipayDirectPay.jspx";
//	// 学生充值微信支付回调URL
//	public static final String WX_NOTIFY_URL = "http://ios.kerkr.com/kerkr/onRespPay.jspx";
//    //极光推送发布环境
//    private static final boolean APNS_PRODUCTION = true;
//    /** ==========发布环境====end===========*/
    
//    // 云信白板 正式版
//    private static final String APP_KEY = "d7e8297e43ab64f5c8966318288b33be";// 开发者平台appKey
//    private static final String APP_SECRET = "4b058e50a8d4";
    
	//=======================云信测试账号=======================
//    // 云信白板 临时申请的账号 测试用 TODO
//    public static final String APP_KEY = "4d6f074688b2a619e605f3ac312798da";// 开发者平台appKey
//    private static final String APP_SECRET = "36881e196e4a";
    
//    // 云信白板 临时申请的账号 测试2 TODO
//    public static final String APP_KEY = "703dd35cf636df4b4fe5c8fc6f56a8c6";// 开发者平台appKey
//    private static final String APP_SECRET = "04d0a9bf35aa";
    
    // 云信白板账号 购买TODO
    public static final String APP_KEY = "ee812da4138f621b9ff3e15c981f1b36";// 开发者平台appKey
    private static final String APP_SECRET = "851a8a72c96d";
    //=======================云信测试账号=======================
    
    /* 七牛域名:教师资格证*/
    private static final String QINIU_CERTIFICATE = "http://certificate.kerkr.com";
    // 七牛空间: 教师资格证书
    public static final String QINIU_BUCKET_CERTIFICATE = "certificate";
    
    // 七牛Access Key 和 Secret Key
    public static final String ACCESS_KEY = "Qt8wTRR_kJdyK8q1z0DrYB8iufe9bgiFBeUHhMxR";
    public static final String SECRET_KEY = "UCEXStPrT64REKYaKwU51B8Rp865YMh8W7spa0ME";

    // 家长端极光推送 小教室
	private static final String APPKEY ="b8a3d21ab078c5b755f7e59d";
	private static final String MASTERSECRET = "f179b0626eacf33187e6ffe0";
	
	// 老师端极光推送  小教室
	private static final String APPKEYTEA ="5e5ed4fcec78171caa413770";
	private static final String MASTERSECRETTEA = "d07283e3ee933fcc3e84ef68";
	
	//付款账号
	public static final String EMAIL = "pizuoye@qq.com";

	//付款账户名
	public static final String ACCOUNT_NAME = "上海课课网络科技有限公司";
	
	//SID优惠金额
	public static final String SID_MONEY = "30";
	
	//SID使用次数
	public static final String SID_COUNT = "500";
	
    /**
     * 获取学分
     * @param countRight
     * @param countError
     * @return
     */
    public static Integer getPoint(int countRight,int total){
    	
    	int countError = total - countRight;
    	
    	if(countError == 0){
    		return 3;
    	}else if(countError <= 3){
    		return 2;
    	}else if(countError <= 6){
    		return 1;
    	}else {
    		return 0;
    	}
    }
    
    /**
     * 获取图片url签名
     * @param photoKey 七牛key
     * @return
     */
    public static String getUrlSign(String photoKey) {
    	
    	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        //默认有效时长：3600秒
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(QINIU_URL);
        urlBuilder.append(DELIMITER);
        urlBuilder.append(photoKey);
        String urlSigned = auth.privateDownloadUrl(urlBuilder.toString());
        return urlSigned;
    }
    
    /**
     * IOS推送消息设置
     */
    public static PushPayload buildPushObject_ios_tagAnd_alertWithExtrasAndMessage(
    		List<String> tag, String alert, String msgContent) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.ios())
                .setAudience(Audience.tag(tag))
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder()
                                .setAlert(alert)
                                .setBadge(5)
                                .setSound("happy.caf")
                                .addExtra("from", "JPush")
                                .build())
                        .build())
                 .setMessage(Message.content(msgContent))
                 .setOptions(Options.newBuilder()
                         .setApnsProduction(true)
                         .build())
                 .build();
    }

    /**
     * 推送消息到家长端
     * @param alias 别名
     * @param alert
     * @param msgContent
     * @param setApnsProduction:true发布环境、false测试环境
     * @return
     * @throws APIConnectionException
     * @throws APIRequestException
     */
	public static boolean pushMsgToStu(List<String> alias, String alert, String msgContent) throws APIConnectionException, APIRequestException {

		// 极光推送自定义参数变量
		Map<String, String> extras = new HashMap<String, String>();
		JPushClient jpushClient = new JPushClient(MASTERSECRET, APPKEY);
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.android_ios())
                .setAudience(Audience.alias(alias))
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder()
                                .setAlert(alert)
                                .setBadge(1)
                                .setSound("happy.caf")
                                .addExtra("from", "JPush")
                                .build())
                        .addPlatformNotification(AndroidNotification.newBuilder()
                        		.setAlert(alert)
                        		.setTitle(msgContent)
                                .build()) 
                        .build())
                .setMessage(Message.content(msgContent))
                .setOptions(Options.newBuilder()
                        .setApnsProduction(APNS_PRODUCTION)
                        .build())
                .build();
        logger.debug("ios===:" + Platform.ios());
        logger.debug("alias===:" + alias);
        logger.debug("alert===:" + alert);
        logger.debug("extras===:" + extras);
        logger.debug("Notification===:" + Notification.ios(alert, extras));
        logger.debug("Message===:" + msgContent);
		PushResult pushResult = jpushClient.sendPush(payload);
		return pushResult.isResultOK();
	}
	
	/**
     * 推送消息到老师端
     * @param alias 别名
     * @param alert
     * @param msgContent
     * @param setApnsProduction:true发布环境、false测试环境
     * @return
     * @throws APIConnectionException
     * @throws APIRequestException
     */
	public static boolean pushMsgToTea(List<String> alias, String alert, String msgContent) throws APIConnectionException, APIRequestException {

		return pushMsgToTea(alias, alert, msgContent, "happy.caf");
//		// 极光推送自定义参数变量
//		Map<String, String> extras = new HashMap<String, String>();
//		JPushClient jpushClient = new JPushClient(MASTERSECRETTEA, APPKEYTEA);
//        PushPayload payload = PushPayload.newBuilder()
//                .setPlatform(Platform.android_ios())
//                .setAudience(Audience.alias(alias))
//                .setNotification(Notification.newBuilder()
//                        .addPlatformNotification(IosNotification.newBuilder()
//                                .setAlert(alert)
//                                .setBadge(1)
//                                .setSound("happy.caf")
//                                .addExtra("from", "JPush")
//                                .build())
//                        .addPlatformNotification(AndroidNotification.newBuilder()
//                        		.setAlert(alert)
//                        		.setTitle(msgContent)
//                                .build()) 
//                        .build())
//                .setMessage(Message.content(msgContent))
//                .setOptions(Options.newBuilder()
//                        .setApnsProduction(APNS_PRODUCTION)
//                        .build())
//                .build();
//        logger.debug("ios===:" + Platform.ios());
//        logger.debug("alias===:" + alias);
//        logger.debug("alert===:" + alert);
//        logger.debug("extras===:" + extras);
//        logger.debug("Notification===:" + Notification.ios(alert, extras));
//        logger.debug("Message===:" + msgContent);
//		PushResult pushResult = jpushClient.sendPush(payload);
//		return pushResult.isResultOK();
	}
	
	/**
	 * 推送消息到老师端 : 云信呼叫专用铃声
	 * @param alias 别名
	 * @param alert
	 * @param msgContent
	 * @param setApnsProduction:true发布环境、false测试环境
	 * @return
	 * @throws APIConnectionException
	 * @throws APIRequestException
	 */
	public static boolean pushMsgToTea(List<String> alias, String alert, String msgContent, String sound) throws APIConnectionException, APIRequestException {
		
		// 极光推送自定义参数变量
		Map<String, String> extras = new HashMap<String, String>();
		JPushClient jpushClient = new JPushClient(MASTERSECRETTEA, APPKEYTEA);
		PushPayload payload = PushPayload.newBuilder()
				.setPlatform(Platform.android_ios())
				.setAudience(Audience.alias(alias))
				.setNotification(Notification.newBuilder()
						.addPlatformNotification(IosNotification.newBuilder()
								.setAlert(alert)
								.setBadge(1)
								.setSound(sound)
								.addExtra("from", "JPush")
								.build())
						.addPlatformNotification(AndroidNotification.newBuilder()
								.setAlert(alert)
								.setTitle(msgContent)
								.build()) 
						.build())
				.setMessage(Message.content(msgContent))
				.setOptions(Options.newBuilder()
						.setApnsProduction(APNS_PRODUCTION)
						.build())
				.build();
		logger.debug("ios===:" + Platform.ios());
		logger.debug("alias===:" + alias);
		logger.debug("alert===:" + alert);
		logger.debug("extras===:" + extras);
		logger.debug("Notification===:" + Notification.ios(alert, extras));
		logger.debug("Message===:" + msgContent);
		PushResult pushResult = jpushClient.sendPush(payload);
		return pushResult.isResultOK();
	}
	
	/**
     * 获取头像图片url签名
     * @param photoKey 七牛key
     * @return
     */
    public static String getHeadUrlSign(String photoKey) {
    	
    	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        //默认有效时长：3600秒
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(QINIU_HEAD);
        urlBuilder.append(DELIMITER);
        urlBuilder.append(photoKey);
        String urlSigned = auth.privateDownloadUrl(urlBuilder.toString());
        return urlSigned;
    }
    
    /**
     * 获取教师资格证图片url签名
     * @param photoKey 七牛key
     * @return
     */
    public static String getCertificateUrlSign(String photoKey) {
    	
    	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        //默认有效时长：3600秒
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append(QINIU_CERTIFICATE);
        urlBuilder.append(DELIMITER);
        urlBuilder.append(photoKey);
        String urlSigned = auth.privateDownloadUrl(urlBuilder.toString());
        return urlSigned;
    }
    
	
	/**
	 * 生成6位Sid
	 * @return
	 */
	public static String createSid(){
		return String.valueOf(createRandom(6));
	}
	
	/**
	 * 生成固定位数的随机数字
	 * @return
	 */
	public static int createRandom(int num){
		
		int[] array = {0,1,2,3,4,5,6,7,8,9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
		    int index = rand.nextInt(i);
		    int tmp = array[index];
		    array[index] = array[i - 1];
		    array[i - 1] = tmp;
		}
		int result = 0;
		for(int i = 0; i < num; i++){
			result = result * 10 + array[i];
		}
		return result;
	}
	
	/**
	 * 获取访问者IP
	 * 
	 * 在一般情况下使用Request.getRemoteAddr()即可，但是经过nginx等反向代理软件后，这个方法会失效。
	 * 
	 * 本方法先从Header中获取X-Real-IP，如果不存在再从X-Forwarded-For获得第一个IP(用,分割)，
	 * 如果还不存在则调用Request .getRemoteAddr()。
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Real-IP");
		if (!CheckUtil.isNullOrEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			
			logger.debug("==>X-Real-IP");
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (!CheckUtil.isNullOrEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {

			logger.debug("==>X-Forwarded-For 代理IP");
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		} else {
			logger.debug("==>remoteAddrIP");
			return request.getRemoteAddr();
		}
	}
	
	/**
	 * 给老师加一块钱，添加收益记录
	 * 
	 * @throws Exception
	 */
	public static void addTeaIncome(SubjectService subjectService, String teacherId) throws Exception {
		
    	// 给老师加1块钱
		KeSubject keSubject = new KeSubject();
		keSubject.setTeacherId(teacherId);
		subjectService.addConfirmMoney(keSubject);

		// 添加收入记录
		KeTeaIncomeRcd teaIncomeRcd = new KeTeaIncomeRcd();
		teaIncomeRcd.setTeacherId(teacherId);
		teaIncomeRcd.setAmount(KeConstant.MONEY_ONE);
		teaIncomeRcd.setType(KeConstant.TYPE_IN);
		subjectService.insTeaIncomeRcd(teaIncomeRcd);
	}
	
    /**
     * 自动加油功能
     * @param userid
     * @param inputOil
     * @param comment
     * @throws Exception
     */
	public static boolean autoAddOil(PayService payService, String userid, 
			String inputOil, String comment) throws Exception {
		
		KePay kePay = new KePay();
		kePay.setUserId(userid);
		kePay.setInputOil(inputOil);
		kePay.setComment(comment);
		
		//检查用户是否有充值过
		Map<String, Object> user = payService.selectOil(kePay);
		Integer addOilRst = 0;
		if (user == null) {
			//首次充值，加入一条数据
			kePay.setRemainOil(inputOil);
			addOilRst = payService.add(kePay);
		}else {
			
			//查看当前剩余油量(充值前)
			String befCntOil = payService.remainCntOil(kePay);
			int count =  Integer.parseInt(befCntOil)+Integer.parseInt(inputOil);
			kePay.setRemainOil(String.valueOf(count));
			
			//添加新的油量
			addOilRst = payService.updateOil(kePay);
		}
		
		//添加新的油量
		if (addOilRst > 0) {
			
			//插入充值记录
			//04：后台手动加油
			kePay.setPayType("04");
			kePay.setPayMoney("0");
			Integer oilRec = payService.addRecord(kePay);
			if (oilRec > 0) {
				return true;
			}else{
				
				logger.error("加油记录添加失败");
				return false;
			}
		}else {
			logger.error("加油失败");
			return false;
		}
	}
	
	/**
	 * 暑期活动是否有效
	 * @return true显示
	 */
	public static boolean isSummerActivity(){
		// 活动开始时间2016-07-01 ~~ 2016-09-01
		String systemTime = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
		if(systemTime.compareTo("2016-07-01") >= 0 && systemTime.compareTo("2016-09-01") <= 0){
			return true;
		}
		
		return false;
	}
	
	/**
	 * 取得上传头像上传的key和token
	 * @return true显示
	 */
	public static String getHeadUpKey(String phoneNumber){
		//七牛授权
		String token = "";
		//存教师证KEY
		String key = "";
		//将证书照片上传七牛云
		Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
		token = auth.uploadToken(QINIU_BUCKET_HEADURL);
		key = createKey(phoneNumber);
		
		StringBuilder upKey = new StringBuilder();
		upKey.append(token);
		upKey.append(KeConstant.DOUHAO);
		upKey.append(key);
		return upKey.toString();
	}
	
	/**
     * 创建七牛存储key
     * @param userId 用户ID
     * @return 七牛存储key-->保存在数据库的对应url字段里
     */
	public static String createKey(String userId){
    	String str = DateUtil.getOrderId();
        StringBuilder key = new StringBuilder();
        key.append(userId);
        key.append(KeConstant.DELIMITER);
        key.append(str);
        return key.toString();
    }
	

	/**
	 * 加油
	 * @param uid
	 * @param oil
	 * @param payService
	 * @throws Exception
	 */
	public static void addOil(String uid, String oil, PayService payService) throws Exception{
		
		// 加油量
		Map<String,String> param = new HashMap<String,String>();
		param.put("userId", uid);
		param.put("changeOil", oil);
		param.put("addFlg", "1");
		payService.changeOil(param);
	}
	
	/**
	 * 减油
	 * @param uid
	 * @param oil
	 * @param payService
	 * @throws Exception
	 */
	public static void minusOil(String uid, String oil, PayService payService) throws Exception{
		
		// 减油量
		Map<String,String> param = new HashMap<String,String>();
		param.put("userId", uid);
		param.put("changeOil", oil);
		param.put("addFlg", "0");
		payService.changeOil(param);
	}
	
	/**
	 * 生成云信ID
	 * @param accid
	 */
    public static String createAccid(String accid){
    	
    	// 云信基本参数
        String url = "https://api.netease.im/nimserver/user/create.action";
        String nonce =  String.valueOf(KeCommon.createRandom(6));// 随机数
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, nonce ,curTime);//计算CheckSum
        
        // 设置请求的header
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", nonce);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        
        // 生成一个云信ID
        nvps.add(new BasicNameValuePair("accid", accid));
        
        CloseableHttpResponse response = null;
        try {
			
			// 执行请求
        	httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
			response = httpClient.execute(httpPost);
			
			// 云信返回值
			HttpEntity entity = response.getEntity();
			String accInfo = EntityUtils.toString(entity, "utf-8");
			
			// 关闭HttpEntity流
			EntityUtils.consume(entity);
			
			printDebugLog("云信返回值"+accInfo, logger);
			printDebugLog("云信状态Line"+response.getStatusLine(), logger);
			
			// 判断云信code
			if(CheckUtil.isNullOrEmpty(accInfo)){
				return "";
			}
			
			JSONObject json=JSONObject.fromObject(accInfo);
			
			//注册失败
			if(!"200".equals(json.getString("code"))){
				printErrorLog("云信注册失败"+json.getString("code"), logger);
				return "";
			}
			
			String token = json.getJSONObject("info").getString("token");
			return token;
		} catch (UnsupportedEncodingException e) {
			printSysErrServer(e, logger);
		} catch (IOException e) {
			printSysErrServer(e, logger);
		}finally {
	    	try {
	    		if(response != null){
	    			response.close();
	    		}
			} catch (IOException e) {
				printSysErrServer(e, logger);
			}
	    }
        //
        return null;
    }
    
	/**
	 * 打印debug日志
	 */
	private static void printDebugLog(String comment, Logger logger) {
		
		logger.debug(comment);
	}
	
	/**
	 * 打印debug日志
	 */
	private static void printErrorLog(String comment, Logger logger) {
		
		logger.error(comment);
	}
	
	/**
	 * 打印系统错误,只在服务器端打印，不反悔手机端
	 * @param e
	 */
	private static void printSysErrServer(Exception e, Logger logger) {
		// 服务器内部错误
		logger.error(getTrace(e));
	}
	
	/**
	 * 打印异常日志
	 * @param t
	 * @return
	 */
	private static String getTrace(Throwable t) {
        StringWriter stringWriter= new StringWriter();
        PrintWriter writer= new PrintWriter(stringWriter);
        t.printStackTrace(writer);
        StringBuffer buffer= stringWriter.getBuffer();
        return buffer.toString();
    }
	/**
	 * 取得老师动态评分
	 * @param teaUsService
	 * @param teacherId
	 * @return
	 */
	public static String getScore(TeaUsService teaUsService,String teacherId) throws Exception {
		
		//设置三门课程的状态
		List<String> list1 = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		list1.add("1");
		list1.add("2");
		list1.add("3");
		list1.add("4");
		list1.add("5");
		//星星数为:1,2,3,4,5的作业量
		String cnt = "";
		KeTeaUs keTeaUs = new KeTeaUs();
		keTeaUs.setTeacherId(teacherId);
		for (int i = 0; i < list1.size(); i++) {
			keTeaUs.setScore(list1.get(i));
			//取得每个星级的作业数量
			cnt = teaUsService.scoreCnt(keTeaUs);
			list2.add(cnt);	
		}
		double scoreInt = 0.0;
		int cnt1 = Integer.parseInt(list2.get(0));
		int cnt2 = Integer.parseInt(list2.get(1));
		int cnt3 = Integer.parseInt(list2.get(2));
		int cnt4 = Integer.parseInt(list2.get(3));
		int cnt5 = Integer.parseInt(list2.get(4));
		scoreInt = (double)(cnt1*1+cnt2*2+cnt3*3+cnt4*4+cnt5*5)/(cnt1+cnt2+cnt3+cnt4+cnt5);
		scoreInt = Math.round(scoreInt*10)/10.0;
		//取得老师评分
		String score = String.valueOf(scoreInt);
		return score;
	}
}
