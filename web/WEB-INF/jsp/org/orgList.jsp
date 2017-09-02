<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>机构详情</title>
		<script
			src="${pageContext.request.contextPath}/js/org/orgList.js"
			type="text/javascript"></script>
	</head>
	<body>
	    <div class="col-md-6" style="height: 2%; width: 100%; margin-top: 5px;">
        </div>
        <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 10px;">机构：
            <select style="width: 300px;border: 1px solid #cccccc;height: 35px;margin-right:10px;" name="type" id="selOrgId">
            </select>
            类型：<select style="width: 100px;border: 1px solid #cccccc;height: 35px;margin-right:10px;" name="type" id="type">
                    <option value="0">学生</option>
                    <option value="1">老师</option>
            </select>
            <input type="button" value="查询" class="btn btn-success btn-s-xs" id="go" style="margin-bottom:2px;">
        </div>
        <div class="col-md-6" style="height: 80%; width: 100%; margin-top:10px;">
            <div id="teh_grid"
                style="height: 20%; width: 100%; float: left;"></div>
        </div>
	</body>
</html>