<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>提现账号</title>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jQuery.md5.js"></script>
        <script type="text/javascript">
        $(function() {
        	$('#alipayId').val("");
            $('#alipayNameId').val("");
            $('#passwordId').val("");
            var teacherId=$('#teacherId').val();
            $('#quedingBtn').click(function(){
                var outputMoney = parent.$('#tixianMoney').val();
                var alipayAccount = $('#alipayId').val();
                var alipayName = $('#alipayNameId').val();
                var loginPwd = $.md5($('#passwordId').val());
                
                // 输入验证
                if(!alipayAccount){
                	$('#msg1').css("display","block");
                	return;
                }
                $('#msg1').css("display","none");
                if(!alipayName){
                	$('#msg2').css("display","block");
                	return;
                }
                $('#msg2').css("display","none");
                if(!loginPwd){
                	$('#msg3').css("display","block");
                	return;
                }

                // 用户标记
                var userFlag = $('#userFlag').val();
                $.post('withdrawCashManage.jspx',
                	{'teacherId':teacherId,
                	'outputMoney':outputMoney,
                	'toAccount':alipayAccount,
                	'toName':alipayName,
                	'password':loginPwd,
                	'userFlag':userFlag},
                function(data){
                    if(data.code=="1000"){
                    	
                        //iframe层-父子操作
                        parent.layer.open({
                          title:'申请成功',
                          type: 2,
                          area: ['300px', '330px'],
                          fix: false, //不固定
                          maxmin: true,
                          content: 'toTixianOkManage.jspx'
                        });
                        
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    }else{
                    	alert(data.message);
                    }
                },'json');
            });
        });
        </script>
    </head>
    <body>
        <div>
	        <div align="center" style="margin-top:10px;">
	           <div>
		           <input type="text" name="" id="alipayId" value="" style="height:30px;width:200px;margin-bottom:5px;" placeholder="支付宝账号"/>
		           <div id="msg1" style="display:none;color: red;font-size: 10px;margin-left:45px;" align="left">请输入支付宝账号</div>
	           </div>
	           <div>
		           <input type="text" name="" id="alipayNameId" value="" style="height:30px;width:200px;margin-bottom:5px;" placeholder="支付宝姓名"/>
		           <div id="msg2" style="display:none;color: red;font-size: 10px;margin-left:45px;" align="left">请输入支付宝姓名</div>
	           </div>
	           <div>
		           <input type="password" name="" id="passwordId" value="" style="height:30px;width:200px;margin-bottom:5px;" placeholder="课课登录密码"/>
		           <div id="msg3" style="display:none;color: red;font-size: 10px;margin-left:45px;" align="left">请输入课课登录密码</div>
	           </div>
	        </div>
	        <div class="col-md-6" style="height: 10%; width: 100%; margin-top:10px;" align="center">
	            <input type="button" value="确定" id="quedingBtn" class="btn btn-success btn-s-xs"
	                    style="background-color:#58cfcb;width:200px;height:38px;cursor: pointer;color: white;">
	            <input type="hidden" id="teacherId" name="teacherId" value="${userId}">
	            <input type="hidden" id="userFlag" name="userFlag" value="${userFlag}">
	        </div>
        </div>
    </body>
</html>