<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>欢迎页面</title>
	</head>
	<script type="text/javascript">
	$(function(){
	    $('#ok').click(function(){
	    var userId='<%=request.getParameter("userId")%>';
	    var subjectType='<%=request.getSession().getAttribute("subjectType")%>';
	    $.post('addTask.jspx',{'userId':userId,'subjectType':subjectType},function(data){
	    if(data){
	       alert(data.msg);
	    }
	   },'json')
	  
	    });

	});
	</script>
	<body>
		<input type="button" value="接单" id="ok">
	</body>
</html>