package com.bayan.keke.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckUtil {

	/**
	 * 验证是否有空值的参数，只要有一个，就返回true
	 * @param args
	 * @return true
	 */
	public static boolean checkNulls(String... args){
		
		if(args.length == 0){
			return true;
		}
		//
		for (String str : args) {			
			if(isNullOrEmpty(str)){
				return true;
			}			
		}		
		return false;
	}
	
	/**
	 * 验证参数是否为空 
	 * @param parm
	 * @return true:空 false:非空
	 */
	public static boolean isNullOrEmpty(String parm){
		if(parm == null || KeConstant.BLANK.equals(parm.trim())){
			return true;
		}else{
			return false;
		}
	}
	public static boolean isNullOrEmpty(Object obj){
		if(obj == null || KeConstant.BLANK.equals(obj.toString())){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 验证参数是否为数字
	 * 
	 * @param number
	 * @return
	 */
	public static boolean isNumber(String number) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher matcher = pattern.matcher(number);

		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	/**
	 * 验证作业种类
	 * 
	 * @param
	 * @return
	 */
	public static boolean isSubjectType(String subjectType) {
		if("01".equals(subjectType) 
				|| "02".equals(subjectType) 
				|| "03".equals(subjectType)){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 验证用户ID
	 * 
	 * @param
	 * @return
	 */
	public static boolean isUserId(String userId) {
		Pattern pattern = Pattern.compile("[0-9a-zA-Z_-]*");
		Matcher matcher = pattern.matcher(userId);

		if (matcher.matches()) {
			return true;
		}
		return false;
	}
	
	/**
	 * 验证长度
	 * 
	 * @param
	 * @return
	 */
	public static boolean checkLength(String parm, int length) {
		
		if(isNullOrEmpty(parm)){
			return false;
		}
		
		if(parm.length() == length){
			return true;
		}else{
			return false;
		}
	}
}
