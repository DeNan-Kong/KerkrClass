$(function() {
    createGridVideos();
    console.log("go……");
});

function createGridVideos() {
    $('videos-list').datagrid( {
        pagination : true,
        url : 'getListToWebVideos.jspx',
        method : 'post',
        width : '90%',
        height : '500px',
        striped : true,
        fit : true,
        queryParams : {
            'orgId' : "K20013",
        },
        rowNumbers: true,
        loadMsg : '正在努力为您查找中……',
        idField : 'id',
        singleSelect : true,
        columns : [ [ {
            field : 'id',
            title : '编号',
            width : '5%',
            align : 'center'
        }, {
            field : 'title',
            title : '标题',
            width : '15%',
            align : 'center'
        }, {
            field : 'description',
            title : '描述',
            width : '20%',
            align : 'center'
        },{
            field : 'grade',
            title : '年级',
            width : '5%',
            align : 'center'
        },{
            field : 'videoUrl',
            title : '视频',
            width : '10%',
            align : 'center',
            formatter : function(val, rec) {
                const html = ['<a id="show"  href=" '+ val +' " data-toggle="modal" data-target=".bs-example-modal-sm " class="btn btn-info" >查看</a>'].join("");
                return html;
            }
        },{
            field : 'createTime',
            title : '上传时间',
            width : '10%',
            align : 'center'
        },{
            field : 'id',
            title : '操作',
            width : '100',
            align : 'center',
            formatter : function(val, rec) {
                return '<input type="button" class="btn btn-danger" '+
                    'onclick=delTeacher("'+ val +'") value="删除" id="' + val +'"/>';
            }
        } ] ]
    });
}

//删除学生
function delTeacher(tid){
    // 删除学生
    $.post('delTeacherOrg.jspx', {
        'teacherId' : tid
    }, function(data) {
        if (data.result == "success") {
            alert("删除成功");
            $('#'+tid).attr("disabled","true");
            $('#'+tid).css("background-color","#DDDDDD");
        }else{
            alert("删除失败")
        }
    }, 'json');
}