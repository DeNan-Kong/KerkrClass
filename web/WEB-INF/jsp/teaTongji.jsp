<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>统计</title>
        <%
        Map<String,Object> sidInfo = (Map<String,Object>)request.getSession().getAttribute("teaSidInfo");
        String sid = sidInfo.get("sid").toString();//SID
        String countPay = sidInfo.get("countPay").toString(); //使用次数
        String phoneNumber = sidInfo.get("phoneNumber").toString();// 手机号
        String status = sidInfo.get("status").toString(); // 状态
        String discountAmount = sidInfo.get("discountAmount").toString();// 优惠金额
        %>
        <script
            src="${pageContext.request.contextPath}/js/teaTongji/teaTongji.js"
            type="text/javascript"></script>
    </head>
    <body>
        <div class="col-md-6" style="height: 15%; width: 100%; margin-top: 5%;margin-left:10px;" align="center">
            <!-- <img alt="${countPay}" src="images/circle.png" height="120px" width="120px">  -->
            <font style="font-weight: 200;font-size:60px;color: #58CFCB;margin-left:-60px;"><%=countPay%></font>
            <font style="font-weight: 800;font-size:20px;color: #58CFCB;">次</font>
            <br/><br/>
            <!-- <font style="font-weight: 800;font-size:10px;margin-left:-10px; color: #58CFCB;">您的SID累计使用量</font> -->
        </div>
        <div class="col-md-6"  align="center"
            style="height: 2%; width: 100%; margin-top: 6%;">
            <font style="font-weight: 900;font-size:20px;color: #58CFCB;">SID:</font>&nbsp;&nbsp;
            <input type="text" value="<%=sid%>" style="height:33px;" id="sid" readonly="readonly">&nbsp;
            <input type="hidden" value="<%=phoneNumber%>" id="phoneNumber"/>
            <input type="button" value="发送到手机" class="btn btn-success btn-s-xs" id="sendBtn" 
                    style="margin-top:-4px;border-width:0;">
        </div>
        <div class="col-md-6" align="center" style="height: 10%; width: 100%; margin-top: 3%; ">
            <p>家长用户通过使用您的SID注册并成功付款，即为被使用1次</p>
            <p style="font-weight: 800;font-size:10px;color: #FF7A6D;">赶快分享给身边最有号召力的朋友，SID被使用的次数越多，收入就会更多喔</p>
            <p></p>
        </div>
    </body>
</html>