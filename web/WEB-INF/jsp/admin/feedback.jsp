<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>信息反馈</title>
  		<script
            src="${pageContext.request.contextPath}/js/feedback.js"
            type="text/javascript"></script> 
    </head>
    <body onload="createGridNopay()">	
    	<div style="margin-top:10px;margin-left: 50%;">
    		<span style="width: 332px;height: 40px;font-size:25px;color: #64CDBD;">课主任反馈</span>
    	</div>
<!--         <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 10px;">
            <input type="button" value="查询" class="btn btn-success btn-s-xs" id="nopay" onclick="createGridNopay();">
        </div> -->
        <form id="alipayment" action="batchTransManage.jspx" method="post" target="_blank">
	        <div class="col-md-6" style="height: 70%; width: 100%;">
	            <div id="teh_grid" style="height: 20%; width: 70%; float: center;"></div>
	        </div>
        </form>
    </body>
</html>