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
		<title>注册</title>
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
                $.post('sendCodeSSales.jspx', {
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
                }, 'json')
            }
        });
             
        $.post('listProvinceSales.jspx',{'':''},function(data){
            if (data != null) {
                $('#province').empty();
                var ops = '<option value="-1" selected="selected">请选择</option>';
                for ( var i = 0; i < data.length; i++) {
                    ops += '<option value="' + data[i+1] + '">'
                            + data[i] + '</option>';
                    i++;
                }
                $('#province').append(ops);
            }
        },'json');

         $('#province').change(function(){
            var cityCode=$(this).val();
            $.post('listCitySales.jspx',{'cityCode':cityCode},function(data){
                if (data != null) {
                    $('#city').empty();
                    var ops = '';
                    for ( var i = 0; i < data.length; i++) {
                        ops += '<option value="' + data[i+1] + '">'
                                + data[i] + '</option>';
                        i++;    
                    }
                    $('#city').append(ops);
                }
            },'json');
        }) 
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
		<div id="loginbox" style="padding-top: 3%;width:355px;" >
			<form id="registerform" name="registerform" class="form-vertical"
				style="background-color: #FFFFFF;height: 450px;" 
				action="${pageContext.servletContext.contextPath }/addSales.jspx"
				method="post">
				<div class="control-group normal_text">
				<table style="width: 100%">
					<tr>
					<td class="main_input_box"><a href="login.jsp" id="to-recover">
						<input type="button" style="margin-left: 0px;color: #FFFFFF;background: #64CDBD;" value="返回" >
					</a></td>
						<td style="padding-left:48px;font-weight: bold;color: #FFFFFF;font-size:20px;">注册课课经纪人</td>
					</tr>
				</table>
				</div>
				<table>
				<tr>
				<td style="padding-top: 4%;padding-left:15px;width:400px;">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;height: 23px;width: 20px;"><img
									src="${pageContext.servletContext.contextPath }/images/ph11.png"
									alt="手机号.."></span><input type="text" placeholder="手机号" name="phoneNumber"
								value="" style="width: 175px;height: 41px; margin-bottom: 0px;border:1px solid #c0c0c0;"
								id="phoneNumber" /><input type="button" style="margin-bottom: 0px;background: #64CDBD;height: 41px;width:70px;
								font-size:10px;color: #FFFFFF;" value="发送验证码" id="yzm">
						</div>
					</div>
					<br>
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;height: 24px;width: 20px;"><img
									src="${pageContext.servletContext.contextPath }/images/code1.png"
									alt="验证码"></span><input type="text" placeholder="验证码" name="verifyCode"
								value="" style="width: 245px;height: 42px; margin-bottom: -6px;border:1px solid #c0c0c0;"
								id="verifyCode" />
						</div>
					</div>
					<br>
					<!-- </td>
					<td style="padding-top: 4%;width:400px;"> -->
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;"><img
									src="${pageContext.servletContext.contextPath }/images/name1.png"
									alt="姓名.."> </span><input type="text" placeholder="姓名" name="userName"
								style="width: 245px;height: 41px; margin-bottom: 0px;border:1px solid #c0c0c0;" id="userName" />
						</div>
					</div>
					<br>
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;height: 24px;"><img
									src="${pageContext.servletContext.contextPath }/images/pw11.png"
									alt="密码.."> </span><input type="password" placeholder="密码" name="password"
								value="" style="width: 245px;height: 42px; margin-bottom: 0px;border:1px solid #c0c0c0;" id="password" />
						</div>
					</div>
					</td>
					<!-- </td>
					<td style="margin-top: 1%;width:350px;">
					<div class="control-group">
						<div class="controls">
							<div class="main_input_box">
								<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;"><img
										src="${pageContext.servletContext.contextPath }/images/subject1.png"
										alt="请选择教学科目"> </span>
								<select name="subjectType"
									style="width: 245px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;"
									id="subjectType">
									<option value="01">
										语文
									</option>
									<option value="02">
										数学
									</option>
									<option value="03">
										英语
									</option>
								</select>
							</div>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<div class="main_input_box">
								<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;height: 25px;"><img
										src="${pageContext.servletContext.contextPath }/images/location1.png"
										alt="请选择所在地"> </span>
								<select id="province" name="provinceCode"
									style="height: 40px; width: 115px; margin-bottom: 0px;">
								</select>
								<select id="city" name="cityCode"
									style="height: 40px; width: 115px; margin-bottom: 0px;">
								</select>
							</div>
						</div>
					</div>

					<div class="control-group">
						<div class="controls">
							<div class="main_input_box">
								<span class="add-on bg_ly" style="background: #c0c0c0;text-align:center;width: 20px;height: 22px;"><img
										src="${pageContext.servletContext.contextPath }/images/grade1.png"
										alt="请选择年级"> </span>
								<select name="grade"
									style="height: 40px; width: 245px; margin-bottom: 0px;"
									id="grade">
									<option value="01">
										一年级
									</option>
									<option value="02">
										二年级
									</option>
									<option value="03">
										三年级
									</option>
									<option value="04">
										四年级
									</option>
									<option value="05">
										五年级
									</option>
									<option value="06">
										六年级
									</option>
								</select>
							</div>
						</div>
					</div>  -->
					
					</tr>
				</table>
					<div class="control-group">
						<div class="controls">
							<div class="main_input_box" style="margin-left: 23px;">
								<input type="checkbox" id="ck" checked  style="background: #c0c0c0;text-align:center;width: 15px;height: 15px;"><a href="rule.html" target="_black" style="height: 40px; width: 200px; margin-bottom: 0px; font-size:15px;">我已阅读并接受《课课用户使用协议》</a>
								<input type="hidden" id="hiddenVerifyCode">
							</div>
						</div>
					</div>
				<div  class="main_input_box">									
					<a href="javascript:checkUserForm()">
						<input type="button" style="margin-top: 10px;margin-left: 26px;background: #64CDBD;width: 300px;height: 40px;font-size:18px;color: #FFFFFF;" value="注册" >
					</a>
				</div>
			</form>
		</div>
		<script type="text/javascript">
	function checkUserForm() {
		var verifyCode = $('#verifyCode').val();
		var hiddenVerifyCode = $('#hiddenVerifyCode').val();
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

		if ($('#userName').val() == '') {
			alert('名字不能为空！')
			return;
		}
		if ($('#phoneNumber').val() == '') {
			alert('手机号不能为空！')
			return;
		}
		if ($('#password').val() == '') {
			alert('密码不能为空！')
			return;
		}
		/* if ($('#subjectType').val() == '') {
			alert('科目不能为空！')
			return;
		}
		if ($('#province').val() == '') {
			alert('所在地不能为空！')
			return;
		}
		if ($('#grade').val() == '') {
			alert('年级不能为空！')
			return;
		} */
        if($('#ck').is(':checked')){
            var pwd = $.md5($('#password').val());
            $('#password').val(pwd);
        	document.registerform.submit();
	    }else{
	    	alert('请同意准则！')
		 }
		
	}
</script>
	</body>
</html>