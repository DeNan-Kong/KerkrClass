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
		<title>修改密码-课课工作台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"
			href="${pageContext.servletContext.contextPath }/css/min.css">
		<link rel="stylesheet"
			href="${pageContext.servletContext.contextPath }/css/login.css">
		<link href="${pageContext.servletContext.contextPath }/css/css.css"
			rel="stylesheet" type="text/css">
		<script charset="utf-8" src="js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">
	$(function() {
		$('#yzm').click(function() {
			var phoneNumber = $('#phoneNumber').val();
			if (phoneNumber == '') {
				alert('请输入手机号')
			} else {
				$.post('acodeUser.jspx', {
					'phoneNumber' : phoneNumber
				}, function(data) {
					if (data.code == '1002') {
						alert('账号不存在,请注册');
					} else if (data.code == '1001') {
						alert('发送失败')
					} else if (data.code == '1000') {
						alert('验证码已发送请查收');
						$('#hiddenVerifyCode').val(data.verifyCode);
						$('#hiddenNumber').val(phoneNumber);
					}
				}, 'json')
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
	<body
		style="background-image: url('${pageContext.servletContext.contextPath }/images/91.png');margin-top:0px;">
		<div id="loginbox" style="padding-top: 10%;">
			<form id="registerform" name="registerform" class="form-vertical"
				style="background-color: rgba(0, 0, 0, 0.5) !important; background: #000; filter: alpha(opacity =                                   50); * background: #000; * filter: alpha(opacity =                                   50); /*黑色透明背景结束*/ color: #FFF; bottom: 0px; right: 0px; border: 1px solid #000;"
			    >
				<div class="control-group normal_text">
					<table style="width: 100%">
						<tr>
							<td align="left">
								
							</td>
							<td align="center" style="font-weight: bold; color: gray;">
								课课工作台
							</td>
							<td align="right">
							</td>
						</tr>
					</table>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #28b779;text-align:center;"><img
									src="${pageContext.servletContext.contextPath }/images/phone.png"
									alt="请输入手机号.."> </span>
							<input type="text" placeholder="请输入手机号" name="phoneNumber"
								value="" style="height: 32px; margin-bottom: 0px;width: 200px;"
								id="phoneNumber" />
								<span class="pull-left" style="width: 33%; float:right"><a type="submit"
						id="yzm" class="btn btn-success">发送验证码</a></span>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #28b779;text-align:center;"><img
									src="${pageContext.servletContext.contextPath }/images/code.png"
									alt="请输入验证码"> </span>
							<input type="text" placeholder="请输入验证码" name="verifyCode"
								value="" style="height: 32px; margin-bottom: 0px;width: 200px;"
								id="verifyCode" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #28b779;text-align:center;"><img
									src="${pageContext.servletContext.contextPath }/images/password.png"
									alt="请输入新密码.."> </span>
							<input type="password" placeholder="请输入新密码.." name="password"
								value="" style="height: 32px; margin-bottom: 0px;width: 200px;" id="password" />
						</div>
					</div>
				</div>
				<div class="form-actions">
					<span class="pull-left" style="width: 33%"><a
						href="login.jsp" class="flip-link btn btn-info" id="to-recover">返&nbsp;&nbsp;回</a>
					</span>
					<span class="pull-right" style="float: inherit;margin-left: 56px;"><a type="submit"
						href="javascript:checkUserForm()" class="btn btn-success">确&nbsp;&nbsp;定</a>
					</span>
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
		$.post('forgerPasswordUser.jspx',{'phoneNumber':phoneNumber,'password':password},function(data){
		if(data.code=='1000'){
		alert('修改成功');
		window.location.href='login.jsp'
		}
		},'json')
	}
</script>
	</body>
</html>