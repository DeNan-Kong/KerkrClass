<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>未完成</title>
        <link rel="stylesheet" href="./css/go.css" type="text/css">
        <script type="text/javascript" src="/js/certification/certification.js"></script>
        <script type="text/javascript">
		    function checkUserForm(teacherId,approveStatus) {
		        $.post('updateApprvStatusManage.jspx',{'teacherId':teacherId,'approveStatus':approveStatus},function(data){
		        if(data.code=='1000'){
		        	alert('审批成功');
		        	$("#"+teacherId+"yes").attr("disabled","true");
		        	$("#"+teacherId+"no").attr("disabled","true");
		        }
		        },'json')
		    }
    </script>
    </head>
    <body>
        <c:forEach var="key" items="${list}" varStatus="s">
            <div style="width: 30%; height: 30%; float: left; margin-left: 3%;">
                <div id="answer">
                    <table style="width: 100%; height: 100%;">
                        <tr align="center" style="border-bottom: 1px solid #cccccc;">
                            <td style="color: #cccccc; font-size: 16px">
                                ${key.teacherId}&nbsp;:&nbsp;${key.userName}
                            </td>
                        </tr>
                        <tr align="center">
                            <td style="color: #cccccc; font-size: 16px">
                                <a style="color: black; font-size: 16px;cursor:pointer;" onclick="detail('${key.certificateUrl}');">查看资格证</a>
                                <!-- <img alt="后期效果可通过该标签实现" src="${key.certificateUrl}"/> -->
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6" style="height: 5%; width: 100%; margin-top: 10px;">
		            <input type="button" value="审批通过" onclick="javascript:checkUserForm(${key.teacherId},'APPROVED')"
		               class="btn btn-success btn-s-xs" style="width:47%" id="${key.teacherId}yes">
		            <input type="button" value="审批未通过" onclick="javascript:checkUserForm(${key.teacherId},'UNAPPROVED')"
		               class="btn btn-success btn-s-xs" style="width:47%" id="${key.teacherId}no">
                </div>
            </div>
        </c:forEach>
    </body>
</html>