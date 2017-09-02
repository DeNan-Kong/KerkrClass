<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.bayan.keke.vo.KeTeaIncome"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>提现</title>
        <%
        String teacherId = request.getSession().getAttribute("userId").toString();
        KeTeaIncome teaIncome = (KeTeaIncome)request.getSession().getAttribute("teaIncome");
        String totalIncome = teaIncome.getTotalIncome();
        String inputIncome = teaIncome.getInputIncome();
        String outputIncome = teaIncome.getOutputIncome();
        %>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript">
        $(function() {
	        $('#tixianBtn').click(function(){
	            var moneyValue=$('#moneyId').val();
	            var inputIncome=<%=inputIncome%>
	            if(moneyValue){
	            	$('#msg2').css("display","none");
	            	$('#msg3').css("display","none");
	            	if(moneyValue > inputIncome){
	            	    $('#msg1').css("display","block");
	            		$('#msg2').css("display","none");
	            		$('#msg3').css("display","none");
	            	}else if(moneyValue < 1){
	            		$('#msg1').css("display","none");
                        $('#msg2').css("display","none");
	            		$('#msg3').css("display","block");
	            	}
	            	else{
	            		parent.$('#tixianMoney').val(moneyValue);
	            		
	            	     //iframe层-父子操作
	                    parent.layer.open({
	                      title:'提现',
	                      type: 2,
	                      area: ['300px', '330px'],
	                      fix: false, //不固定
	                      maxmin: true,
	                      content: 'toAccountInfoManage.jspx'
	                    });
	            	    
	                    var index = parent.layer.getFrameIndex(window.name);
	                    parent.layer.close(index);
	            	}
	            }else{
	                  $('#msg1').css("display","none");
	                  $('#msg2').css("display","block");
	                  $('#msg3').css("display","none");
	                  return;
	            }
	        });
        });
        </script>

    </head>
    <body>
        <div>
	        <div align="center" style="margin-top:10px;">
	           <input type="text" id="moneyId" style="height:33px;width:200px;"/>
	            <p id="msg1" style="display:none;color: red;font-size: 10px;">您输入的金额超出了可提现余额</p>
	            <p id="msg2" style="display:block;color: red;font-size: 10px;">请输入提现金额</p>
	            <p id="msg3" style="display:none;color: red;font-size: 10px;">每次提现金额不能少于1元哦</p>
	        </div>
	        <div class="col-md-6" style="height: 10%; width: 100%; margin-top:100px;" align="center">
	            <input type="button" value="下一步" id="tixianBtn" class="btn btn-success btn-s-xs"
	                    style="background-color:#58cfcb;width:200px;height:38px;cursor: pointer;color: white;">
	        </div>
        </div>
    </body>
</html>