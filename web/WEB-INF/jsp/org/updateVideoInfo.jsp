<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<span style="white-space:pre">        </span>
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
                      placeholder="请输入视频描述"></textarea>
        </div>

        <div class="form-group">
            <label style="text-align: center;width:100px; display:inline-block" for="k-grade">年级</label>
            <div class="dropdown" style="width:500px; display:inline-block">
                <select id="k-grade" name="k-grade" class="show-tick form-control ">
                    <option value="01">一年级</option>
                    <option value="02">二年级</option>
                    <option value="02">三年级</option>
                    <option value="04">四年级</option>
                    <option value="05">五年级</option>
                    <option value="06">六年级</option>
                </select>
            </div>
        </div>

        <%--<select style="width:500px; display:inline-block" id="grade" name="grade">
        </select>--%>

        <input type="hidden" value="${sessionScope.userId}" id="orgId">
        <input type="hidden" value="${requestScope.domain}" id="domain">
        <div class="form-group">
            <input id="" type="button" class="btn btn-default " style="width:160px;margin-left: 102px;display:inline-block" value="更新" />
        </div>
    </div>
</div>

<script></script>
</body>
</html>