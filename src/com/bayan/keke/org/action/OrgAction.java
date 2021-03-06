package com.bayan.keke.org.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.bayan.keke.action.KeCommon;
import com.bayan.keke.util.KeConstant;
import com.bayan.keke.util.Md5Util;
import org.apache.log4j.Logger;

import com.bayan.keke.base.BaseAction;
import com.bayan.keke.org.service.OrgService;
import com.bayan.keke.service.CommonService;
import com.bayan.keke.service.SalesService;
import com.bayan.keke.service.TeaUsService;
import com.bayan.keke.service.UserService;
import com.bayan.keke.util.CheckUtil;
import com.bayan.keke.util.SendCodeUtil;
import com.bayan.keke.vo.KeOrg;
import com.bayan.keke.vo.KeSales;
import com.bayan.keke.vo.KeTeaUs;
import com.bayan.keke.vo.KeUser;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class OrgAction extends BaseAction implements
        ModelDriven<KeOrg>, Preparable {

    /**
     * 序列号
     */
    private static final long serialVersionUID = 6875008194411825448L;

    private static final Logger logger = Logger.getLogger(OrgAction.class);

    @Resource
    private OrgService orgService;

    @Resource
    private SalesService salesService;

    @Resource
    private CommonService commonService;

    @Resource
    private TeaUsService teaUsService;

    @Resource
    private UserService userService;

    private KeOrg keOrg;

    /**
     *
     */
    public KeOrg getModel() {
        return keOrg;
    }

    /**
     *
     */
    public void prepare() throws Exception {
        keOrg = new KeOrg();
    }

    /**
     * 机构登陆
     */
    public String login() {

        printStartLog("login方法开始", logger);
        printParamsLog("请求参数。", logger);
        if (CheckUtil.checkNulls(
                keOrg.getPhoneNumber(),
                keOrg.getPassword()
        )) {
            printErrorLog("传入的参数为空值,请参考参数日志", logger);
            return "error";
        }

        // 参数验证
        if (!CheckUtil.checkLength(keOrg.getPhoneNumber(), 11)) {
            printErrorLog("传入的手机号长度不对,请参考参数日志", logger);
            return "error";
        } else if (!CheckUtil.checkLength(keOrg.getPassword(), 32)) {
            printErrorLog("传入的密码长度不对,请参考参数日志", logger);
            return "error";
        }

        try {
            // 判断该用户是否已注册
            Map<String, Object> reg = orgService.selOrgInfo(keOrg);
            if (reg == null) {
                // 登录失败
                printErrorLog("用户还未注册", logger);
                getSession().setAttribute("error", "用户还未注册");
                return "orgLogin";
            } else {
                // 取得密码
                String orgPhoneNum = reg.get("phone_num").toString();
                String password = reg.get("password").toString();
                String orgId = reg.get("org_id").toString();
                String orgName = reg.get("org_name").toString();
                if (keOrg.getPassword().equals(password) && keOrg.getPhoneNumber().equals(orgPhoneNum)) {
                    // 登录查询数据
                    printDebugLog("获取机构信息" + reg.toString(), logger);
                    getSession().setAttribute("userId", orgId);
                    getSession().setAttribute("orgPhoneNum", orgPhoneNum);
                    getSession().setAttribute("orgName", orgName);
                    getSession().setAttribute("userFlag", "1");//用户标记0:老师1:推广机构
                    return "orgIndex";
                } else {
                    // 登录查询数据
                    printDebugLog("密码不对", logger);
                    getSession().setAttribute("error", "密码不对");
                    return "orgLogin";
                }
            }
        } catch (Exception e) {
            printSysErr(e, logger);
            return "error";
        }
    }

    /**
     * 退出账号
     */
    public String logout() {
        printStartLog("方法开始logout", logger);
        printParamsLog("退出账号处理参数:", logger);

        getSession().removeAttribute("userId");
        getSession().removeAttribute("orgPhotoNum");
        getSession().removeAttribute("orgName");
        getSession().removeAttribute("userFlag");

        // 请求结束log
        printEndLog("退出账号结束返回值:", "", logger);

        return "orgLogin";
    }

    /**
     * 用户重置密码发送验证码
     */
    public void sendCode() {
        try {
            printStartLog("sendCode方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keOrg.getPhoneNumber()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {

                // 判断该用户是否已注册
                Map<String, Object> reg = orgService.selOrgInfo(keOrg);
                if (reg == null) {
                    print("{\"code\":\"1002\",\"message\":\"手机号还未注册\"}");
                    printParamsJSON(logger);
                    return;
                }

                // 验证码发送间隔少于60秒
                if (!SendCodeUtil.checkSendRcd(keOrg.getPhoneNumber(), commonService)) {
                    // 发送失败
                    printDebugLog("验证码发送时间少于60秒", logger);
                    print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
                    printParamsJSON(logger);
                    return;
                }

                //subMail短信服务验证码
                String sms = SendCodeUtil.random(4);
                KeSales keSales = new KeSales();
                keSales.setPhoneNumber(keOrg.getPhoneNumber());
                keSales.setVerifyCode(sms);
                boolean flag = SendCodeUtil.sendCode(keOrg.getPhoneNumber(), sms);
                if (flag) {
                    //添加验证码
                    salesService.addCode(keSales);
                    JSONObject json = new JSONObject();
                    json.element("code", "1000");// 完善个人消息
                    json.element("message", "验证码发送成功");
                    json.element("verifyCode", sms);
                    print(json);
                    printEndLog("验证码发送成功！", json.toString(), logger);
                } else {
                    // 发送失败
                    print("{\"code\":\"1001\",\"message\":\"发送验证码失败\"}");
                    printParamsJSON(logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 忘记密码
     */
    public void updatePwd() {
        try {
            printStartLog("updatePwd方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keOrg.getPhoneNumber(),
                    keOrg.getPassword()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"输入参数为空或不正确\"}");
                return;
            } else {
                //判断该用户是否已注册
                Map<String, Object> reg = orgService.selOrgInfo(keOrg);
                if (reg == null) {
                    print("{\"code\":\"1001\",\"message\":\"用户还未注册！\"}");
                    printErrorLog("密码重置失败！", logger);
                    return;
                } else {

                    //重新设置密码
                    Integer result = orgService.reSetPwd(keOrg);
                    if (result > 0) {
                        print("{\"code\":\"1000\",\"message\":\"密码重置成功\"}");// 修改成功
                        printEndLog("1000", "密码重置成功！", logger);
                    } else {
                        // 登录失败
                        print("{\"code\":\"1002\",\"message\":\"密码重置失败\"}");
                        printErrorLog("密码重置失败！", logger);
                        return;
                    }
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 添加机构
     */
    public void addJigou() {
        try {
            printStartLog("addJigou方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keOrg.getOrgPhoneNumber(),
                    keOrg.getOrgName(),
                    keOrg.getOrgAddress(),
                    keOrg.getPassword()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请输入机构信息\"}");
                return;
            } else {
                //判断该用户是否已注册
                keOrg.setPhoneNumber(keOrg.getOrgPhoneNumber());
                Map<String, Object> reg = orgService.selOrgInfo(keOrg);
                if (reg != null) {
                    print("{\"code\":\"1001\",\"message\":\"用户已经添加过了！\"}");
                    printErrorLog("用户已经添加！", logger);
                    return;
                }

                //添加机构信息
                Integer result1 = orgService.insOrgInfo(keOrg);

                // 获取返回的ID
                String id = keOrg.getId();
                String orgId = "K" + String.valueOf(20000 + Long.parseLong(id));
                keOrg.setOrgId(orgId);

                // 更新机构orgID
                Integer result2 = orgService.updateOrgId(keOrg);


                if (result1 > 0 && result2 > 0) {
                    print("{\"code\":\"1000\",\"message\":\"添加成功\"}");// 修改成功
                    printEndLog("1000", "添加机构成功！", logger);
                } else {
                    // 登录失败
                    print("{\"code\":\"1002\",\"message\":\"添加失败\"}");
                    printErrorLog("添加机构失败！", logger);
                    return;
                }
            }
        } catch (Exception e) {
            // 服务器内部错误
            print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 添加学生
     */
    public void addStudent() {
        try {
            printStartLog("addStudent方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keOrg.getPhoneNumber(),
                    keOrg.getUserName(),
                    keOrg.getGrade())) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请输入学生信息\"}");
                return;
            }

            String orgId = getSession().getAttribute("userId").toString();
            keOrg.setUserId(keOrg.getPhoneNumber());
            keOrg.setOrgId(orgId);
            keOrg.setType(KeCommon.TYPE_TRY);//正常,后台添加学生不需要审核

            KeUser keUser = new KeUser();
            keUser.setPhoneNumber(keOrg.getPhoneNumber());
            keUser.setUserName(keOrg.getUserName());
            keUser.setGrade(keOrg.getGrade());
            keUser.setOrgId(orgId);
            keUser.setPassword(keOrg.getPassword());
            keUser.setOnType(keOrg.getOnType());
            keUser.setAddress(keOrg.getAddress());
            // 首次注册的昵称为：课课
            keUser.setNickName(keOrg.getUserName());
            // 首次注册的等级为：普通
            keUser.setStuLevel("0");
            // 首次注册,添加一个假头像地址判断
            keUser.setHeadUrl("kerkr999");
            // 设置设备的用途：0学生,1老师
            keUser.setFlag("0");
            // 后台添加学生不需要审核[用户类型(0:正常,1:充值,4:申请中,5:申请未通过)]
            keUser.setType("0");
            if (CheckUtil.isNullOrEmpty(keUser.getDeviceId())) {
                keUser.setDeviceId("nodeviceid");
                printErrorLog("取不到deviceId", logger);
            }
            //观看标签持久化
            String[] tagIds = keOrg.getTagIds();
            if(tagIds.length >0 && !tagIds[0].isEmpty()){
                String watchTags="";
                for(String t:tagIds){
                    watchTags += t + "#";
                }
                keOrg.setWatchTags(watchTags);
                keUser.setWatchTags(watchTags);
            }
            // 判断该用户是否已注册
            KeUser reg = userService.regist(keUser);
            if (reg != null) {

                if (CheckUtil.isNullOrEmpty(reg.getOrgId())) {

                    orgService.updateStuInfo(keOrg);

                    // 添加成功
                    print("{\"code\":\"1000\",\"message\":\"添加成功\"}");
                    printEndLog("添加成功", "", logger);
                } else {
                    // 用户登录失败
                    print("{\"code\":\"1001\",\"message\":\"该用户已加入其它机构\"}");
                    printDebugLog("手机号已注册过", logger);
                }
                return;
            }

            // 如果用户不选择地理位置，就默认一个：中国大陆
            if (CheckUtil.isNullOrEmpty(keUser.getCityCode()) || CheckUtil.isNullOrEmpty(keUser.getProvinceCode())) {
                // 中国
                keUser.setProvinceCode("910000");
                // 大陆
                keUser.setCityCode("910100");
            }

            // 将学生信息注册
            Integer result = userService.add(keUser);
            if (result > 0) {
                // 将数据库查询出来的所有数据做成Json对象
                print("{\"code\":\"1000\",\"message\":\"添加成功\"}");
                printEndLog("注册成功", "", logger);
            } else {
                // 用户注册失败
                print("{\"code\":\"1001\",\"message\":\"您的信息注册失败\"}");// 添加失败
                printErrorLog("学生信息注册失败", logger);
                return;
            }
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 移动APP注册学生
     * 20170925 by
     */
    public void addStuForAPP() {
        try {
            printStartLog("addStuForAPP方法开始", logger);
            printParamsLog("addStuForAPP请求参数", logger);
            if (CheckUtil.checkNulls(
                    keOrg.getPhoneNumber(),
                    keOrg.getUserName(),
                    keOrg.getGrade()
            )) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请输入学生信息\"}");
                return;
            }
            keOrg.setUserId(keOrg.getPhoneNumber());
            keOrg.setOrgId(KeCommon.ORGID_MINGZS);//明之算机构
            keOrg.setType(KeCommon.TYPE_APPLY);//未审核


            String phone = keOrg.getPhoneNumber();
            KeUser keUser = new KeUser();
            keUser.setPhoneNumber(phone);
            keUser.setUserName(keOrg.getUserName());
            keUser.setGrade(keOrg.getGrade());
            keUser.setOrgId(keOrg.getOrgId());
            String defaultPwd = phone.substring(phone.length() - 6, phone.length());
            keUser.setPassword(Md5Util.md5(defaultPwd));
            //地址
            keUser.setAddress(keOrg.getAddress());
            // 首次注册的昵称为：课课
            keUser.setNickName(keOrg.getUserName());
            // 首次注册的等级为：普通
            keUser.setStuLevel("0");
            // 首次注册,添加一个假头像地址判断
            keUser.setHeadUrl("kerkr999");
            // 设置设备的用途：0学生,1老师
            keUser.setFlag("0");
            // 用户类型(0:试用,1:充值,2:在校生,3:网校生,4:未审核)
            keUser.setType(KeCommon.TYPE_APPLY);

            // 判断该用户是否已注册
            KeUser reg = userService.regist(keUser);
            if (reg != null) {
                if ("4".equals(reg.getType())) {
                    print("{\"code\":\"1003\",\"message\":\"正在审核中\"}");
                    printDebugLog("用户正在审核中,code:1003", logger);
                } else if (CheckUtil.isNullOrEmpty(reg.getOrgId())) {
                    orgService.updateStuInfo(keOrg);
                    // 添加成功
                    print("{\"code\":\"1000\",\"message\":\"申请成功\"}");
                    printDebugLog("已存在用户更新,code:1000", logger);
                } else {
                    // 用户登录失败
                    print("{\"code\":\"1001\",\"message\":\"手机号已注册\"}");
                    printDebugLog("用户已加入其它机构,code:1001", logger);
                }
            } else {
                // 如果用户不选择地理位置，就默认一个：中国大陆
                if (CheckUtil.isNullOrEmpty(keUser.getCityCode()) || CheckUtil.isNullOrEmpty(keUser.getProvinceCode())) {
                    // 中国
                    keUser.setProvinceCode("910000");
                    // 大陆
                    keUser.setCityCode("910100");
                }
                // 将学生信息注册
                Integer result = userService.add(keUser);
                if (result > 0) {
                    print("{\"code\":\"1000\",\"message\":\"申请成功\"}");
                    printErrorLog("学生信息注册成功,code:1000", logger);
                } else {
                    // 用户注册失败
                    print("{\"code\":\"1002\",\"message\":\"注册失败\"}");// 添加失败
                    printErrorLog("学生信息注册失败，code:1002", logger);
                }
            }
            printEndLog("addStuForAPP方法注册结束", keUser.toString(), logger);
        } catch (Exception e) {
            // 服务器内部错误
            printSysErr(e, logger);
            return;
        }
    }

    /**
     * 删除学生
     */
    public void delStudent() {
        printStartLog("方法开始delStudent", logger);
        printParamsLog("删除学生处理参数:", logger);

        if (CheckUtil.isNullOrEmpty(keOrg.getUserId())) {
            printDebugLog("学生ID为空", logger);
            // 返回结果
            JSONObject json = new JSONObject();
            json.element("result", "fail");
            print(json);
            return;
        }

        try {

            // 返回结果
            JSONObject json = new JSONObject();

            // 删除学生
            keOrg.setOrgId(null);
            Integer rst = orgService.updateStuInfo(keOrg);
            if (rst == 1) {
                json.element("result", "success");
            } else {
                json.element("result", "fail");
            }
            print(json);

            // 请求结束log
            printEndLog("删除学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 添加老师
     */
    public void addTeacher() {
        try {
            printStartLog("addTeacher方法开始", logger);
            printParamsLog("请求参数。", logger);
            if (CheckUtil.checkNulls(
                    keOrg.getTeaPhone(),
                    keOrg.getTeaName(),
                    keOrg.getPassword())) {
                printErrorLog("传入的参数为空值,请参考参数日志", logger);
                print("{\"code\":\"1005\",\"message\":\"请输入老师信息\"}");
                return;
            }
            String orgId = getSession().getAttribute("userId").toString();
            keOrg.setOrgId(orgId);
            keOrg.setTeacherId(keOrg.getTeaPhone());

            // 判断该用户是否已注册
            KeTeaUs keTeaUs = new KeTeaUs();
            keTeaUs.setPhoneNumber(keOrg.getTeaPhone());
            keTeaUs.setUserName(keOrg.getTeaName());
            keTeaUs.setPassword(keOrg.getPassword());
            keTeaUs.setSubjectType(keOrg.getTeaSubject());
            keTeaUs.setGrade(keOrg.getTeaGrade());
            keTeaUs.setOrgId(orgId);

            //默认头像地址：kerkr999
            keTeaUs.setHeadUrl("kerkr999");
            //默认性别：男
            keTeaUs.setSex("1");
            //默认为：注册老师类型(0:内部,1:外部)
            keTeaUs.setType("1");
            //默认所在地
            keTeaUs.setCityCode("910100");
            keTeaUs.setProvinceCode("910000");
            //默认教师资格证URL
            keTeaUs.setCertificateUrl("default");
            //默认在线状态：离线
            keTeaUs.setActiveStatus("OFFLINE");
            //默认审核状态为：未通过
            keTeaUs.setApproveStatus("APPROVED");


            Map<String, Object> reg = teaUsService.teaRegist(keTeaUs);
            if (reg != null) {

                if (reg.containsKey("org_id")) {

                    orgService.updateTeaInfo(keOrg);

                    print("{\"code\":\"1000\",\"message\":\"添加成功\"}");
                    printEndLog("注册成功", "", logger);
                } else {
                    //修改老师信息

                    // 用户登录失败
                    print("{\"code\":\"1001\",\"message\":\"该用户已加入其它机构\"}");
                    printDebugLog("手机号已注册过", logger);
                }
                return;
            }

            // 将信息注册
            Integer result = teaUsService.teaAdd(keTeaUs);
            if (result <= 0) {
                // 服务器内部错误
                print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
                printErrorLog("注册失败", logger);
                return;
            }

            // 将数据库查询出来的所有数据做成Json对象
            print("{\"code\":\"1000\",\"message\":\"添加成功\"}");
            printEndLog("注册成功", "", logger);
        } catch (Exception e) {
            // 服务器内部错误
            print("{\"code\":\"2001\",\"message\":\"系统出错啦\"}");
            printSysErrServer(e, logger);
            return;
        }
    }

    /**
     * 删除老师
     */
    public void delTeacher() {
        printStartLog("方法开始delTeacher", logger);
        printParamsLog("删除老师处理参数:", logger);

        if (CheckUtil.isNullOrEmpty(keOrg.getTeacherId())) {
            printDebugLog("老师ID为空", logger);
            // 返回结果
            JSONObject json = new JSONObject();
            json.element("result", "fail");
            print(json);
            return;
        }

        try {

            // 返回结果
            JSONObject json = new JSONObject();

            // 删除老师
            keOrg.setOrgId("");
            Integer rst = orgService.updateTeaInfo(keOrg);
            if (rst == 1) {
                json.element("result", "success");
            } else {
                json.element("result", "fail");
            }
            print(json);

            // 请求结束log
            printEndLog("删除老师结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 学生一览
     */
    public void studentList() {
        printStartLog("方法开始studentList", logger);
        printParamsLog("查询学生内容参数:", logger);

        int start = (getPage() - 1) * getRows();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("page", start);
        map.put("size", getRows());
        map.put("grade", keOrg.getGrade());
        map.put("orgId", getSession().getAttribute("userId").toString());
        map.put("phoneNumber",keOrg.getPhoneNumber());
        map.put("userName",keOrg.getUserName());

        try {

            // 查询学生个数
            Integer rst = orgService.countStudent(map);

            // 查询学生详情
            List<Map<String, Object>> list = orgService.selStuList(map);

            // 返回结果
            JSONArray jsonList = JSONArray.fromObject(list);
            JSONObject json = new JSONObject();
            json.element("total", rst);
            json.element("rows", jsonList.toString());
            print(json);

            // 请求结束log
            printEndLog("查询学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 查询待审核申请学生列表
     * 20170926 by kdn
     */
    public void applyStuList() {
        printStartLog("applyStuList方法开始", logger);
        printParamsLog("applyStuList查询学生内容参数:", logger);

        int start = (getPage() - 1) * getRows();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("page", start);
        map.put("size", getRows());
        map.put("orgId", getSession().getAttribute("userId").toString());
        // 用户类型(0:试用,1:充值,4:申请中)
        map.put("type", KeCommon.TYPE_APPLY);

        try {

            // 待审核学生个数
            Integer rst = orgService.countApplyStu(map);

            // 待审核学生详情
            List<Map<String, Object>> list = orgService.getApplyStuList(map);

            // 返回结果
            JSONArray jsonList = JSONArray.fromObject(list);
            JSONObject json = new JSONObject();
            json.element("total", rst);
            json.element("rows", jsonList.toString());
            print(json);

            // 请求结束log
            printEndLog("查询学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 新申请学生审核
     * 20170927 by kdn
     */
    public void checkApplyStu() {
        printStartLog("checkApplyStu方法开始", logger);
        printParamsLog("checkApplyStu查询学生内容参数:", logger);
        JSONObject json = new JSONObject();
        try {
            if (CheckUtil.checkNulls(
                    keOrg.getId(),
                    getSession().getAttribute("userId").toString()
            )|| KeCommon.TYPE_APPLY.equals(keOrg.getType()) ) {
                printDebugLog("传入的参数为空值,请参考参数日志", logger);
                json.element("result", "fail");
                print(json);
                return;
            }
            //类型(0:试用,1:充值,2:在校生,3:网校生,4:申请中,5:申请未通过)
            if(KeCommon.TYPE_NOPASS.equals(keOrg.getType())){
                //审核不通过
                keOrg.setOrgId(null);
                keOrg.setWatchTags(null);
            }else{
                keOrg.setOrgId(getSession().getAttribute("userId").toString());
                //观看标签持久化
                String[] tagIds = keOrg.getTagIds();
                if(tagIds.length >0 && !tagIds[0].isEmpty()){
                    String watchTags="";
                    for(String t:tagIds){
                        watchTags += t + "#";
                    }
                    keOrg.setWatchTags(watchTags);
                }
            }
            Integer rst = orgService.checkApplyStu(keOrg);
            // 返回结果
            if (rst > 0) {
                json.element("result", "success");
            } else {
                json.element("result", "fail");
            }
            print(json);
            // 请求结束log
            printEndLog("查询学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 老师一览
     */
    public void teacherList() {
        printStartLog("方法开始teacherList", logger);
        printParamsLog("查询老师内容参数:", logger);

        int start = (getPage() - 1) * getRows();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("page", start);
        map.put("size", getRows());
        map.put("orgId", getSession().getAttribute("userId").toString());

        try {

            // 查询老师个数
            Integer rst = orgService.countTeacher(map);

            // 查询老师详情
            List<Map<String, Object>> list = orgService.selTeaList(map);

            // 返回结果
            JSONArray jsonList = JSONArray.fromObject(list);
            JSONObject json = new JSONObject();
            json.element("total", rst);
            json.element("rows", jsonList.toString());
            print(json);

            // 请求结束log
            printEndLog("查询学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 老师一览
     */
    public void jigouInfo() {
        printStartLog("方法开始jigouInfo", logger);
        printParamsLog("查询机构信息参数:", logger);

        int start = (getPage() - 1) * getRows();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("page", start);
        map.put("size", getRows());
        map.put("orgId", keOrg.getOrgId());

        try {

            Integer rst = 0;
            List<Map<String, Object>> list = null;

            if ("1".equals(keOrg.getType())) {
                // 查询老师个数
                rst = orgService.countTeacher(map);

                // 查询老师详情
                list = orgService.selTeaList(map);
            } else {
                // 查询学生个数
                rst = orgService.countStudent(map);

                // 查询学生详情
                list = orgService.selStuList(map);
            }

            // 返回结果
            JSONArray jsonList = JSONArray.fromObject(list);
            JSONObject json = new JSONObject();
            json.element("total", rst);
            json.element("rows", jsonList.toString());
            print(json);

            // 请求结束log
            printEndLog("查询学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 修改学生年级
     */
    public void changGrade() {
        printStartLog("changGrade方法开始", logger);
        printParamsLog("请求参数。", logger);
        if (CheckUtil.checkNulls(
                keOrg.getGradeone(),
                keOrg.getGradetwo()
        )) {
            printErrorLog("传入的参数为空值,请参考参数日志", logger);
            print("{\"code\":\"1005\",\"message\":\"请选择要变换的年级\"}");
            return;
        }

        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("gradeone", keOrg.getGradeone());
            map.put("gradetwo", keOrg.getGradetwo());
            map.put("orgId", getSession().getAttribute("userId").toString());
            //变换年级
            Integer result = orgService.changGrade(map);
            if (result <= 0) {
                print("{\"code\":\"1001\",\"message\":\"没有找到对应年级学生\"}");// 修改成功
                printEndLog("1001", "年级变换失败！", logger);
                return;
            }
            //System.out.println("修改年级1=" + keOrg.getGradeone() + "修改年级2=" + keOrg.getGradetwo());
            print("{\"code\":\"1000\",\"message\":\"年级变换成功!\"}");
            printEndLog("年级变换成功!", "", logger);
        } catch (Exception e) {
            // 服务器内部错误
            printSysErrServer(e, logger);
            return;
        }
    }

    /**
     * 查询机构一览
     */
    public void jigouList() {
        printStartLog("方法开始jigouList", logger);
        printParamsLog("查询机构一览处理参数:", logger);

        try {

            // 查询SID信息
            List<Map<String, Object>> list = orgService.selOrgList();


            JSONArray jsonList = JSONArray.fromObject(list);
            print(jsonList);

            // 请求结束log
            printEndLog("查询SID结束返回值:", jsonList.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 添加用户画面
     *
     * @return
     */
    public String toAddUser() {
        return "toAddUser";
    }

    /**
     * 添加学生画面
     *
     * @return
     */
    public String toAddStudent() {
        return "toAddStudent";
    }

    /**
     * 添加老师画面
     *
     * @return
     */
    public String toAddTeacher() {
        return "toAddTeacher";
    }

    /**
     * 用户重置密码画面
     *
     * @return
     */
    public String toUpdPwd() {
        return "toUpdPwd";
    }

    /**
     * 用户修改密码画面
     *
     * @return
     */
    public String toUpdatePwd() {
        return "updatePwd";
    }

    /**
     * 添加机构画面
     *
     * @return
     */
    public String toAddJigou() {
        return "toAddJigou";
    }

    /**
     * 机构明细画面
     *
     * @return
     */
    public String toJigouList() {
        return "toJigouList";
    }

    /**
     * 学生明细画面
     *
     * @return
     */
    public String toStudentList() {
        return "toStudentList";
    }

    /**
     * 老师明细画面
     *
     * @return
     */
    public String toTeaList() {
        return "toTeaList";
    }

    /**
     * 上传视频页面
     *
     * @return
     */
    public String toUploadVieo() {
        getRequest().setAttribute("domain", KeCommon.QINIU_VIDEO_DOMIN);
        return "toUploadVieo";
    }

    /**
     * 视频管理页面
     *
     * @return
     */
    public String toVideosList() {
        //getRequest().setAttribute("domain",KeCommon.QINIU_VIDEO_DOMIN);
        return "toVideosList";
    }

    /**
     * 更新视频相关信息
     *
     * @return
     */
    public String toUpdateVideo() {
        return "toUpdateVideo";
    }

    /**
     * 待审核列表页面
     *
     * @return
     */
    public String toApplyList() {
        return "toApplyList";
    }

    /**
     * 学生更新 20180116
     */
    public void updateStudent() {
        printStartLog("方法开始updateStudent", logger);
        printParamsLog("更新学生处理参数:", logger);
        if (CheckUtil.isNullOrEmpty(keOrg.getId())) {
            printDebugLog("学生UID为空", logger);
            // 返回结果
            JSONObject json = new JSONObject();
            json.element("result", "fail");
            print(json);
            return;
        }
        try {
            //观看标签持久化
            String[] tagIds = keOrg.getTagIds();
            if(tagIds.length >0 && !tagIds[0].isEmpty()){
                String watchTags="";
                for(String t:tagIds){
                    watchTags += t + "#";
                }
                keOrg.setWatchTags(watchTags);
            }
            Integer rst = orgService.updateStuById(keOrg);
            // 返回结果
            JSONObject json = new JSONObject();
            if (rst == 1) {
                json.element("result", "success");
            } else {
                json.element("result", "fail");
            }
            print(json);

            // 请求结束log
            printEndLog("更新学生结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 标签设置页面 20180305
     * @return
     */
    public String toWatchTag() {
        return "toWatchTag";
    }

    /**
     * 标签列表&设置页面
     * 20180306
     */
    public void watchTagList() {
        printStartLog("watchTagList方法开始", logger);
        printParamsLog("查询标签参数:", logger);

        Map map = new HashMap<>();
        map.put("page", keOrg.getPageNumber());
        map.put("size", keOrg.getPageSize());
        try {
            Integer rst = orgService.countWatchTag(map);
            List<Map> list = orgService.getWatchTagList(map);
            // 返回结果
            JSONArray jsonList = JSONArray.fromObject(list);
            JSONObject json = new JSONObject();
            json.element("total", rst);
            json.element("rows", jsonList.toString());
            print(json);

            // 请求结束log
            printEndLog("查询watchTagList结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    public void addWatchTag() {
        printStartLog("addWatchTag方法开始", logger);
        printParamsLog("addWatchTag参数:", logger);

        Map map = new HashMap<>();
        map.put("tagName", keOrg.getTagName());
        try {
            List<Map> havTag= orgService.selectWatchTagForName(keOrg.getTagName());

            JSONObject json = new JSONObject();
            if(havTag.size() == 0){
                Integer result = orgService.addWatchTag(map);
                if (result > 0) {
                    json.element("result", "success");
                    json.element("message", "添加成功");
                } else {
                    json.element("result", "fail");
                    json.element("message", "添加失败");
                }
            }else {
                json.element("result", "fail");
                json.element("message", "重复标签");
            }
            // 返回结果
            print(json);
            // 请求结束log
            printEndLog("addWatchTag结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    public void updateWatchTag() {
        printStartLog("updateWatchTag方法开始", logger);
        printParamsLog("updateWatchTag参数:", logger);

        Map map = new HashMap<>();
        map.put("id", keOrg.getId());
        map.put("tagName", keOrg.getTagName());
        try {
            List<Map> havTag= orgService.selectWatchTagForName(keOrg.getTagName());
            // 返回结果
            JSONObject json = new JSONObject();
            if(havTag.size() == 0){
                Integer result =orgService.updateWatchTag(map);
                if (result > 0) {
                    json.element("result", "success");
                    json.element("message", "修改成功");
                } else {
                    json.element("result", "fail");
                    json.element("message", "修改失败");
                }
            }else {
                json.element("result", "fail");
                json.element("message", "重复标签");
            }
            print(json);
            // 请求结束log
            printEndLog("updateWatchTag结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }

    /**
     * 标签列表&下拉菜单
     * 20180306
     */
    public void getTagsList() {
        printStartLog("getTagsList方法开始", logger);
        try {
            Integer rst = orgService.countWatchTag(null);
            List<Map> list = orgService.getWatchTagList(null);
            JSONArray jsonList = new JSONArray();
            for (Map one:list){
                Map tmp = new HashMap();
                tmp.put("id",one.get("id"));
                tmp.put("text",one.get("tagName"));
                jsonList.add(tmp);
            }
            // 返回结果
            JSONObject json = new JSONObject();
            json.element("total", rst);
            json.element("rows", jsonList.toString());
            print(json);

            // 请求结束log
            printEndLog("getTagsList结束返回值:", json.toString(), logger);
        } catch (Exception e) {
            printSysErr(e, logger);
        }
    }
}
