<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en"
    class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<link href="/favicon.ico" type="image/x-icon" rel=icon>
<link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
<meta name="renderer" content="webkit">
<title>登录－课课工作台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
    href="${pageContext.servletContext.contextPath }/css/min.css">
<link rel="stylesheet"
    href="${pageContext.servletContext.contextPath }/css/login.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jQuery.md5.js"></script>
<style type="text/css">
.alpha {
    
}
</style>
        <script type="text/javascript">
    $(function() {
        $('#yzm').click(function() {
            var phoneNumber = $('#phoneNumber').val();
            if (phoneNumber == '') {
                alert('请输入手机号')
            } else {
                $.post('sendCodeRSSales.jspx', {
                    'phoneNumber' : phoneNumber
                }, function(data) {
                    if (data.code == '1002') {
                        alert('手机号还未注册');
                    } else if (data.code == '1001') {
                        alert('发送失败')
                    } else if (data.code == '1005') {
                        alert('输入参数为空或不正确')
                    } else if (data.code == '1000') {
                        alert('验证码已发送请查收');
                        $('#hiddenVerifyCode').val(data.verifyCode);
                    }
                }, 'json');
            }
        });
    });
</script>
</head>
<body style="background-image: url('${pageContext.servletContext.contextPath }/images/bg.jpg');margin-top:0px;">
    <div>
    <table style="padding-left: 10%;">
        <tr>
        <%-- <td ><img style="padding-top: 6%; padding-left: 5%;" src="${pageContext.servletContext.contextPath }/images/avatar.png"></td> --%>
        <td ><img style="padding-top: 6%; padding-left: 15%; width:50%; height:60%;" src="${pageContext.servletContext.contextPath }/images/logo0000.png">&nbsp;</td>
            <td align="left" style="padding-top: 6%;font-weight: bold;color: #FFFFFF;font-size:30px;"></td>
        </tr>
    </table>
    </div>
    <div id="loginbox" style="padding-top: 3%; padding-left: 55%;">
        <form id="loginform" name="loginform" class="form-vertical"
            style="background-color: #FFFFFF"
            action="${pageContext.servletContext.contextPath }/adminLoginManage.jspx"
            method="post">
            <div class="control-group normal_text">
                <table style="width: 100%">
                    <tr>
                        <td align="left"></td>
                            <td align="center" style="font-weight: bold;color: #FFFFFF;font-size:20px;">课课后台管理中心</td>
                        <td align="right"></td>
                    </tr>
                </table>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 28px;"><img style="margin-top:1px;height:32px;" 
                                src="${pageContext.servletContext.contextPath }/images/ph11.png"
                                alt="请输入手机号.."></span><input id="phoneNumber" type="text" placeholder="手机号" name="phoneNumber" value=""
                                style="height: 51px;width: 62%; margin-bottom: 0px;border:1px solid #c0c0c0;"/><input type="button" 
                                    style="margin-bottom: 0px;background: #64CDBD;height: 51px;width:20%;
                                    font-size:10px;color: #FFFFFF;" value="发送验证码" id="yzm">
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 28px;height:36px;"><img
                            src="${pageContext.servletContext.contextPath }/images/code1.png"
                            alt="请输入验证码"></span><input id="verifyCode" type="text" placeholder="验证码" name="verifyCode" value=""
                            style="margin-top:8px;height: 54px;width: 82%; margin-bottom: -2px;border:1px solid #c0c0c0;"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="main_input_box">
                        <span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 24px;"><img
                            src="${pageContext.servletContext.contextPath }/images/pw.png"
                            alt="请输入密码.."></span><input id="password" type="password" placeholder="密码" name="password" value=""
                            style="height: 52px;width: 82%; margin-bottom: 0px;border:1px solid #c0c0c0;"/>
                    </div>
                </div>
            </div>
            <div class="main_input_box" style="padding-left: 8%;padding-right: 8%;">
                  <a href="javascript:checkUserForm()">
                  <input type="button" style="margin-top: 10px;margin-left: 0px;background: #64CDBD;height: 45px;width:100%;font-size:24px;color: #FFFFFF;" value="登&nbsp;&nbsp;录" >
                  </a>
            </div>
            <div style="padding-top: 6%;background-color: #FFFFFF"></div>
            <input type="hidden" id="hiddenVerifyCode">
        </form>
    </div>
    <script type="text/javascript">
        if ("${error}"!= "") {
            alert("${error}");
            <%
                request.getSession().removeAttribute("error");
            %>
        };
        function checkUserForm() {

            if($('#phoneNumber').val()==""){
                alert('手机号码不能为空！');
                return ;
            }
            if($('#password').val()==""){
                alert('密码不能为空！');
                return ;
            }
            
            var verifyCode = $('#verifyCode').val();
            var hiddenVerifyCode = $('#hiddenVerifyCode').val();
            if (verifyCode == '') {
                alert('请输入验证码')
                return;
            }
            
            if (verifyCode != hiddenVerifyCode) {
                alert('验证码错误')
                return;
            }
            
            // 密码加密
            $('#password').val($.md5($('#password').val()));
            document.loginform.submit();
      }
    </script>
    
</body>
</html>