package com.alipay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.3
 *日期：2012-08-10
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
 *提示：如何获取安全校验码和合作身份者ID
 *1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
 *2.点击“商家服务”(https://b.alipay.com/order/myOrder.htm)
 *3.点击“查询合作者身份(PID)”、“查询安全校验码(Key)”

 *安全校验码查看时，输入支付密码后，页面呈灰色的现象，怎么办？
 *解决方法：
 *1、检查浏览器配置，不让浏览器做弹框屏蔽设置
 *2、更换浏览器或电脑，重新登录查询。
 */

public class AlipayConfig {
	
	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	public static String partner = "2088021413948354";
	// 商户的私钥:MD5密钥
	public static String key = "m3kzjldscm8283rve39dykul9rh5leul";
	
	// TODO
	//===============后台统一管理密钥，前端不保存私钥，修改后使用密钥B======start==============================
//	// 课课密钥对B : RSA课课公钥 : 上传到支付宝
//	public static String RSA_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCj3l1N+D3hTd9ENGv7iFOW21oD3d8BChGZvdZ7yAzjsLFDk9UPALoV6BlEJsNF+vpEv04eOtxB5IG2TI76C9jNoT24Mr7NZXp7ufNCAiB6983VMMxokjJi0SVt5Wmud+nUTtNhjQ6c0naQ7qVsjeCfN1xF30I/+XC0EQtAD5Y3nwIDAQAB";
//	
//	// 课课密钥对B : RSA课课PKCS8私钥 JAVA用 : 后台保存，下单用
//	public static String RSA_PRIVATE_PKCS8_KEY = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAKPeXU34PeFN30Q0a/uIU5bbWgPd3wEKEZm91nvIDOOwsUOT1Q8AuhXoGUQmw0X6+kS/Th463EHkgbZMjvoL2M2hPbgyvs1lenu580ICIHr3zdUwzGiSMmLRJW3laa536dRO02GNDpzSdpDupWyN4J83XEXfQj/5cLQRC0APljefAgMBAAECgYB6BuXOYRSbiaTAIpVi2vL8PN48UOV23aubpC1rQd6vU229mAGpyW3JUGw4PvFdVHc36Ingow5QFzyspzg1ZcsMrIAugVGCrm0UXXSrmM1bbQzSpuITMUSyn+7ViduzqWrn7LRnImBOS0BHndW4ZxEhSRRNekuDoYf1jNXQQjSGiQJBAM3bV3oPIfoYI5vcfA1Wik+nfNRzVZY/HNC0jnGQDonkvC8Un7fyDTdvdNVvQM+SRlVLdXbkSK4tz08cyw7T7H0CQQDLyMF5OEkUt8u42AZ+zjVx+jXeCoQWajD4CPtQPJHBbfOZ4FG4SOioJ4njSmAnMEhujLjk1DZUcs5oPvMwxdtLAkEAtEkIz4k5RIKnjPUIX9YOw7v3g0iPCEq1vcKjjamQUgvVE5aIWtzN3mLqe5I3vJJqroCrmzhKvuC30p1w6MeJMQJAKl9c81Kjx34MCyxH9Xf1HvTy3G99VZfRBNIBR4bAm+K740QEWfg3ADfwcOVXJu7gMLRsAZCql1aj2oM0V/DcDwJBAKW/WNe/4Xr3CmdN+xG/2ANjIyCok0w4wMX5aEqJHvmmyf3700FYRyax6ZJ0uZHWo2K723TifIPMiffy/GeWWaw=";
//	
//	// 课课密钥对B : RSA课课私钥 : 暂时用不到
//	public static String RSA_PRIVATE_KEY = "MIICXQIBAAKBgQCj3l1N+D3hTd9ENGv7iFOW21oD3d8BChGZvdZ7yAzjsLFDk9UPALoV6BlEJsNF+vpEv04eOtxB5IG2TI76C9jNoT24Mr7NZXp7ufNCAiB6983VMMxokjJi0SVt5Wmud+nUTtNhjQ6c0naQ7qVsjeCfN1xF30I/+XC0EQtAD5Y3nwIDAQABAoGAegblzmEUm4mkwCKVYtry/DzePFDldt2rm6Qta0Her1NtvZgBqcltyVBsOD7xXVR3N+iJ4KMOUBc8rKc4NWXLDKyALoFRgq5tFF10q5jNW20M0qbiEzFEsp/u1Ynbs6lq5+y0ZyJgTktAR53VuGcRIUkUTXpLg6GH9YzV0EI0hokCQQDN21d6DyH6GCOb3HwNVopPp3zUc1WWPxzQtI5xkA6J5LwvFJ+38g03b3TVb0DPkkZVS3V25EiuLc9PHMsO0+x9AkEAy8jBeThJFLfLuNgGfs41cfo13gqEFmow+Aj7UDyRwW3zmeBRuEjoqCeJ40pgJzBIboy45NQ2VHLOaD7zMMXbSwJBALRJCM+JOUSCp4z1CF/WDsO794NIjwhKtb3Co42pkFIL1ROWiFrczd5i6nuSN7ySaq6Aq5s4Sr7gt9KdcOjHiTECQCpfXPNSo8d+DAssR/V39R708txvfVWX0QTSAUeGwJviu+NEBFn4NwA38HDlVybu4DC0bAGQqpdWo9qDNFfw3A8CQQClv1jXv+F69wpnTfsRv9gDYyMgqJNMOMDF+WhKiR75psn9+9NBWEcmsemSdLmR1qNiu9t04nyDzIn38vxnllms";
	//======================================================end================================
	
	//================原课课密钥，由于下单ios是在前端，改成后台下单后，前端不保存密钥，改为使用密钥对B======start===========================
	// 课课密钥对A : 公钥  : 原课课公钥，上传到支付宝
	public static String RSA_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCeMqGqxH9R1Q0TqOHGNz8Gzm/w+VYU0tyseeRp9qWjYgbYeZVd04KZ1pr54JwOy99jF7eKWZCZ3kIvSzfx5F1MzPI+3MlkhsrKK/nqCV4em6mTAaZZtUi0ZUl3yMI6KqXKpwC3RpCPT6fPcABOjFW6LBXPuzaZ7F2ULOWN2cpcywIDAQAB";
	
	// 课课密钥对A : 私钥 : 原课课私钥，后台保存，下单用 
	public static String RSA_PRIVATE_PKCS8_KEY = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAJ4yoarEf1HVDROo4cY3PwbOb/D5VhTS3Kx55Gn2paNiBth5lV3TgpnWmvngnA7L32MXt4pZkJneQi9LN/HkXUzM8j7cyWSGysor+eoJXh6bqZMBplm1SLRlSXfIwjoqpcqnALdGkI9Pp89wAE6MVbosFc+7NpnsXZQs5Y3ZylzLAgMBAAECgYAZm9ah3zdBFv0L7q3FuZHBV0+1sZcmvc+tN/oq0RuVLDwxdNUiICgnIR9rTdnVZ1ldICy8/6yxy9Ho+AMxbCdSEz8bPneFD0YgwZLkmBao4LUMBcjk8CxGWWF7UHC2NuBjOby46/pZd6UPhWerTy+eFvXd9WQHcQjZrCKRIWVpQQJBAMrVnohfmMqMkBfgbxDJmdqTudgwgXEZJUn8KYHzCnzfjiTSk8MV8sj2epQVdd303hn6S02Z8Y+t5IKixKWU2CECQQDHqdmaAt3i628+vxuVcjS0ZQCxE1Oq+fPiPM7SSGCynCytCYRVC5/tvbsEI2QWF8MIk7aKeOZ/FtnYcNg2xydrAkAy3mgn43G6Oo5YrpysJSNEwg+1vFR6PMgxSeBPCtjygE5xxa3xGywMYmRThx5MUADzmuYPzC/czMumR5PxwuaBAkAyfzugnv79SCwvg2f3iRXZVf4xysCLaoILAvQP7Ow/4A3QiaqlU7ZUC3tEFatXhxT1k15EcUVieSYJfqjAWegXAkAgDXwcRpIGDVB+QF8mdpcRXOL8+Ir57ZHee13Isb/ZwGhCWWVMIP4Eh2K2h4eY5wUQ57SASRoEqvY2L86/wJSn";
	//==============================================================================end===========================

	// 支付宝的公钥，无需修改该值
	public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";

	//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	

	// 调试用，创建TXT日志文件夹路径
//	public static String log_path = "F:\\KK_Project\\10_tmplog\\";
	public static String log_path = "D:\\tomcat_test\\tmplog\\";

	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";
	
	// 签名方式 不需修改
	public static String sign_type = "MD5";
	
	// 签名方式 不需修改
	public static String sign_type_rsa = "RSA";

}
