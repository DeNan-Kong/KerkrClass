package com.bayan.keke.action;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import com.bayan.keke.base.BaseAction;
import com.bayan.keke.service.CommonService;
import com.bayan.keke.service.PayService;
import com.bayan.keke.service.UserService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.DateUtil;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KePay;
import com.bayan.keke.vo.KeUser;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.qiniu.util.Auth;
import net.sf.json.JSONObject;

public class UserAction extends BaseAction implements
        ModelDriven<KeUser>, Preparable {
    /*序列号*/
    private static final long serialVersionUID = 8832921877864377000L;
    //输出日志
    private static final Logger logger = Logger.getLogger(UserAction.class);
    //
    private KeUser keUser;
    //
    private KePay kePay;
    @Resource
    private UserService userService;
    @Resource
    private PayService payService;
    @Resource
    private CommonService commonService;

    /* */
    public KeUser getModel() {
        return keUser;
    }

    /* */
    public void prepare() throws Exception {
        keUser = new KeUser();
        kePay = new KePay();
    }

    /**
     * 学生注册
     */
    public void add() {
        try {
            printStartLog("add方法开始", logger);
            printParamsLog("请求参数。", logger);
            //首次注册的昵称为：课课
            keUser.setNickName("课课");
            //首次注册的等级为：普通
            keUser.setStuLevel("0");
            //首次注册,添加一个假头像地址判断
            keUser.setHeadUrl("kerkr999");
            //设置设备的用途：0学生,1老师
            keUser.setFlag("0");
            //注册用户进来默认为：试用用户(0:试用用户,1:充值用户)
            keUser.setType("0");
            if (CheckUtil.isNullOrEmpty(keUser.getDeviceId())) {
                keUser.setDeviceId("nodeviceid");
                printErrorLog("取不到deviceId", logger);
            }
            if (CheckUtil.checkNulls(
                    keUser.getPhoneNumber(),
                    keUser.getPassword(),
                    keUser.getHeadUrl(),
                    keUser.getNickName(),
                    keUser.getGrade(),
                    keUser.getStuLevel(),
                    keUser.getDeviceId(),
                    keUser.getDeviceType()
            )) {
                printDebugLog(keUser.toString(), logger);
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //判断该用户是否已注册
                KeUser reg = userService.regist(keUser);
                if (reg == null) {
                    //如果用户不选择地理位置，就默认一个：中国大陆
                    if (CheckUtil.isNullOrEmpty(keUser.getCityCode())
                            || CheckUtil.isNullOrEmpty(keUser.getProvinceCode())) {
                        //中国
                        keUser.setProvinceCode("910000");
                        //大陆
                        keUser.setCityCode("910100");
                    }
                    //将学生信息注册
                    Integer result = userService.add(keUser);
                    if (result > 0) {
                        //注册完成直接登录
                        Map<String, Object> list = userService.login(keUser);
                        //取得用户ID,插入设备管理表中
                        keUser.setUserId(list.get("userId").toString());
                        //查找是否已存在学生的设备号
                        String dev = userService.selectDevice(keUser);
                        if (CheckUtil.isNullOrEmpty(dev)) {
                            //添加设备号，将设备号插入到数据库中
                            userService.addDevice(keUser);
                        }
                        //第一次注册送1L油量
                        kePay.setUserId(keUser.getPhoneNumber());
                        //kePay.setInputOil("3");
                        //kePay.setRemainOil("10");
                        kePay.setInputOil("10");// 首次充值送10L油量
                        kePay.setRemainOil("30");// 让进度条显示在1/3位置
                        kePay.setPayType("00");
                        kePay.setPayMoney("0.00");
                        //检查用户是否有充值过
                        Map<String, Object> user = payService.selectOil(kePay);
                        if (user == null) {
                            //首次充值，加入一条数据
                            Integer oil = payService.add(kePay);
                            if (oil == 0) {
                                //油量赠送失败
                                printErrorLog("学生注册时油量赠送失败", logger);
                            }
                            //插入充值记录
                            Integer oilRec = payService.addRecord(kePay);
                            if (oilRec <= 0) {
                                //赠送油量记录插入失败
                                printErrorLog("学生注册时赠送油量记录插入失败", logger);
                            }
                        }
                        //学号字符串拼接
                        String idStr = list.get("id").toString();
                        int idInt = Integer.parseInt(idStr);
                        idInt = idInt + 15000000;
                        idStr = String.valueOf(idInt);
                        //将数据库查询出来的所有数据做成Json对象
                        JSONObject obj = new JSONObject();
                        obj.element("code", KeConstant.KE_SUCCESS);
                        obj.element("userId", list.get("userId").toString());
                        obj.element("userName", list.get("userName").toString());
                        obj.element("grade", list.get("grade").toString());
                        obj.element("headUrl", keUser.getHeadUrl());
                        obj.element("kekeId", idStr);
                        obj.element("cityCode", list.get("cityCode").toString());
                        obj.element("provinceCode", list.get("provinceCode").toString());
                        print(obj);
                        printEndLog("用户注册结束返回值:", obj.toString(), logger);
                    } else {
                        //用户注册失败
                        print("{\"code\":\"1001\",\"message\":\"您的信息注册失败\"}");// 添加失败
                        printErrorLog("学生信息注册失败", logger);
                        return;
                    }
                } else {
                    //账户已注册
                    print("{\"code\":\"1001\",\"message\":\"账户已经注册过啦\"}");
                    printEndLog("账户已注册", "返回code：1001，message：账户已注册过啦", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 用户注册发送验证码
     */
    public void sendCodeS() {
        try {
            printStartLog("sendCodeS方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getPhoneNumber()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //查询用户信息，判断该用户是否已注册
                KeUser user = userService.regist(keUser);
                if (user == null) {

                    // 验证码发送间隔少于60秒
                    if (!SendCodeUtil.checkSendRcd(keUser.getPhoneNumber(), commonService)) {
                        // 发送失败
                        print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
                        printDebugLog("验证码发送时间少于60秒", logger);
                        return;
                    }

                    //subMail短信服务验证码
                    String sms = SendCodeUtil.random(4);
                    keUser.setVerifyCode(sms);
                    boolean flag = SendCodeUtil.sendCode(keUser.getPhoneNumber(), keUser.getVerifyCode());
                    if (flag) {
                        //添加验证码
                        userService.addCode(keUser);
                        JSONObject json = new JSONObject();
                        json.element("code", KeConstant.KE_SUCCESS);// 完善个人消息
                        json.element("message", "获取成功");
                        json.element("verifyCode", sms);
                        print(json);// 验证码已发送
                        printEndLog("欢迎新用户注册", json.toString(), logger);
                    } else {
                        // 发送失败
                        print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
                        printErrorLog("发送验证码失败", logger);
                        return;
                    }
                } else {
                    // 手机号已注册
                    print("{\"code\":\"1001\",\"message\":\"您的手机号已被注册过\"}");
                    printEndLog("手机号已被注册过", "返回code：1001,message:您的手机号已被注册过", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 用户重置密码发送验证码
     */
    public void sendCodeRS() {
        try {
            printStartLog("sendCodeRS方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getPhoneNumber()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //查询用户信息，判断该用户是否已注册
                KeUser user = userService.regist(keUser);
                if (user == null) {
                    print("{\"code\":\"1001\",\"message\":\"手机号还未注册\"}");
                    printDebugLog("手机号还未注册", logger);
                    return;
                } else {

                    // 验证码发送间隔少于60秒
                    if (!SendCodeUtil.checkSendRcd(keUser.getPhoneNumber(), commonService)) {
                        // 发送失败
                        printDebugLog("验证码发送时间少于60秒", logger);
                        print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
                        printParamsJSON(logger);
                        return;
                    }

                    //subMail短信服务验证码
                    String sms = SendCodeUtil.random(4);
                    keUser.setVerifyCode(sms);
                    boolean flag = SendCodeUtil.sendCode(keUser.getPhoneNumber(), keUser.getVerifyCode());
                    if (flag) {
                        //添加验证码
                        userService.addCode(keUser);
                        JSONObject json = new JSONObject();
                        json.element("code", KeConstant.KE_SUCCESS);// 完善个人消息
                        json.element("message", "获取成功");
                        json.element("verifyCode", sms);
                        print(json);
                        printEndLog("验证码获取成功！", json.toString(), logger);
                    } else {
                        // 发送失败
                        print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
                        printErrorLog("发送验证码失败", logger);
                        return;
                    }
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 学生端登陆(IOS&Android by kdn)
     */
    public void login() {
        try {
            printStartLog("login方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.isNullOrEmpty(keUser.getDeviceId())) {
                keUser.setDeviceId("nodeviceid");
                printErrorLog("取不到deviceId", logger);
            }
            if (CheckUtil.checkNulls(
                    keUser.getPhoneNumber(),
                    keUser.getPassword(),
                    keUser.getDeviceId(),
                    keUser.getDeviceType())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //通过登录手机号和登录密码去查询用户信息
                KeUser user = userService.regist(keUser);
                if (user == null) {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"手机号还未注册\"}");
                    printDebugLog("手机号还未注册", logger);
                    return;
                } else {
                    //取得密码
                    String password = user.getPassword();
                    if (keUser.getPassword().equals(password)) {
                        if (KeCommon.TYPE_APPLY.equals(user.getType())) {
                            //用户还在审核中
                            print("{\"code\":\"1003\",\"message\":\"正在审核中\"}");
                            printErrorLog("正在审核中,code：1003", logger);
                        } else if (KeCommon.TYPE_NOPASS.equals(user.getType())) {
                            //用户审核不通过
                            print("{\"code\":\"1006\",\"message\":\"审核未通过\"}");
                            printErrorLog("审核未通过,code：1006", logger);
                        } else {
                            //七牛云下载头像
                            String headKey = user.getHeadUrl();
                            String url = KeCommon.getHeadUrlSign(headKey);
                            //注册完成直接登录
                            Map<String, Object> list = userService.login(keUser);
                            //更新设备ID
                            keUser.setUserId(list.get("userId").toString());
                            keUser.setFlag("0");
                            //查找是否有了学生的设备号
                            String dev = userService.selectDevice(keUser);
                            if (!CheckUtil.isNullOrEmpty(dev)) {
                                //更新设备ID
                                Integer dv = userService.updateDevice(keUser);
                                if (dv > 0) {
                                    printEndLog(KeConstant.KE_SUCCESS, "更新设备ID成功！", logger);
                                }
                            } else {
                                userService.addDevice(keUser);
                                //更新设备ID失败
                                printDebugLog("设备不存在", logger);
                            }
                            //学号字符串拼接
                            String idStr = list.get("id").toString();
                            int idInt = Integer.parseInt(idStr);
                            idInt = idInt + 15000000;
                            idStr = String.valueOf(idInt);
                            //将数据库查询出来的所有数据做成Json对象
                            JSONObject obj = new JSONObject();
                            obj.element("code", KeConstant.KE_SUCCESS);
                            obj.element("userId", list.get("userId").toString());
                            obj.element("userName", list.get("userName").toString());
                            obj.element("grade", list.get("grade").toString());
                            obj.element("headUrl", url);
                            obj.element("kekeId", idStr);
                            obj.element("cityCode", list.get("cityCode").toString());
                            obj.element("provinceCode", list.get("provinceCode").toString());
                            print(obj);
                            printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
                        }

                    } else {
                        //输入密码错误
                        print("{\"code\":\"1004\",\"message\":\"密码错误\"}");
                        printErrorLog("密码错误", logger);
                        return;
                    }
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 忘记密码
     */
    public void forgerPassword() {
        try {
            printStartLog("forgerPassword方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getPhoneNumber(),
                    keUser.getPassword()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //判断该用户是否已注册
                KeUser reg = userService.regist(keUser);
                if (reg == null) {
                    print("{\"code\":\"1001\",\"message\":\"账户还未注册\"}");
                    printErrorLog("账户还未注册！", logger);
                    return;
                } else {
                    //重新设置密码
                    Integer result = userService.reSetPW(keUser);
                    if (result > 0) {
                        print("{\"code\":\"1000\",\"message\":\"密码重置成功\"}");// 修改成功
                        printEndLog(KeConstant.KE_SUCCESS, "密码重置成功！", logger);
                    } else {
                        // 登录失败
                        print("{\"code\":\"1001\",\"message\":\"密码重置失败\"}");
                        printErrorLog("密码重置失败！", logger);
                        return;
                    }
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 学生端第三方QQ微信登录
     * 先走登录,如果为注册则跳到注册请求
     */
    public void thirdpartyLogin() {
        try {
            printStartLog("thirdpartyLogin方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.isNullOrEmpty(keUser.getDeviceId())) {
                keUser.setDeviceId("nodeviceid");
                printErrorLog("取不到deviceId", logger);
            }
            if (CheckUtil.checkNulls(
                    keUser.getUserId(),
                    keUser.getDeviceId(),
                    keUser.getDeviceType())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //查找第三方是否已注册
                Map<String, Object> user = userService.QQWeChatRegist(keUser);
                if (user == null) {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"您的QQ或微信还未注册\"}");
                    printDebugLog("登录失败,用户还未注册！", logger);
                    return;
                } else {
                    //七牛云下载头像
                    String headKey = user.get("head_url").toString();
                    String url = KeCommon.getHeadUrlSign(headKey);
                    //注册完成之后可直接登录
                    Map<String, Object> list = userService.QQWeChatLogin(keUser);
                    //更新设备ID
                    keUser.setUserId(keUser.getUserId());
                    keUser.setFlag("0");
                    //查找是否有了学生的设备号
                    String dev = userService.selectDevice(keUser);
                    if (!CheckUtil.isNullOrEmpty(dev)) {
                        //更新设备ID
                        Integer dv = userService.updateDevice(keUser);
                        if (dv > 0) {
                            printEndLog(KeConstant.KE_SUCCESS, "更新设备ID成功！", logger);
                        } else {
                            // 登录失败
                            printErrorLog("更新设备ID失败", logger);
                        }
                    }
                    //学号字符串拼接
                    String idStr = list.get("id").toString();
                    int idInt = Integer.parseInt(idStr);
                    idInt = idInt + 15000000;
                    idStr = String.valueOf(idInt);
                    //将数据库查询出来的所有数据做成Json对象
                    JSONObject obj = new JSONObject();
                    obj.element("code", KeConstant.KE_SUCCESS);
                    obj.element("userId", list.get("userId").toString());
                    obj.element("userName", list.get("userName").toString());
                    obj.element("grade", list.get("grade").toString());
                    obj.element("headUrl", url);
                    obj.element("kekeId", idStr);
                    obj.element("cityCode", list.get("cityCode").toString());
                    obj.element("provinceCode", list.get("provinceCode").toString());
                    print(obj);
                    printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /*
     * 学生端第三方QQ微信注册
     */
    public void thirdpartyAdd() {
        try {
            printStartLog("thirdpartyAdd方法开始", logger);
            printParamsLog("请求参数。", logger);
            //首次注册的等级为：普通
            keUser.setStuLevel("0");
            //设置设备的用途：0学生,1老师
            keUser.setFlag("0");
            //注册用户进来默认为：试用用户(0:试用用户,1:充值用户)
            keUser.setType("0");
            if (CheckUtil.isNullOrEmpty(keUser.getDeviceId())) {
                keUser.setDeviceId("nodeviceid");
                printErrorLog("取不到deviceId", logger);
            }
            if (CheckUtil.checkNulls(
                    keUser.getUserId(),
                    keUser.getNickName(),
                    keUser.getHeadUrl(),
                    keUser.getGrade(),
                    keUser.getDeviceId(),
                    keUser.getDeviceType())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //查找第三方是否已注册
                Map<String, Object> user = userService.QQWeChatRegist(keUser);
                if (user == null) {
                    //如果用户不选择地理位置，就默认一个：中国大陆
                    if (CheckUtil.isNullOrEmpty(keUser.getCityCode())
                            || CheckUtil.isNullOrEmpty(keUser.getProvinceCode())) {
                        //中国
                        keUser.setProvinceCode("910000");
                        //大陆
                        keUser.setCityCode("910100");
                    }
                    //执行注册
                    Integer result = userService.QQWeChatAdd(keUser);
                    //注册成功
                    if (result > 0) {
                        Map<String, Object> list = userService.QQWeChatLogin(keUser);
                        //取得用户ID,插入设备管理表中
                        keUser.setUserId(keUser.getUserId());
                        //查找是否有了学生的设备号
                        String dev = userService.selectDevice(keUser);
                        if (CheckUtil.isNullOrEmpty(dev)) {
                            //添加设备号，将设备号插入到数据库中
                            userService.addDevice(keUser);
                        }
                        //第一次注册送1L油量
                        kePay.setUserId(keUser.getUserId());
                        kePay.setInputOil("3");
                        kePay.setRemainOil("10");
                        kePay.setPayType("00");
                        kePay.setPayMoney("0.00");
                        //检查用户是否有充值过
                        Map<String, Object> isInput = payService.selectOil(kePay);
                        if (isInput == null) {
                            //首次充值，加入一条数据
                            Integer oil = payService.add(kePay);
                            if (oil < 1) {
                                //油量赠送失败
                                printErrorLog("油量赠送失败", logger);
                            }
                            //插入充值记录
                            Integer oilRec = payService.addRecord(kePay);
                            if (oilRec < 1) {
                                //插入充值记录失败
                                printErrorLog("赠送油量记录插入失败", logger);
                            }
                        }
                        //学号字符串拼接
                        String idStr = list.get("id").toString();
                        int idInt = Integer.parseInt(idStr);
                        idInt = idInt + 15000000;
                        idStr = String.valueOf(idInt);
                        //将数据库查询出来的所有数据做成Json对象
                        JSONObject obj = new JSONObject();
                        obj.element("code", KeConstant.KE_SUCCESS);
                        obj.element("userId", list.get("userId").toString());
                        obj.element("userName", list.get("userName").toString());
                        obj.element("grade", list.get("grade").toString());
                        obj.element("headUrl", list.get("headUrl").toString());
                        obj.element("kekeId", idStr);
                        obj.element("cityCode", list.get("cityCode").toString());
                        obj.element("provinceCode", list.get("provinceCode").toString());
                        print(obj);
                        printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
                    } else {
                        //信息注册失败
                        print("{\"code\":\"1001\",\"message\":\"您的信息注册失败\"}");
                        printErrorLog("您的信息注册失败", logger);
                        return;
                    }
                } else {
                    //用户登录失败
                    print("{\"code\":\"1001\",\"message\":\"账户已经注册过啦\"}");//
                    printDebugLog("账户已注册过", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * TODO 下个版本前端更新后调用此方法
     * 用户上传头像取得授权
     */
    public void getHeadStuToken() {

        printStartLog("getHeadStuToken方法开始", logger);
        printParamsLog("请求参数。", logger);
        if (CheckUtil.checkNulls(
                keUser.getUserId())) {

            printErrorLog("传入的参数为空值,请参考参数日志", logger);
            print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
            return;
        } else {
            //取得上传头像用的key和token
            String upStr = KeCommon.getHeadUpKey(keUser.getUserId());
            String[] headKey = upStr.split(KeConstant.DOUHAO);
            JSONObject obj = new JSONObject();
            obj.element("code", KeConstant.KE_SUCCESS);
            obj.element("message", "取得头像授权成功");
            obj.element("token", headKey[0]);
            obj.element("key", headKey[1]);
            print(obj);
            printEndLog("取得头像授权成功!", obj.toString(), logger);
        }
    }

    /**
     * TODO 下个版本前端更新后调用此方法
     * 用户上传头像成功回调
     */
    public void upHeadStuOK() {
        try {
            printStartLog("upHeadStuOK方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getUserId(),
                    keUser.getHeadUrl())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //将图片地址key更新写入数据库当中
                Integer result = userService.headUrlUpdate(keUser);
                if (result > 0) {
                    JSONObject obj = new JSONObject();
                    obj.element("code", KeConstant.KE_SUCCESS);
                    obj.element("message", "修改成功");
                    print(obj);
                    printEndLog("修改头像成功!", obj.toString(), logger);
                } else {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"修改失败\"}");
                    printErrorLog("头像修改失败", logger);
                    return;
                }
            }
        } catch (Exception e) {
            //系统错误
            printSysErr(e, logger);
        }
    }

    /**
     * TODO 下个版本前端更新后可以删除
     * 修改用户上传头像
     */
    public void updateIcon() {
        try {
            printStartLog("updateIcon方法开始", logger);
            printParamsLog("请求参数。", logger);
            //七牛授权
            String token = "";
            //存教师证KEY
            String key = "";
            if (CheckUtil.checkNulls(
                    keUser.getUserId())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请稍后再试\"}");
                return;
            } else {
                //将头像照片上传七牛云
                Auth auth = Auth.create(KeCommon.ACCESS_KEY, KeCommon.SECRET_KEY);
                token = auth.uploadToken(KeCommon.QINIU_BUCKET_HEADURL);
                key = createKey(keUser.getUserId());
                //设置数据库要保存照片的key值
                keUser.setHeadUrl(key);
                //将图片地址key更新写入数据库当中
                Integer result = userService.headUrlUpdate(keUser);
                if (result > 0) {
                    JSONObject obj = new JSONObject();
                    obj.element("code", KeConstant.KE_SUCCESS);
                    obj.element("message", "修改成功");
                    obj.element("token", token);
                    obj.element("key", key);
                    print(obj);
                    printEndLog("恭喜您换头像成功!", obj.toString(), logger);
                } else {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"修改失败\"}");
                    printErrorLog("头像修改失败", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 用户昵称修改
     */
    public void updateNickname() {
        try {
            printStartLog("updateNickname方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getUserId(),
                    keUser.getNickName())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请稍后再试\"}");
                return;
            } else {
                //截取低分原因内容不超过50个字
                String nick = keUser.getNickName();
                if (nick.length() > 50) {
                    nick = nick.substring(0, 50);
                }
                keUser.setNickName(nick);

                //更新昵称
                Integer result = userService.udpateName(keUser);
                if (result > 0) {
                    print("{\"code\":\"1000\",\"message\":\"修改成功\"}");// 修改成功
                    printEndLog(KeConstant.KE_SUCCESS, "昵称修改成功！", logger);
                } else {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"修改失败\"}");
                    printErrorLog("修改昵称失败", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 用户年级修改
     */
    public void updateGrade() {
        try {
            printStartLog("updateGrade方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getUserId(),
                    keUser.getGrade())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请稍后再试\"}");
                return;
            } else {
                //更新年级
                Integer result = userService.udpateGrade(keUser);
                if (result > 0) {
                    print("{\"code\":\"1000\",\"message\":\"修改成功\"}");// 修改成功
                    printEndLog(KeConstant.KE_SUCCESS, "修改成功！", logger);
                } else {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"修改失败\"}");
                    printErrorLog("年级修改失败", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 用户所在地修改
     */
    public void updateCity() {
        try {
            printStartLog("updateCity方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keUser.getUserId(),
                    keUser.getCityCode(),
                    keUser.getProvinceCode())) {

                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请稍后再试\"}");
                return;
            } else {
                //所在地更新
                Integer result = userService.updateCity(keUser);
                if (result > 0) {
                    print("{\"code\":\"1000\",\"message\":\"修改成功\"}");
                    printEndLog(KeConstant.KE_SUCCESS, "所在地修改成功！", logger);
                } else {
                    // 登录失败
                    print("{\"code\":\"1001\",\"message\":\"修改失败\"}");
                    printErrorLog("所在地修改失败", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 我的页面——用户信息
     * param userId 用户ID
     *
     * @return 头像URL、学号、昵称、年级、所在地
     */
    public void userInfo() {
        printStartLog("userInfo方法开始", logger);
        printParamsLog("请求参数。", logger);
        if (CheckUtil.checkNulls(
                keUser.getUserId())) {

            printErrorLog("传入的参数为空值,请参考参数日志", logger);
            print("{\"code\":\"1005\",\"message\":\"请稍后再试\"}");
            return;
        }
        try {
            keUser.setPhoneNumber(keUser.getUserId());
            //通过登录手机号去查询用户信息
            KeUser user = userService.regist(keUser);
            if (user == null) {
                // 登录失败
                print("{\"code\":\"1001\",\"message\":\"找不到您的信息\"}");
                printErrorLog("找不到用户注册信息", logger);
                return;
            } else {
                // 判断学生头像key是否为URL
                String headKey = user.getHeadUrl();
                String url = null;
                //判断头像key是否为可下载地址
                if (isHttpUrl(headKey) || "kerkr999".equals(headKey)) {
                    //头像未上传过七牛云
                    url = headKey;
                } else {
                    //头像重新上传过七牛云
                    url = KeCommon.getHeadUrlSign(headKey);
                }
                //学号字符串拼接
                String idStr = user.getId().toString();
                int idInt = Integer.parseInt(idStr);
                idInt = idInt + 15000000;
                idStr = String.valueOf(idInt);
                //将数据库查询出来的所有数据做成Json对象
                JSONObject obj = new JSONObject();
                obj.element("code", KeConstant.KE_SUCCESS);
                obj.element("userId", user.getUserId());
                obj.element("userName", user.getUserName());
                obj.element("grade", user.getGrade());
                obj.element("headUrl", url);
                obj.element("kekeId", idStr);
                obj.element("cityCode", user.getCityCode());
                obj.element("provinceCode", user.getProvinceCode());
                print(obj);
                printEndLog(KeConstant.KE_SUCCESS, obj.toString(), logger);
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 判断学生头像key是否为URL
     *
     * @param urls 用户头像key
     * @return true:是URL、false:不是URL
     */
    public static boolean isHttpUrl(String urls) {
        boolean isurl = false;
        Pattern pat = Pattern.compile(KeConstant.regex.trim());
        Matcher mat = pat.matcher(urls.trim());
        isurl = mat.matches();
        if (isurl) {
            isurl = true;
        }
        return isurl;
    }

    /**
     * 学生头像用的创建七牛存储key
     *
     * @param userId 用户ID
     * @return 七牛存储key-->保存在数据库的certificate_url字段里
     */
    private String createKey(String userId) {
        String str = DateUtil.getOrderId();
        StringBuilder key = new StringBuilder();
        key.append(userId);
        key.append(KeConstant.DELIMITER);
        key.append(str);
        return key.toString();
    }
}
