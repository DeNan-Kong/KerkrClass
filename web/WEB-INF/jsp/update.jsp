<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>更改信息</title>
		<script type="text/javascript" src="./js/work/update.js"></script>
	</head>
	<body>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
				<div style="background:#c0c0c0;margin-top: 0px;text-align:center;width:40px;height: 40px;float:left;">
					<img style="margin-top: 5px;" src="${pageContext.servletContext.contextPath }/images/subject1.png"> 
				</div>
				<select style="width: 295px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;" name="subjectType" id="subjectType"></select>
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<div style="background:#c0c0c0;margin-top: 0px;text-align:center;width:40px;height: 40px;float:left;">
					<img style="margin-top: 5px;" src="${pageContext.servletContext.contextPath }/images/location1.png"> 
			</div>
				<select style="width: 140px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;" name="province" id="province"></select>
				<select style="margin-left: 10px;width: 140px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;" name="city" id="city"></select>
			</div>
		</div>
		<div style="margin-left: 150px; margin-top: 40px;">
			<div style="display:inline">
			<div style="background:#c0c0c0;margin-top: 0px;text-align:center;width:40px;height: 40px;float:left;">
					<img style="margin-top: 5px;" src="${pageContext.servletContext.contextPath }/images/grade1.png"> 
			</div>
				<select style="width: 292px;height: 40px; margin-bottom: 0px;border:1px solid #c0c0c0;" name="grade" id="grade"></select>
			</div>
		</div>
		<div class="main_input_box">
			<input  type="submit" id="ok" style="margin-top:30px;margin-left: 150px;background: #64CDBD;width: 332px;height: 40px;font-size:18px;color: #FFFFFF;border-width:0;" value="保存">
		</div>
		<input type="hidden" id="hid_grade" value="${grade}">
		<input type="hidden" id="hid_province" value="${provinceCode}">
		<input type="hidden" id="hid_city" value="${cityCode}">
		<input type="hidden" id="hid_subjectType" value="${subjectType}">
		<input type="hidden" id="hid_userId" value="${userId}">
	</body>
</html>