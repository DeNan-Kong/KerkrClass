<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>信息反馈</title>
		<script
			src="${pageContext.request.contextPath}/js/statistics/feedback.js"
			type="text/javascript"></script>
		<style type="text/css">
.panel-body {
	height: 600px !important;
}
</style>
	</head>
	<body>
		<div id="grid" style="height: 900px;"></div>
	</body>
</html>