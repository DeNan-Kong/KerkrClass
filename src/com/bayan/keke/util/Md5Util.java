package com.bayan.keke.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

public class Md5Util {

	/**
	 * 
	 */
	public static String md5(String string) {
		if (string == null || string.trim().length() < 1) {
			return null;
		}
		try {
			return getMD5(string.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 
	 */
	public static String md52(String string) {
		if (string == null || string.trim().length() < 1) {
			return null;
		}
		try {
			return getMD52(string.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 
	 */
	private static String getMD5(byte[] source) {
		String s = null;
		char hexDigits[] = { // 用来将字节转换成 16 进制表示的字符
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd',
				'e', 'f' };
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(source);
			byte tmp[] = md.digest(); // MD5 的计算结果是一个 128 位的长整数，
			// 用字节表示就是 16 个字节
			char str[] = new char[16 * 2]; // 每个字节用 16 进制表示的话，使用两个字符，
			// 所以表示成 16 进制需要 32 个字符
			int k = 0; // 表示转换结果中对应的字符位置
			for (int i = 0; i < 16; i++) { // 从第一个字节开始，对 MD5 的每一个字节
				// 转换成 16 进制字符的转换
				byte byte0 = tmp[i]; // 取第 i 个字节
				str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换,
				// >>> 为逻辑右移，将符号位一起右移
				str[k++] = hexDigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
			}
			s = new String(str); // 换后的结果转换为字符串

		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	/**
	 * 
	 */
	private static String getMD52(byte[] source) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			StringBuffer result = new StringBuffer();
			for (byte b : md5.digest(source)) {
				System.out.println(b);

				result.append(Integer.toHexString((b & 0xf0) >>> 4));
				result.append(Integer.toHexString(b & 0x0f));
			}
			return result.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	/**
	 * 
	 */
	public static void main(String[] args) {

		String s = "abc123";

		// System.out.println(md52(s));
		// System.out.println(Long.parseLong(md52(s), 10));

		/*
		 * String str = "2828718396"; long num = Long.parseLong(str); String
		 * changeStr = decimalTo(num, 16); System.out.println(changeStr);
		 */

		//System.out.println(md52(s));
		/*// System.out.println(Integer.parseInt(md52(s).substring(0, 8), 16));

		// Double dRandom = new Double(10000 * Math.random());
		// Integer iRandom = new Integer(dRandom.intValue());

		
		 * String sSerialNum = rot13(CMyDateTime.now().toString("yyyyMMdd") +
		 * iRandom.toString()).toLowerCase(); return sSerialNum;
		 
		// System.out.println(iRandom);

		String time = new SimpleDateFormat("yyMMddHHmmss").format(new Date());
		Double dRandom = new Double(10000 * Math.random());
		Integer iRandom = new Integer(dRandom.intValue());
		System.out.println(time + iRandom);*/
		System.out.println(Md5Util.md5("123456"));
	}
}
