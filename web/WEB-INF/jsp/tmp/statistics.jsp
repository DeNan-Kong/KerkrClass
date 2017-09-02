<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>我的统计</title>
	</head>
	<script src="${pageContext.request.contextPath}/echarts/echarts-all.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/statistics/statistics.js"
		type="text/javascript"></script>
	<body>
		<!--<div class="col-md-6" style="height: 100%; width: 100%">
			<section class="panel panel-danger portlet-item"
				style="height:100%;width:100%">
			<header class="panel-heading">
			<i class="fa fa-fire"></i> 实时监控
			</header>
			<div class="panel-body">
				<div id="main" style="height: 100%; width: 100%"></div>
			</div>
			</section>
		</div>
	-->
		<div class="col-md-6"
			style="height: 90%; width: 100%; margin-top: 50px;">
			<div id="main" style="height: 100%; width: 50%; float: left;"></div>
			<div id="main1" style="height: 100%; width: 50%; float: left;"></div>

		</div>
		<input type="hidden" id="userId" value="${userId}">
	</body>
</html>