<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>注册详情</title>
		<%
        String teacherId = request.getSession().getAttribute("userId").toString();
        %>
		<script
			src="${pageContext.request.contextPath}/js/sidUserInfo/sidUserInfo.js"
			type="text/javascript"></script>
	</head>
	<body>
	    <div class="col-md-6"
			style="height: 5%; width: 100%;margin-top: 10px;">
			开始时间：<input type="text" id="startDate" class="Wdate" style="width: 180px;height: 30px;"/> 
			结束时间：<input type="text" id="endDate"  class="Wdate" style="width: 180px;height: 30px;"/> 
				<input type="button" value="查询" class="btn btn-success btn-s-xs"
								id="go" style="height: 30px;margin-top: -3px; text-align:center;">
		</div>
        <div class="col-md-6" style="height: 68%; width: 100%; margin-top:10px;">
            <div id="teh_grid_sid" style="height: 20%; width: 100%; float: left;"></div>
        </div>
        <input type="hidden" id="teacherId" value="<%=teacherId %>" />
	</body>
</html>