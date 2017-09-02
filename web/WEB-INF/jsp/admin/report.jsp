<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>举报审核</title>
        <link rel="stylesheet" href="./css/go.css" type="text/css">
        <script type="text/javascript" src="./js/report/report.js"></script>
        <script type="text/javascript">
		    function apprReport(photoId, teacherId, userId) {
		    	var reportStatus=$("#"+photoId+"Sel").val();
		    	if(reportStatus == null || reportStatus == ''){
		    		alert('请选择审批结果');
		    		return;
		    	}
		    	
		    	$("#"+photoId+"ok").attr("disabled","true");
		        $.post('updateReportStatusManage.jspx',{
		        	'photoId':photoId,
		        	'teacherId':teacherId,
		        	'userId':userId,
		        	'reportStatus':reportStatus},function(data){
		        if(data.code=='1000'){
		        	alert('审批成功');
		        }else{
		        	alert('审批完成，但消息推送失败');
		        }
		        },'json');
		    }
    </script>
    </head>
    <body>
        <c:forEach var="key" items="${list}" varStatus="s">
            <div style="width: 45%; height: 44%; float: left; margin-left: 3%;">
                <div id="answer">
                    <table style="width: 100%; height: 100%;">
                        <tr align="center" style="border-bottom: 1px solid #cccccc;">
                            <td style="color: black; font-size: 16px; border-right: 1px solid #cccccc;">
                                &nbsp;举报者:${key.user_id}&nbsp;/&nbsp;${key.user_name}
                            </td>
                            <td style="color: black; font-size: 16px">
                                &nbsp;老师:${key.teacher_id}&nbsp;/&nbsp;${key.teacher_name}
                            </td>
                        </tr>
                        <tr align="center" style="border-bottom: 1px solid #cccccc;" >
                            <td style="color: black; font-size: 16px" colspan="2">举报原因&nbsp;:&nbsp;${key.content_stu}
                            </td>
                        </tr>
                        <tr align="center" style="border-bottom: 1px solid #cccccc;" >
                            <td style="color: black; font-size: 16px" colspan="2">老师评语&nbsp;:&nbsp;${key.comment}
                            </td>
                        </tr>
                        <tr align="center">
                            <td style="color: #cccccc; font-size: 16px" colspan="2">
                                <a style="color: black; font-size: 16px;cursor:pointer; font-weight: 800" onclick="detail('${key.photo_id}');">查看举报作业</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6" style="height: 13%; width: 100%; margin-top: 10px;padding-left:25px;">
                    <div style="width:75%;heght:100%;float:left;">
		                <select style="width: 100%;border: 1px solid #cccccc;height: 100%;" id="${key.photo_id}Sel">
			                <option value="" selected="selected">==请选择==</option>
			                <option value="0">恶意批改，禁用老师</option>
			                <option value="1">批改错误，不给钱</option>
			                <option value="2">举报不属实，不做处理</option>
		                </select>
                    </div>
                    <div style="width:10%;heght:100%;float:left;">
			            <input type="button" value="审批" onclick="javascript:apprReport('${key.photo_id}','${key.teacher_id}', '${key.user_id}')"
			                class="btn btn-success btn-s-xs" style="width:100%;height:100%;" id="${key.photo_id}ok">
                    </div>
                </div>
            </div>
        </c:forEach>
    </body>
</html>