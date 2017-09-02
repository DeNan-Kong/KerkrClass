<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>批量付款</title>
        <script
            src="${pageContext.request.contextPath}/js/batchTrans/batchTrans.js"
            type="text/javascript"></script>
    </head>
    <body>
        <div class="col-md-6" style="height: 10px; width: 100%;">${message}</div>
        <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 10px;">
            <input type="button" value="未付款查询" class="btn btn-success btn-s-xs" id="nopay">
            <input type="button" value="付款中断查询" class="btn btn-success btn-s-xs" id="paying">
            <input type="button" value="付款结果查询" class="btn btn-success btn-s-xs" id="hadpay">
        </div>
        <div class="col-md-6" style="height: 20px; width: 100%;">
        </div>
        <form id="alipayment" action="batchTransManage.jspx" method="post" target="_blank">
	        <div class="col-md-6" style="height: 70%; width: 100%;">
	            <div id="teh_grid" style="height: 20%; width: 100%; float: left;"></div>
	        </div>
	        <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 10px;">
	            <input type="button" value="付款" class="btn btn-success btn-s-xs" id="paymoney" disabled="disabled">
	        </div>
	        <input id="batchNum" type="hidden" name="batchNum">
	        <input id="searchType" type="hidden" name="searchType">
        </form>
    </body>
</html>