<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>标签设置</title>
    </head>
    <body>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12"
                 style="float: left;margin-top: 10px;">
                <span style="margin-right: 15px;font-size: 16px">标签名称</span>
                <input type="text"
                       style="width:150px;display:inline-block;margin-right: 15px;"
                       class="form-control" id="newTag" name="newTag">
                <input type="button" value="添加" class="btn btn-success btn-s-xs"
                       id="addTag" style="text-align:center;margin-bottom: 4px;">
            </div>
        </div><!-- /.row -->
        <div class="row" style="margin-top: 15px">
            <div class="col-md-12" style="height: 70%">
                <table id="tag-table" data-toolbar="#toolbar"></table>

            </div>
        </div><!-- /.row -->
    </div>

    <div class="modal fade" id="update-info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">信息修改</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="tagId" class="control-label" style="text-align: center;width:20%">编号</label>
                            <label class="control-label" style="display:inline-block" id="tagId" />
                        </div>
                        <%--<div class="form-group">
                            <label for="subjectId" class="control-label" style="text-align: center;width:20%">test</label>
                            <select class="btn btn-large" name="subjectId" id="subjectId">
                                <option value="01">三星</option>
                                <option value="02">四星</option>
                                <option value="03">五星</option>
                            </select>
                        </div>--%>
                        <div class="form-group">
                            <label for="tagName" class="control-label" style="text-align: center;width:20%">标签</label>
                            <input type="text" class="form-control" style="width:50%;display:inline-block" id="tagName"/>
                        </div>
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
    <script>
        $(function () {
            tagList();
        });
        function tagList() {
            $("#tag-table").bootstrapTable('destroy');
            $('#tag-table').bootstrapTable({
                method: 'get',
                toolbar: '#toolbar',    //工具按钮用哪个容器
                striped: true,      //是否显示行间隔色
                cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,     //是否显示分页（*）
                sortable: false,      //是否启用排序
                sortOrder: "asc",     //排序方式
                data_locale: "zh-CN", //表格汉化
                pageNumber: 1,      //初始化加载第一页，默认第一页
                pageSize: 10,      //每页的记录行数（*）
                pageList: [10, 20, 40, 60],  //可供选择的每页的行数（*）
                url: "watchTagListOrg.jspx",//这个接口需要处理bootstrap table传递的固定参数
                //queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
                queryParams: function (params) {
                    return {
                        pageNumber: params.offset,
                        pageSize: params.limit
                    };
                },//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
                sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
                //search: true,      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                //showColumns: true,     //是否显示所有的列
                showRefresh: true,     //是否显示刷新按钮
                minimumCountColumns: 10,    //最少允许的列数
                clickToSelect: true,    //是否启用点击选中行
                searchOnEnterKey: true,
                columns: [
                    {
                        title: '序号',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return index + 1;
                        }
                    }, {
                        field: 'tagName',
                        title: '标签',
                        align: 'center'
                    }, {
                        field: 'createTime',
                        title: '创建时间',
                        align: 'center'
                    }, {
                        field: 'id',
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            //通过formatter可以自定义列显示的内容
                            //value：当前field的值，即id
                            //row：当前行的数据
                            return '<input type="button" class="btn btn-info" ' +
                                'onclick= "initModal(' + row.id + ', \'' + row.tagName +
                                '\')" value="修改" />';
                        }
                    }
                ]
            });
        };

        function initModal(id,tagName) {
            console.log(id+"/"+tagName);

            $("#tagName").val(tagName);
            $("#tagId").text(id);

            $('#update-info').modal('show');          // 初始化后立即调用 show 方法
        };

        $("#addTag").click(function () {
            var newTag = $("#newTag").val();
            $.ajax({
                url:'addWatchTagOrg.jspx',
                type:'post', //GET
                async:false,    //或false,是否异步
                data: {
                    tagName:newTag
                },
                timeout:5000,    //超时时间
                dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success:function(data,textStatus,jqXHR){
                    if(data.result == "success"){
                        alert(data.message);
                        tagList();//刷新
                    }else{
                        alert(data.message);
                    }
                }
            })
        });

        $("#update").click(function () {
            var tagName = $("#tagName").val();
            var tagId = $("#tagId").text()
            $.ajax({
                url:'updateWatchTagOrg.jspx',
                type:'post', //GET
                async:false,    //或false,是否异步
                data: {
                    id: tagId,
                    tagName: tagName
                },
                timeout:5000,    //超时时间
                dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success:function(data,textStatus,jqXHR){
                    if(data.result == "success"){
                        tagList();//刷新
                        $('#update-info').modal('hide');
                    }else{
                        alert(data.message);
                    }
                }
            })
        });
    </script>
</html>