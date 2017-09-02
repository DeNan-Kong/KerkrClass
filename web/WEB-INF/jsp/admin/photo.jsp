<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <%
            String data = request.getAttribute("data").toString();
        %>
        <title>作业批改情况</title>
        <style type="text/css">
		.imgShow {
		}
		</style>
        <script type="text/javascript" src="./js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript">
        $(function() {
        
            var img = $("#taskImg");
            var widthPercent=1
            var heightPercent=1
            img[0].src="${qiniuUrl}";
            img[0].onload = function(){
                widthPercent=img[0].width/img[0].naturalWidth
                heightPercent=img[0].height/img[0].naturalHeight
                var data=<%=data%>
                $.each(data, function(index, content) {
                    // 位置
                    var pox = content.position_x * widthPercent;
                    var poy = content.position_y * heightPercent;
                    var posi = '<div style="position:absolute;left:'+ pox +'px;top:' + poy + 'px;">'
                    
                    // 标签方向
                    var leftRightTag = '<img class="imgShow" alt="" style="width:60px;height:20px;" src="images/tag/textTag_right2.png">';
                    var rightRightTag = '<img class="imgShow" alt="" style="width:60px;height:20px;" src="images/tag/textTag_right.png">';
                    var leftWrongTag = '<img class="imgShow" alt="" style="width:100px;height:20px;" src="images/tag/textTag_wrong2.png">';
                    var rightWrongTag = '<img class="imgShow" alt="" style="width:100px;height:20px;" src="images/tag/textTag_wrong.png">';
                    var tagDir="";
                    if(content.direction == '1' && content.result =='1'){
                        tagDir=leftRightTag;
                    }else if(content.direction=='0' && content.result =='1'){
                        tagDir=rightRightTag;
                    }else if(content.direction=='1' && content.result =='0'){
                        tagDir=leftWrongTag;
                    }else if(content.direction=='0' && content.result =='0'){
                        tagDir=rightWrongTag;
                    }
                    
                    // 显示内容
                    var textReason = "";
                    if(content.result =='0'){
                        textReason = '<div class="imgShow" style="position:absolute;top:3px; left:12px;font-size:4px;">' + content.reason + '</div>';
                    }else{
                        textReason = '<div class="imgShow" style="position:absolute;top:3px; left:12px;font-size:4px;">' + '正确' + '</div>';
                    }
                    
                    // div结束标记
                    var divEnd='</div>';
                    
                    $("#main").append(posi + tagDir + textReason + divEnd);
                });
            }
            
            $("#hidTag").click(function(){
            	if($("#showTag").val() == "0"){
            		$(".imgShow").css("display","none");
            		$("#showTag").val("1");
            	}else{
                    $(".imgShow").css("display","block");
                    $("#showTag").val("0");
            	}
            });
        });
        </script>
    </head>
    <body>
         <div id="main">
            <img id="taskImg" style="width:100%;height:100%;" alt="xxx" >
        </div>
        <div id="btn" style="margin-top:20px;">
            <input id="hidTag" type="button" value="隐藏/显示标签" style="float:right;margin-right:1px;">
            <input id="showTag" type="hidden" value="0">
        </div>
    </body>
</html>