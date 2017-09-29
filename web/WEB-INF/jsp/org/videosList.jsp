<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script
            src="${pageContext.request.contextPath}/js/org/videos.js"
            type="text/javascript"></script>
</head>
<body>
<div class="k-body">
    <div style="margin-top:10px;margin-left: 50%;">
        <span style="width: 332px;height: 40px;font-size:25px;color: #64CDBD;">视频列表</span>
    </div>
    <div class="col-md-12" style="height: 60%; width: 100%;margin-bottom: 15px;">
        <div id="videos-list" style="float: left;"></div>
    </div>
    <div class="col-md-12">
        <form role="form" id="k-form" method="post" action="updateVideos.jspx">
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
                    <select id="k-grade" name="grade" class="show-tick form-control ">
                        <option value="01">一年级</option>
                        <option value="02">二年级</option>
                        <option value="02">三年级</option>
                        <option value="04">四年级</option>
                        <option value="05">五年级</option>
                        <option value="06">六年级</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
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

            <input type="hidden" name="id" id="k-id"/>
            <input type="hidden" id="orgId" value="${sessionScope.userId}"/>

            <div class="form-group">
                <input id="update" type="button" class="btn btn-default " onclick=""
                       style="width:160px;margin-left: 102px;display:inline-block" value="更新"/>
            </div>

        </form>
    </div>
</div>
<script></script>
</body>
</html>