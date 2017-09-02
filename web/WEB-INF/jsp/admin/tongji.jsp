<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>我的统计</title>
		<%
			String str = request.getSession().getAttribute("tongji").toString();
		%>
		<script type="text/javascript">
		    var json =<%=str%>
        </script>
		<script
			src="${pageContext.request.contextPath}/echarts/echarts-all.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/js/statistics/tongji.js"
			type="text/javascript"></script>
	</head>
	<body>
		<div class="col-md-6"
			style="height: 30%; width: 100%; margin-top: 5px;">
			<div id="main" style="height: 100%; width: 50%; float: left;"></div>
			<div id="main1" style="height: 100%; width: 50%; float: left;"></div>
		</div>
		<div class="col-md-6" style="height: 5%; width: 900px; margin-top: 0px;">
			类型：
			<select style="width: 150px;border: 1px solid #cccccc;height: 30px;" name="type" id="type">
				<!-- <option value="">
					==请选择==
				</option> -->
				<option value="0" selected="selected">
					学生
				</option>
				<option value="1">
					老师
				</option>
				<option value="2">
					经纪人
				</option>
			</select>
			<input type="button" value="查询" class="btn btn-success btn-s-xs" id="go">
		</div>
		<div class="col-md-6" style="height: 60%; width: 100%; margin-top:10px;">
			<div id="teh_grid"
				style="height: 20%; width: 100%; float: left;"></div>
		</div>
	</body>
</html>