<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/5
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>Title</title>
    <%--<%@include file="/common/common.jspf" %>--%>
    <!-- bootstrap-select -->
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/bootstrap-select.css" type="text/css">
    <script type="text/javascript" src="${ctx}/js/app.v1.js"></script>
    <script type="text/javascript" src="${ctx}/js/app.plugin.js"></script>
    <script src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/js/bootstrap/bootstrap.min.js"></script>
    <script src="${ctx}/js/bootstrap/bootstrap-select.js"></script>
    <script src="${ctx}/js/bootstrap/defaults-zh_CN.min.js"></script>
    <%--select2--%>
    <link rel="stylesheet" href="${ctx}/css/select2.min.css" type="text/css">
    <script src="${ctx}/js/select2.min.js"></script>
</head>
<body>
<div class="col-md-5" onclick="test()">
    <select id="sel" class="form-control selectpicker" title="请选择省份" multiple>
        <option data-content="<span class='label label-success'>广东省</span>" value="1">广东省</option>
        <option data-content="<span class='label label-info'>广西省</span>" value="2">广西省</option>
        <option data-content="<span class='label label-warning'>福建省</span>" value="3">福建省</option>
        <option data-content="<span class='label label-danger'>山东省</span>" value="4">山东省</option>
    </select>

    <select id="sel_menu2" multiple="multiple" class="form-control" onclick="test()">
    </select>

</div>
<script>
    $(function () {
        //多选
        var data = [{id: 0, text: 'apple'}, {id: 1, text: 'banana'}, {id: 2, text: 'pear'},{id: 3, text: 'dddd'},{id: 4, text: 'sdss'}];//下拉列表中的数据项

        $("#sel_menu2").select2({
            data: data
        });//启动select2
    });

    $('#test').selectpicker('refresh');

    function test() {
        var sel = $("#sel_menu2").val();
        console.log(sel);
    }
</script>
</body>
</html>
