<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>日均增长</title>
		<script
			src="${pageContext.request.contextPath}/echarts/echarts-all.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/js/statistics/dataadd.js"
			type="text/javascript"></script>
	</head>
	<body>
	    <div class="col-md-6"
			style="height: 5%; width: 100%;margin-top: 10px;">
			开始时间：<input type="text" id="startDate" class="Wdate" style="width: 180px;height: 30px;"/> 
			结束时间：<input type="text" id="endDate"  class="Wdate" style="width: 180px;height: 30px;"/> 
				<input type="button" value="查询" class="btn btn-success btn-s-xs"
								id="go">
		</div>
		<div class="col-md-6"
			style="height: 90%; width: 100%; margin-top:20px;">
			<div id="main" style="height: 100%; width: 100%; float: left;"></div>
		</div>
	</body>
</html>