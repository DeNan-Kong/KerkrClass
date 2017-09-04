<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>上传视频</title>
    <%--css--%>
    <link rel="stylesheet" href="${ctx}/css/qiniu/main.css"/>
    <link rel="stylesheet" href="${ctx}/css/qiniu/highlight.css"/>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .k-body {
        }
    </style>
</head>
<body>
<span style="white-space:pre">        </span><%--start新增七牛上传--%>
<div class="k-body">
    <div class="col-md-12" style="">
        <div class="form-group" style="height:30px">
            <label style="text-align: center;width: 100px;float: left" for="title">标题</label>
            <input type="text" style="width: 500px;float: left" class="form-control" id="title" name="title"
                   placeholder="请输入标题"/>
        </div>
        <div class="form-group">
            <label style="text-align: center;width: 100px; float: left" for="title">描述</label>
            <textarea type="text" style="width: 500px;float: left" class="form-control" id="description"
                      name="description"
                      placeholder="请输入标题"/>
        </div>
        <input type="hidden" value="${sessionScope.userId}" id="orgId">
        <input type="hidden" value="${requestScope.domain}" id="domain">
    </div>

    <div class="col-md-12">
        <div id="container" style="margin-top:30px;margin-left: 43px;">
            <a class="btn btn-default " id="pickfiles" style="width:160px;margin-right:50px" href="#">
                <i class="glyphicon glyphicon-plus"></i>
                <span>选择文件</span>
            </a>

            <a class="btn btn-default " id="up_load" style="width:160px;margin-right:50px" >
                <span>确认上传</span>
            </a>

            <a class="btn btn-default  " id="stop_load" style="width:160px;margin-right:50px">
                <span>暂停上传</span>
            </a>
        </div>
    </div>

    <div style="display:none" id="success" class="col-md-12">
        <div class="alert-success">
            队列全部文件处理完毕
        </div>
    </div>

    <div class="col-md-12 ">
        <table class="table table-striped table-hover text-left"
               style="margin-top:40px;display:none">
            <thead>
            <tr>
                <th class="col-md-4">文件名</th>
                <th class="col-md-2">大小</th>
                <th class="col-md-6">详情</th>
            </tr>
            </thead>
            <tbody id="fsUploadProgress">
            </tbody>
        </table>
    </div>
</div>

<span style="white-space:pre">        </span><%--end--%>

<%--upload--%>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/qiniu/plupload/moxie.js"></script>
<script type="text/javascript" src="${ctx}/js/qiniu/plupload/plupload.dev.js"></script>
<%--<script src="${ctx}/js/qiniu/plupload/plupload.full.min.js"></script>--%>
<script type="text/javascript" src="${ctx}/js/qiniu/plupload/zh_CN.js"></script>
<%--qiniu--%>
<script type="text/javascript" src="${ctx}/js/qiniu/qiniu.js"></script>
<script type="text/javascript" src="${ctx}/js/qiniu/ui.js"></script>
<script type="text/javascript" src="${ctx}/js/qiniu/highlight.js"></script>
<script type="text/javascript" src="${ctx}/js/qiniu/main.js"></script>
<script>
    function abc() {
        var data = {
            "orgId":$('#orgId').val(),
            "title": $('#title').val(),
            "description": $('#description').val(),
            "videoUrl":"1",
            "hash": "2",
            "length": "3"
        }
        $.ajax({
            url:'uploadCallBackVideos.jspx',
            type:'POST', //GET
            async:false,    //或false,是否异步
            data: data,
            timeout:5000,    //超时时间
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success:function(data,textStatus,jqXHR){
                console.log(data)
                console.log(textStatus)
                console.log(jqXHR)
            }
        })
    }

</script>
</body>
</html>