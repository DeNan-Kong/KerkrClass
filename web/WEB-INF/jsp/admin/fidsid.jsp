<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>FID   SID</title>
        <script
            src="${pageContext.request.contextPath}/js/fidsid/fidsid.js"
            type="text/javascript"></script>
    </head>
    <body>
        <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 10px;margin-left:70px;margin-bottom:20px;" align="center">
            <input type="button" value="FID" class="btn btn-success btn-s-xs" 
                style="width:30%;height:40px;border-width:0;" id="fid">
            <input type="button" value="SID" class="btn btn-success btn-s-xs" 
                style="width:30%;height:40px ;background-color:#DDDDDD;border-width:0;" id="sid">
        </div>
        <div style="height:1px; width:100%; background:#00CCFF; overflow:hidden;"></div>
        <div id="fidDiv">
            <div class="col-md-6" style="height: 5%; width: 30%; margin-top: 25px;float:left;">类型：
                <select style="width: 150px;border: 1px solid #cccccc;height: 30px;" name="type" id="fidType">
                    <!-- <option value="2">==请选择==</option> -->
                    <option value="0">未使用</option>
                    <option value="1">已使用</option>
                    <option value="2">全部</option>
                </select>
                <input type="button" value="查询" class="btn btn-success btn-s-xs" id="searchFid">
            </div>
            <div class="col-md-6" style="height: 5%; width: 60%;margin-top:25px;" align="right">
                FID个数：<input type="text" value="" id="fidNumId" style="height:32px;">
                <div style="margin-left:10px;width:20px;float:left;"></div>对应油量：<input type="text" value="" id="oilId" style="height:32px;">
                <input type="button" value="生成" class="btn btn-success btn-s-xs" id="createFidBtn" 
                    style="background-color:#FF8888;margin-top:-4px;border-width:0;">
            </div>
            <div class="col-md-6" style="height: 68%; width: 100%; margin-top:10px;">
                <div id="teh_grid_fid" style="height: 20%; width: 100%; float: left;"></div>
            </div>
        </div>
        <div id="sidDiv" style="display:none">
            <div class="col-md-6" style="height: 5%; width: 900px; margin-top: 30px;">类型：
                <select style="width: 150px;border: 1px solid #cccccc;height: 30px;" name="type" id="sidType">
                    <!-- <option value="2">==请选择==</option> -->
                    <option value="0">未使用</option>
                    <option value="1">已使用</option>
                    <option value="2">全部</option>
                </select>
                <input type="button" value="查询" class="btn btn-success btn-s-xs" id="searchSid">
            </div>
            <div class="col-md-6" style="height: 68%; width: 100%; margin-top:10px;">
                <div id="teh_grid_sid" style="height: 20%; width: 100%; float: left;"></div>
            </div>
        </div>
    </body>
</html>