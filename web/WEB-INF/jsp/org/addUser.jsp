<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>明细</title>
        <script
            src="${pageContext.request.contextPath}/js/org/addUser.js"
            type="text/javascript"></script>
    </head>
    <body>
        <div id="sidDiv">
            <div class="col-md-6" style="height: 50px; width: 100%;margin-top:25px;" align="center">
               业务员：<input type="text" value="" name="userName" id="userName" style="height:32px;">&nbsp;&nbsp;&nbsp;&nbsp;
                手机号：<input type="text" value="" name="phoneNumber" id="phoneNumber" style="height:32px;">
                &nbsp;&nbsp;<input type="button" value="添加" class="btn btn-success btn-s-xs" id="createSidBtn" 
                    style="background-color:#FF8888;margin-top:-4px;border-width:0;">
            </div>
            <div style="height:1px; width:100%; background:#00CCFF; overflow:hidden;"></div>
            <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 10px;">
                <input type="button" value="刷新" class="btn btn-success btn-s-xs" id="searchSid">
                <font id="useCount" style="float:right;font-weight: bold;font-size:16px;margin-top:10px;"></font>
            </div>
            <div class="col-md-6" style="height: 68%; width: 100%; margin-top:10px;">
                <div id="teh_grid_sid" style="height: 20%; width: 100%; float: left;"></div>
            </div>
            <input type="hidden" id="orgId" name="orgId" value="${userId}">
            <input type="hidden" id="orgPhoneNumber" name="orgPhoneNumber" value="${orgPhoneNum}">
        </div>
    </body>
</html>