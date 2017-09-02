<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>加油站</title>
		<script type="text/javascript" src="./js/addOil/addOil.js"></script>
	</head>
	<body>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<font style="width:160px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">手机号/三方ID:</font>
			<input type="text" id="phoneNumber" name="phoneNumber" style="height: 40px;width: 30%; margin-bottom: 2px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			    <font style="width:160px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">油量:</font>
			    <input type="text" id="oil" name="oil" style="height: 40px;width: 30%; margin-bottom: 2px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			    <font style="width:160px; height:40px; font-size:20px;font-weight:bold; float:left;margin-top:3px;">说明:</font>
			    <input type="text" id="comment" name="comment" style="height: 40px;width: 30%; margin-bottom: 2px;border:1px solid #c0c0c0;">
			</div>
		</div>
		<div class="main_input_box">
			<input  type="button" id="addBtn" style="margin-top:30px;margin-left: 0px;background: #64CDBD;width: 300;height: 40px;font-size:18px;color: #FFFFFF;border-width:0;" value="加油">
		</div>
	</body>
</html>