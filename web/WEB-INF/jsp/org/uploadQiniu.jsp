<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <link href="${ctx}/css/bootstrap-select.css" rel="stylesheet">

    <%--select--%>
    <script type="text/javascript" src="${ctx}/js/bootstrap-select.js"></script>
    <style>
        .k-body {
        }
    </style>
</head>
<body>
<span style="white-space:pre">        </span><%--start新增七牛上传--%>
<div class="k-body">
    <div class="col-md-12">
        <div class="form-group">
            <label style="text-align: center;width:100px;display:inline-block" for="title">标题</label>
            <input type="text" style="width:500px;display:inline-block" class="form-control" id="title" name="title"
                   placeholder="请输入标题"/>
        </div>
        <div class="form-group">
            <label style="text-align: center;width:100px; display:inline-block;
                    position: relative;left: 0;top: -37px;" for="description">描述</label>
            <textarea type="text" style="width:500px; display:inline-block" class="form-control" id="description"
                      name="description"
                      placeholder="请输入视频描述"/>
        </div>

        <div class="form-group">
            <label style="text-align: center;width:100px; display:inline-block" for="k-grade">年级</label>
            <div class="dropdown" style="width:500px; display:inline-block">
                <select id="k-grade" name="k-grade" class="show-tick form-control ">
                    <option value="01">一年级</option>
                    <option value="02">二年级</option>
                    <option value="03">三年级</option>
                    <option value="04">四年级</option>
                    <option value="05">五年级</option>
                    <option value="06">六年级</option>
                </select>
            </div>
        </div>

        <div class="form-group" hidden>
            <label style="text-align: center;width:100px; display:inline-block">观看权限</label>
            <div class="dropdown" style="width:500px; display:inline-block" >
                <%--<select id="k-type" name="k-type" class="show-tick form-control ">
                </select>--%>
                <label style="font-weight: normal" class="watch-author">
                <input type="checkbox" name="k-type" value="2">
                在校生</label>
                <label style="font-weight: normal;margin-left: 50px" class="watch-author">
                <input type="checkbox" name="k-type" value="3">
                网校生</label>               
            </div>
        </div>

        <input type="hidden" value="${sessionScope.userId}" id="orgId">
        <input type="hidden" value="${requestScope.domain}" id="domain">
    </div>

    <div class="col-md-12">
        <div id="container" style="margin-top:30px;margin-left: 43px;">
            <a class="btn btn-default " id="pickfiles" style="width:160px;margin-right:50px;display:inline-block"
               href="#">
                <i class="glyphicon glyphicon-plus"></i>
                <span>选择文件</span>
            </a>

            <a class="btn btn-default " id="up_load" style="width:160px;margin-right:50px;display:inline-block">
                <span>确认上传</span>
            </a>

            <a class="btn btn-default  " id="stop_load" style="width:160px;margin-right:50px;display:inline-block">
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
<script>
    //debugger;
    /*$(".watch-author").click(function(){
        var checked = [];
        $('input[name="k-type"]:checked').each(function(){
            checked.push($(this).val());
        });
        console.log(checked);
    });*/


</script>

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
</body>
</html>