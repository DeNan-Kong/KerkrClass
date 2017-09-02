<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>更改信息</title>
		<script type="text/javascript" src="js/jQuery.md5.js"></script>
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
	                        alert('账号已存在 可以直接登陆');
	                    } else if (data.code == '1001') {
	                        alert('发送失败')
	                    } else if (data.code == '1005') {
	                        alert('输入参数为空或不正确')
	                    } else if (data.code == '1000') {
	                        alert('验证码已发送请查收');
	                        $('#hiddenVerifyCode').val(data.verifyCode);
	                        $('#hiddenNumber').val(phoneNumber);
	                    }
	                }, 'json');
	            }
	        });
		$('#ok').click(function(){
			var verifyCode = $('#verifyCode').val();
		var hiddenVerifyCode = $('#hiddenVerifyCode').val();
		var password=$('#password').val();
		var phoneNumber = $('#phoneNumber').val();
		if (phoneNumber == '') {
			alert('请输入手机号')
			return;
		}
		if (verifyCode == '') {
			alert('请输入验证码')
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
        $.post('updatePWSales.jspx',{'phoneNumber':phoneNumber,'password':password},function(data){
            if(data.code=='1000'){
            alert('修改成功');
            $('#ok').attr("disabled","true");
            $('#ok').css("background-color","#DDDDDD");
            }
            },'json');
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
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
				<div style="background:#c0c0c0;margin-top: 0px;text-align:center;width:40px;height: 40px;float:left;">
					<img style="margin-top: 5px;width:27px;" src="${pageContext.servletContext.contextPath }/images/phone1.png">
				</div>
					<input type="text" placeholder="&nbsp;&nbsp;手机号" name="phoneNumber"
							value="" style="width: 200px;height: 41px; margin-bottom: 0px;border:1px solid #c0c0c0;" 
							id="phoneNumber" />
							<input type="button" style="background: #64CDBD;height: 41px;width:92px;
							font-size:10px;color: #FFFFFF;border-width:0;" value="发送验证码" id="yzm">
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
				<div style="background:#c0c0c0;margin-top: 0px;text-align:center;width:40px;height: 40px;float:left;">
					<img style="margin-top: 5px;width:29px;" src="${pageContext.servletContext.contextPath }/images/code1.png">
				</div><input type="text" placeholder="&nbsp;&nbsp;验证码" name="verifyCode" id="verifyCode"
						value="" style="width: 293px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
				<div style="background:#c0c0c0;margin-top: 0px;text-align:center;width:40px;height: 40px;float:left;">
					<img style="margin-top: 5px;width:22px;" src="${pageContext.servletContext.contextPath }/images/password1.png">
				</div>
					<input type="password" style="width: 293px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;" placeholder="&nbsp;&nbsp;新密码"
					name="password" id="password">
			</div>
		</div>
		<div >
			<input type="submit" id="ok" style="margin-top:30px;margin-left: 150px;background: #64CDBD;width: 332px;height: 40px;font-size:18px;color: #FFFFFF;border-width:0;" value="保存">
		</div>
			<input type="hidden" id="hiddenVerifyCode">
	</body>
</html>