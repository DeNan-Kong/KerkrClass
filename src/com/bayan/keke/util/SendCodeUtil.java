package com.bayan.keke.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.bayan.keke.service.CommonService;
import com.bayan.keke.submail.config.AppConfig;
import com.bayan.keke.submail.lib.MESSAGEXsend;
import com.bayan.keke.submail.utils.ConfigLoader;

/**
 * 
 * @author zx
 *
 */
public class SendCodeUtil {
	
	// 验证码
	private static final String SUBMAIL_PROJECT = "P7mEf4";
	private static final String SUBMAIL_VAR = "code";
	
	// SID
	private static final String SUBMAIL_SID_PRO = "bJMGs1";
	private static final String SUBMAIL_SID = "sid";
	
	// 教师资格证审核结果信息
	private static final String SUBMAIL_CER_NO = "jtTGA4";
	private static final String SUBMAIL_CER_YES = "RelU02";
	
	private static AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);


	
	/**
	 * 验证上次验证码发送间隔
	 * @return
	 */
	public static boolean checkSendRcd(String phoneNumber, CommonService commonService){
		
		// 获取上次发送验证码间隔秒数
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("phoneNumber", phoneNumber);
		try {
			String seconds = commonService.selVerifyCode(map);
			
			if(!CheckUtil.isNullOrEmpty(seconds) && Integer.parseInt(seconds) < 60){
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	/**
	 * 发送验证码
	 * @param user
	 * @return
	 */
	public static boolean sendCode(String phoneNumber, String verifyCode){
		
		MESSAGEXsend submail = new MESSAGEXsend(config);
		submail.addTo(phoneNumber);
		submail.setProject(SUBMAIL_PROJECT);
		submail.addVar(SUBMAIL_VAR, verifyCode);
		submail.xsend();
		
		return true;
	}
	
	/**
	 * 发送SID
	 * @param user
	 * @return
	 */
	public static boolean sendSid(String phoneNumber, String sid){
		
		MESSAGEXsend submail = new MESSAGEXsend(config);
		submail.addTo(phoneNumber);
		submail.setProject(SUBMAIL_SID_PRO);
		submail.addVar(SUBMAIL_SID, sid);
		submail.xsend();
		
		return true;
	}
	
	/**
	 * 发送教师资格证审核不通过信息
	 * @param user
	 * @return
	 */
	public static boolean sendCerNO(String phoneNumber){
		
		MESSAGEXsend submail = new MESSAGEXsend(config);
		submail.addTo(phoneNumber);
		submail.setProject(SUBMAIL_CER_NO);
		//submail.addVar(SUBMAIL_SID, sid);
		submail.xsend();
		
		return true;
	}
	
	/**
	 * 发送教师资格证审核已通过信息
	 * @param user
	 * @return
	 */
	public static boolean sendCerYES(String phoneNumber){
		
		MESSAGEXsend submail = new MESSAGEXsend(config);
		submail.addTo(phoneNumber);
		submail.setProject(SUBMAIL_CER_YES);
		//submail.addVar(SUBMAIL_SID, sid);
		submail.xsend();
		
		return true;
	}
	
	/**
	 * 4位随机验证码
	 */
	public static String random(int n) {
		if (n < 1 || n > 10) {
			throw new IllegalArgumentException("cannot random " + n
					+ " bit number");
		}
		Random ran = new Random();
		if (n == 1) {
			return String.valueOf(ran.nextInt(10));
		}
		int bitField = 0;
		char[] chs = new char[n];
		for (int i = 0; i < n; i++) {
			while (true) {
				int k = ran.nextInt(10);
				if ((bitField & (1 << k)) == 0) {
					bitField |= 1 << k;
					chs[i] = (char) (k + '0');
					break;
				}
			}
		}
		return new String(chs);
	}
}
