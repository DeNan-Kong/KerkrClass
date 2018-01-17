<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>学生信息</title>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
                type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/org/student.js"
            type="text/javascript"></script>
    </head>
    <body>   
        <div style="margin-top:10px;margin-left: 50%;">
            <span style="width: 332px;height: 40px;font-size:25px;color: #64CDBD;">学生信息</span>
        </div>
        <div class="col-md-6" style="float: left;margin-top: 10px;">
            <span style="margin-right: 15px;font-size: 16px">年级</span>
            <select name="gradezero" id="gradezero" style="width:90px;display:inline-block;margin-right: 15px;"
                    class="form-control">
                <option value="">全部</option>
                <option value="01">一年级</option>
                <option value="02">二年级</option>
                <option value="03">三年级</option>
                <option value="04">四年级</option>
                <option value="05">五年级</option>
                <option value="06">六年级</option>
            </select>
            <span style="margin-right: 15px;font-size: 16px">姓名</span>
            <input type="text"
                   style="width:110px;display:inline-block"
                   class="form-control" id="userName"
                   name="userName">
            <span style="margin-right: 15px;font-size: 16px">电话</span>
            <input type="text"
                   style="width:110px;display:inline-block;margin-right: 15px;"
                   class="form-control" id="phoneNumber"
                   name="phoneNumber">
            <input type="button" value="查询" class="btn btn-success btn-s-xs"
                   id="go" style="text-align:center; margin-bottom: 4px;">
        </div>
        <div class="col-md-6" style="float: left;margin-top: 10px;">
            <span style="margin-right: 15px;font-size: 16px">FROM</span>
            <select name="gradeone" id="gradeone" style="width:90px;display:inline-block;margin-right: 15px;"
                    class="form-control">
                <option value="">全部</option>
                <option value="01">一年级</option>
                <option value="02">二年级</option>
                <option value="03">三年级</option>
                <option value="04">四年级</option>
                <option value="05">五年级</option>
                <option value="06">六年级</option>
            </select>
            <span style="margin-right: 15px;font-size: 16px">TO</span>
            <select name="gradetwo" id="gradetwo" style="width:90px;display:inline-block;margin-right: 15px;"
                    class="form-control">
                <option value="">全部</option>
                <option value="01">一年级</option>
                <option value="02">二年级</option>
                <option value="03">三年级</option>
                <option value="04">四年级</option>
                <option value="05">五年级</option>
                <option value="06">六年级</option>
            </select>
            <input type="button" value="年级变换" class="btn btn-success btn-s-xs" id="changgo" style="margin-bottom:2px;">
        </div>

        <div class="col-md-6" style="height: 70%; width: 100%; margin-top: 20px;">
            <div id="teh_grid" style="height: 20%; width: 70%; float: left;"></div>
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">信息修改</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="updName" class="control-label" style="text-align: center;width:20%">姓名</label>
                                <input type="text" style="width:50%;display:inline-block" class="form-control" id="updName">
                            </div>
                            <div class="form-group">
                                <label for="updPhone" class="control-label" style="text-align: center;width:20%">电话</label>
                                <input type="text" style="width:50%;display:inline-block" class="form-control" id="updPhone">
                            </div>
                            <div class="form-group">
                                <label for="address" class="control-label" style="text-align: center;width:20%">地址</label>
                                <input type="text" style="width:50%;display:inline-block" class="form-control" id="address">
                            </div>
                            <div class="form-group">
                                <label for="updGrade" class="control-label" style="text-align: center;width:20%">年级</label>
                                <select class="form-control" id="updGrade" style="width:50%;display:inline-block">
                                    <option value="01">一年级</option>
                                    <option value="02">二年级</option>
                                    <option value="03">三年级</option>
                                    <option value="04">四年级</option>
                                    <option value="05">五年级</option>
                                    <option value="06">六年级</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="onType" class="control-label" style="text-align: center;width:20%">学生类型</label>
                                <select class="form-control" id="onType" style="width:50%;display:inline-block">
                                    <option value="1">面授生+寒假网课</option>
                                    <option value="2">面授生-寒假网课</option>
                                    <option value="3">网校生+寒假网课</option>
                                    <option value="4">网校生-寒假网课</option>
                                </select>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<label style="margin-left: 30px;margin-right: 30px">禁用</label>--%>
                                <%--<input type="checkbox" id="lockDown" name="lockDown"/>--%>
                            <%--</div>--%>
                            <input type="hidden" id="uid" />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="update">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
</html>