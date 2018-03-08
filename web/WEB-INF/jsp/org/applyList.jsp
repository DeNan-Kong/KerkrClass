<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>新申请信息</title>
        <script src="${pageContext.request.contextPath}/js/org/apply.js"
            type="text/javascript"></script>
    </head>
    <body>
        <div style="margin-top:10px;margin-left: 50%;">
            <span style="width: 332px;height: 40px;font-size:25px;color: #64CDBD;">待审核信息</span>
        </div>
        <div class="col-md-6" style="height: 70%; width: 100%;">
            <div id="apply-grid" style="height: 20%; width: 70%; float: left;"></div>
        </div>
        <div class="modal fade" id="apply-m" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">审核为</h4>
                    </div>
                    <div class="modal-body">
                            <div class="form-group">
                                <label for="watch-tags" class="control-label" style="text-align: center;width:20%">学生类型</label>
                                <select class="form-control" id="watch-tags" style="width:50%;display:inline-block">
                                </select>
                            </div>
                            <input type="hidden" id="uid" />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="sure">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
</html>