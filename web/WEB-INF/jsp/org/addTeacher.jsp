<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>机构信息</title>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/org/addTeacher.js"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jQuery.md5.js"></script>
	</head>
	<body>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<font style="width:100px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">手机号:</font>
			<input type="text" id="teaPhone" name="teaPhone" style="height: 40px;width: 30%; margin-bottom: 2px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			    <font style="width:100px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">老师姓名:</font>
			    <input type="text" id="teaName" name="teaName" style="height: 40px;width: 30%; margin-bottom: 2px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<font style="width:100px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">批改科目:</font>
			<div class="main_input_box">
	            <select name="teaSubject"
	                style="width: 30%;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;"
	                id="teaSubject">
	                <option value="01">语文</option>
	                <option value="02">数学</option>
	                <option value="03">英语</option>
	            </select>
            </div>
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<font style="width:100px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">批改年级:</font>
            <div class="main_input_box">
                <select name="teaGrade"
                    style="height: 40px; width: 30%; margin-bottom: 0px;"
                    id="teaGrade">
                    <option value="01">一年级</option>
                    <option value="02">二年级</option>
                    <option value="03">三年级</option>
                    <option value="04">四年级</option>
                    <option value="05">五年级</option>
                    <option value="06">六年级</option>
                </select>
            </div>
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<font style="width:100px; height:40px; font-size:20px;font-weight:bold; float:left; margin-top:3px;">初始密码:</font>
			<input type="text" id="password" name="password" style="height: 40px;width: 30%; margin-bottom: 2px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div class="main_input_box" style="margin-left: 150px;">
			<input  type="button" id="addBtn" style="margin-top:30px;margin-left: 0px;background: #64CDBD;width: 30%;height: 40px;font-size:18px;color: #FFFFFF;border-width:0;" value="添加">
		</div>
	</body>
</html>