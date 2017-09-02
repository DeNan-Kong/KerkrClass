<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>更改信息</title>
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
		$('#ok').click(function(){
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
		});
	});
		
		
		</script>
		<style type="text/css">
		.col-sm-3
		{
		 line-height: 30px;
		}
		.line-dashed
		{
		border-style: none !important;
		}
		</style>
	</head>
	<body>
		<div class="form-group" style="width: 50%; margin-top: 50px;">
			<div class="col-sm-3">
				<label class="control-label">
					手机号
				</label>
			</div>
			<div class="col-sm-9">
				<input type="text" class="form-control checkacc" placeholder="输入手机号"
					name="phoneNumber" id="phoneNumber">
				
			</div>
		</div>
		<button  id="yzm" class="btn btn-success btn-s-xs">
					发送验证码
	   </button>
		<div class="line line-dashed line-lg pull-in" style="width: 50%;"></div>
		<div class="form-group" style="width: 50%;">
			<label class="col-sm-3 control-label">
				验证码
			</label>
			<div class="col-sm-9">
			<input type="text" class="form-control checkacc" placeholder="输入验证码"
					name="verifyCode" id="verifyCode">
			</div>
		</div>
		<div class="line line-dashed line-lg pull-in" style="width: 50%;"></div>
		<div class="form-group" style="width: 50%; margin-top: 50px;">
			<label class="col-sm-3 control-label" style="margin-top: 15px;">
				新密码
			</label>
			<div class="col-sm-9" style="color: red;margin-top: 15px;">
			<input type="password" class="form-control checkacc" placeholder="输入新密码"
					name="password" id="password">
			</div>
		</div>
		<div class="line line-dashed line-lg pull-in" style="width: 50%;"></div>
		<div class="form-group"
			style="width: 50%; margin-top: 100px; text-align: right;">
			<button type="submit" id="ok" class="btn btn-success btn-s-xs">
				保存
			</button>
		</div>
			<input type="hidden" id="hiddenVerifyCode">
	</body>
</html>