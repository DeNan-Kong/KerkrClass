<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>申请成功</title>
        <script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript">
        $(function() {
            $('#overBtn').click(function(){
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
        });
        </script>

    </head>
    <body>
        <div>
	        <div align="center" style="margin-top:10px;">
	           <div align="center">
	           		<p>恭喜您</p>
		           <div id="msg1" style="font-weight: 200; font-size: 10px;height:60px;color: #858585; " align="center">您申请的提现金额预计5个工作日内到账，请耐心等候!</div>
	           </div>
	        </div>
	        <div class="col-md-6" style="height: 10%; width: 100%; margin-top:10px;" align="center">
	            <input type="button" value="完成" id="overBtn" class="btn btn-success btn-s-xs"
	                    style="background-color:#58cfcb;width:200px;height:38px;cursor: pointer;color: white;">
	        </div>
        </div>
    </body>
</html>