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
		<title>修改密码</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"
			href="${pageContext.servletContext.contextPath }/css/min.css">
		<link rel="stylesheet"
			href="${pageContext.servletContext.contextPath }/css/login.css">
		<link href="${pageContext.servletContext.contextPath }/css/css.css"
			rel="stylesheet" type="text/css">
		<script charset="utf-8" src="js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="js/jQuery.md5.js"></script>
		<script type="text/javascript">
	$(function() {
		$('#yzm').click(function() {
			var phoneNumber = $('#phoneNumber').val();
			if (phoneNumber == '') {
				alert('请输入手机号')
			} else {
				$.post('sendCodeOrg.jspx', {
                    'phoneNumber' : phoneNumber
                }, function(data) {
                    if (data.code == '1002') {
                        alert('账号已存在 可以直接登陆');
                    } else if (data.code == '1001') {
                        alert('请不要重复发送验证码')
                    } else if (data.code == '1005') {
                        alert('请输入手机号')
                    } else if (data.code == '1000') {
                        alert('验证码已发送请查收');
                        $('#hiddenVerifyCode').val(data.verifyCode);
                        $('#hiddenNumber').val(phoneNumber);
                    }
                }, 'json');
			}
		});
	});
</script>
		<style type="text/css">
.alpha {
	
}
.main_input_box
{
text-align: left !important;
}
</style>
	</head>
	<body style="background-image: url('${pageContext.servletContext.contextPath }/images/bg.jpg');margin-top:0px;">
		<div>
			<table style="padding-left: 10%;">
				<tr>
				<td ><img style="padding-top: 6%; padding-left: 15%; width:50%; height:60%;" src="${pageContext.servletContext.contextPath }/images/logo0000.png"></td>
				<td align="left" style="padding-top: 6%;font-weight: bold;color: #FFFFFF;font-size:35px;">&nbsp;</td>
				</tr>
			</table>
		</div>
		<div id="loginbox" style="padding-top: 3%; width: 370px;">
			<form id="registerform" name="registerform" class="form-vertical"
				style="background-color: #FFFFFF;height: 380px;" >
				<div class="control-group normal_text">
				<table style="width: 100%">
					<tr><td class="main_input_box"><a href="orgLogin.jsp" id="to-recover">
						<input type="button" style="margin-left: 0px;color: #FFFFFF;background: #64CDBD;" value="返回" >
					</a></td>
						<td style="padding-left:80px;font-weight: bold;color: #FFFFFF;font-size:20px;">修改密码</td>
					</tr>
				</table>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;height: 20px;"><img
									src="${pageContext.servletContext.contextPath }/images/ph11.png"
									alt="手机号.."> </span><input type="text" placeholder="手机号" name="phoneNumber"
								value="" style="width: 200px;height: 38px; margin-bottom: 4px;border:1px solid #c0c0c0;"
								id="phoneNumber" /><input type="button" style="margin-bottom: 4px;background: #64CDBD;height: 38px;width:70px;
									font-size:10px;color: #FFFFFF;" value="发送验证码" id="yzm">
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;height: 20px;"><img
									src="${pageContext.servletContext.contextPath }/images/yzm00.png"
									alt="验证码"> </span><input type="text" placeholder="验证码" name="verifyCode"
								value="" style="width: 270px;height: 38px; margin-bottom: -3px;border:1px solid #c0c0c0;"
								id="verifyCode" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;height: 20px;"><img
									src="${pageContext.servletContext.contextPath }/images/pw11.png"
									alt="新密码"> </span><input type="password" placeholder="新密码" name="password"
								value="" style="width: 270px;height: 38px; margin-bottom: 4px;border:1px solid #c0c0c0;" id="password" />
						</div>
					</div>
				</div>
				<div class="main_input_box">
					<a href="javascript:checkUserForm()">
						<input type="button" style="margin-top: 10px;margin-left: 120px;background: #64CDBD;width: 120px;height: 40px;font-size:18px;color: #FFFFFF;" value="确定" >
					</a>
					&nbsp;&nbsp;
					<input type="hidden" id="hiddenVerifyCode">
				</div>
			</form>
			</div>
		<script type="text/javascript">
	function checkUserForm() {
		var verifyCode = $('#verifyCode').val();
		var hiddenVerifyCode = $('#hiddenVerifyCode').val();
		var password=$('#password').val();
		if (verifyCode == '') {
			alert('请输入验证码')
			return;
		}
		var phoneNumber = $('#phoneNumber').val();
		if (phoneNumber == '') {
			alert('请输入手机号')
			return;
		}
		if (verifyCode != hiddenVerifyCode) {
			alert('验证码错误')
			return;
		}
		if ($('#phoneNumber').val() == '') {
			alert('电话不能为空！')
			return;
		}
		if (password == '') {
			alert('密码不能为空！')
			return;
		}
		
        // 密码加密
        password = $.md5($('#password').val());
		$.post('updatePwdOrg.jspx',{'phoneNumber':phoneNumber,'password':password},function(data){
		if(data.code=='1000'){
			alert('修改成功');
			window.location.href='orgLogin.jsp'
		}
		},'json')
	}
</script>
	</body>
</html>