package com.bayan.keke.action;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.ActivityService;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.UserService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.vo.KeActivity;
import com.bayan.keke.vo.KeUser;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONObject;

/**
 * 
 * @author zx
 *
 */
public class ActivityAction extends BaseAction 
    implements ModelDriven<KeActivity>, Preparable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 2299778301374382990L;

    private static final Logger logger = Logger.getLogger(ActivityAction.class);
 
    //
    private KeActivity keActivity;
    
	/* */
	@Resource
	private PayService payService;
	
    @Resource
    private ActivityService activityService;

	@Resource
	private UserService userService;
	
    @Override
    public void prepare() throws Exception {
    	keActivity = new KeActivity();
    }

    @Override
    public KeActivity getModel() {
        return keActivity;
    }

    /**
     * 查询排名
     */
    public void getOrder() {
    	
    	printStartLog("方法开始getOrder", logger);
    	printParamsLog("查询排名参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keActivity.getUserId())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
    	
    	try {
    		
    		// 设置排名为-1时，前端不显示名次画面
    		int order = -1;
    		// 油量奖励
    		String oil = "0";
    		// Q币奖励
    		String qcoin = "0";
    		
    		// 活动开始时间2016-07-01 ~~ 2016-09-01
    		if(KeCommon.isSummerActivity()){
    			
    			// 首次上传作业查询排名
    			Integer firstFlg = activityService.getFirstRst(keActivity);
    			
    			printDebugLog("作业排名：" + firstFlg, logger);
    			if(firstFlg == 1){
    				
    				// 查询排名
    				List<Map<String,String>> orderList = activityService.getOrder(keActivity);
    				for (int i = 0; i < orderList.size(); i++) {
    					Map<String,String> taskMap = orderList.get(i);
    					if(keActivity.getUserId().equals(taskMap.get("user_id"))){
    						order = i+1;
    						break;
    					}
    				}
    				
    				// 计算虚拟排名
    				order = order * 3;
    				Random ord = new Random();
    				order = order - ord.nextInt(2);
    				
    				// 油量奖励
    				oil = getOilWithOrder(order);
    				// Q币奖励
    				qcoin = getQcoinWithOrder(order);
    			}
    		}
    		

			JSONObject json = new JSONObject();
			json.element("code", KeConstant.KE_SUCCESS);
			json.element("orderNum", order);
			json.element("oil", oil);
			json.element("qcoin", qcoin);
			print(json);
			
			// 请求结束log
			printEndLog("查询排名结束返回值:", json.toString(), logger);
		} catch (Exception e1) {
			printSysErr(e1, logger);
			return;
		}
    }

	/**
	 * 根据排名获得油量
	 * @param order
	 * @return
	 */
	private String getOilWithOrder(int order) {
		if (order >= 101 && order <= 200) {
			return "1";
		} else {
			return "0";
		}
	}
	
	/**
	 * 根据排名获得Q币
	 * @param order
	 * @return
	 */
	private String getQcoinWithOrder(int order) {
		// Q币奖励
		String qcoin = "0";
		
		Random rd = new Random();
		int num = rd.nextInt(2) + 1;
		
		// 奖励
		if(order <= 100){
			qcoin = String.valueOf(num);
		}else{
			qcoin = "0";
		}
		
		return qcoin;
	}
    
    /**
     * 油量奖励
     */
    public void addOil() {
    	
    	printStartLog("方法开始addOil", logger);
    	printParamsLog("油量奖励参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keActivity.getUserId(),
				keActivity.getOrderNum())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
    	
    	try {
    		
    		// 判断用户是否存在
    		KeUser keuser = new KeUser();
    		keuser.setPhoneNumber(keActivity.getUserId());
			//通过登录手机号去查询用户信息
			KeUser user = userService.regist(keuser);
			if (user == null) {
				// 登录失败
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				printErrorLog("找不到用户注册信息", logger);
				return;
			}
			
    		// 判断当天是否已经领取过奖励
    		Integer count = activityService.getTodayCount(keActivity);
    		if(count > 0){
				//加油成功
				print("{\"code\":\"1002\",\"message\":\"今天已经领取过奖品了\"}");
				printEndLog("==当天已领过奖品==", "", logger);
				return;
    		}
    		
    		// 根据排名获得油量
    		keActivity.setOil(getOilWithOrder(Integer.parseInt(keActivity.getOrderNum())));
    		
			// 自动加油功能
			boolean result = KeCommon.autoAddOil(
					payService, keActivity.getUserId(), keActivity.getOil(), "暑期活动奖励");
			
			if(result){
				//加油成功
				print("{\"code\":\"1000\",\"message\":\"加油成功\"}");
			}else{
				//加油失败
				print("{\"code\":\"1001\",\"message\":\"领取失败\"}");
			}
			
			// 添加奖品记录
			keActivity.setPrize(keActivity.getOil()+"L油量奖励");
			keActivity.setReceive("1");//已领取
			Integer addRst = activityService.addContacts(keActivity);
			if(addRst <= 0){
				printErrorLog("奖品记录添加失败", logger);
			}

			// 请求结束log
			printEndLog("油量奖励结束", "", logger);
		} catch (Exception e1) {
			printSysErr(e1, logger);
			return;
		}
    }
    
    /**
     * 奖品记录
     */
    public void addContacts() {
    	
    	printStartLog("方法开始addContacts", logger);
    	printParamsLog("奖品记录参数:", logger);
    	
		// 参数验证
		if (CheckUtil.checkNulls(keActivity.getUserId(),
				keActivity.getQq(),
				keActivity.getOrderNum())) {
			
			printErrorLog("传入的参数为空值,请参考参数日志", logger);
			print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
			return;
		}
    	
    	try {
    		
    		// 判断用户是否存在
    		KeUser keuser = new KeUser();
    		keuser.setPhoneNumber(keActivity.getUserId());
			//通过登录手机号去查询用户信息
			KeUser user = userService.regist(keuser);
			if (user == null) {
				// 登录失败
				print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
				printErrorLog("找不到用户注册信息", logger);
				return;
			}
			
    		// 判断当天是否已经领取过奖励
    		Integer count = activityService.getTodayCount(keActivity);
    		if(count > 0){
				//加油成功
				print("{\"code\":\"1002\",\"message\":\"今天已经领取过奖品了\"}");
				printEndLog("==当天已领过奖品==", "", logger);
				return;
    		}
    		
    		// 设置Q币奖励
    		String qcoin = getQcoinWithOrder(Integer.parseInt(keActivity.getOrderNum()));
    		String prize = qcoin + "Q币";
    		keActivity.setPrize(prize);
    		
    		keActivity.setReceive("0");//未领取
			Integer addRst = activityService.addContacts(keActivity);
			if(addRst <= 0){
				//加油成功
				print("{\"code\":\"2001\",\"message\":\"领取失败\"}");
				printErrorLog("奖品记录添加失败", logger);
			}else{
				//加油成功
				print("{\"code\":\"1000\",\"message\":\"领取成功\"}");
			}

			// 请求结束log
			printEndLog("==奖品领取结束==", "", logger);
		} catch (Exception e1) {
			printSysErr(e1, logger);
			return;
		}
    }

    
}
