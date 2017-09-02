<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bayan.keke.vo.KeTeaIncome"%>
<%@ page import="com.bayan.keke.util.DateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>提现</title>
        <%
        KeTeaIncome teaIncome = (KeTeaIncome)request.getSession().getAttribute("teaIncome");
        String totalIncome = teaIncome.getTotalIncome();
        String inputIncome = teaIncome.getInputIncome();
        String outputIncome = teaIncome.getOutputIncome();
        
        String userFlag = (String)request.getSession().getAttribute("userFlag");
        
        // 是否为提现日判断 1为提现日
        String isTixianDay = "0";
        // 登陆者为普通推广老师
        if("0".equals(userFlag)){
            
            //判断是否是周二或周五
            int week = DateUtil.getWeekOfCurrentDate();
            if(week == 5){
                isTixianDay = "1";
            }
        }else if("1".equals(userFlag)){
            
            // 机构判断是否为每月1号
            String systemDate = DateUtil.getCurrentDate(DateUtil.dateFormatYMD);
            if(systemDate.endsWith("01")){
                isTixianDay = "1";
            }
        }
        String hadTixian = (String)request.getSession().getAttribute("hadTixian");
        %>
        <script
            src="${pageContext.request.contextPath}/js/teaWithdraw/teaWithdraw.js"
            type="text/javascript"></script>
    </head>
    <body>
        <div style="padding-left: 50px;padding-right: 50px;">
            <div class="col-md-6" style="position:relative; height: 30%; width: 23%; margin-top: 20px;float: left;" align="center">
                <img alt="" src="images/tixian/zongshouru.png" height="120px" width="220px">
                <div style="margin-top:-55px;font-weight: 500;font-size:30px;color: #858585;"><%=totalIncome %></div>
            </div>
            <div class="col-md-6" style="height: 30%; width: 23%; margin-top: 20px;float: left;" align="center">
                <img alt="" src="images/tixian/yitixian.png" height="120px" width="220px"">
                <div style="margin-top:-55px;font-weight: 500;font-size:30px;color: #858585;"><%=outputIncome %></div>
            </div>
            <div class="col-md-6" style="height: 30%; width: 23%; margin-top: 20px;float: left;" align="center">
                <img alt="" src="images/tixian/ketixian.png" height="120px" width="220px"">
                <div style="margin-top:-55px;font-weight: 500;font-size:30px;color: #858585;"><%=inputIncome %></div>
            </div>
            <div class="col-md-6" style="baheight: 45%; width: 100%; margin-top: 0px;margin-bottom:20px;">
                <img alt="" src="images/tixian/line.png" height="2px" width="100%"">
            </div>
            <div class="col-md-6" style="height: 10%; width: 100%;">
                <input type="button" value="提现" class="btn btn-success btn-s-xs" id="tixianBtn" 
                        style="margin-top:-4px;width:220px;height:45px;">
            </div>
            <div class="col-md-6" style="height: 10%; width: 100%; margin-top: 15px;">
                <img alt="" src="images/tixian/tips.png" height="15px" width="12px" style="float: left;">
                <%if("0".equals(userFlag)){ %>
                    <p>&nbsp;&nbsp;&nbsp;提示：您的SID被成功使用1次，即可获得学生当次充值金额的10%作为回报。每周五可将收入提现到您的个人支付宝。</p>
                <%} %>
                <%if("1".equals(userFlag)){ %>
                    <p>&nbsp;&nbsp;&nbsp;提示：推广编码被成功使用1次，即可获得家长当次充值金额的10%作为提成。每月1号可将收入提现到您的公司账户。</p>
                    <p style="padding-left:60px;">每次提现支付宝官方将收取0.5%的手续费，最低1元，最高25元。</p>
                <%} %>
            </div>
            <input type="hidden" value="<%=outputIncome%>" id="ketixianId">
            <input type="hidden" id="tixianMoney">
            <input type="hidden" value="<%=isTixianDay%>" id="tixianDay">
            <input type="hidden" value="<%=hadTixian%>" id="hadTixian">
            <input type="hidden" value="${userFlag}" id="userFlag">
        </div>
    </body>
</html>