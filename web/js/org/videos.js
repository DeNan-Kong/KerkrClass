$(function() {
    createGridVideos();
});

function createGridVideos() {
    $('#videos-list').datagrid( {
        pagination : true,
        url : 'getListToWebVideos.jspx',
        method : 'post',
        width : '90%',
        height : '500px',
        striped : true,
        fit : true,
        queryParams : {
            'orgId' : $("#orgId").val(),
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
            width : '20%',
            align : 'center'
        }, {
            field : 'description',
            title : '描述',
            width : '30%',
            align : 'center'
        },{
            field : 'grade',
            title : '年级',
            width : '5%',
            align : 'center',
            formatter : function(val, rec){
                if(val == "01"){
                    return "一年级";
                }else if(val == "02"){
                    return "二年级";
                }else if(val == "03"){
                    return "三年级";
                }else if(val == "04"){
                    return "四年级";
                }else if(val == "05"){
                    return "五年级";
                }else if(val == "06"){
                    return "六年级";
                }else{
                    return "-";
                }
            }
        },{
            field : 'videoUrl',
            title : '视频',
            width : '6%',
            align : 'center',
            formatter : function(val, rec) {
                //console.log(JSON.stringify(rec));
                return '<a href="'+ val +'" data-toggle="modal" class="btn btn-info" target="_blank">查看</a>';
            }
        },{
            field : 'createTime',
            title : '上传时间',
            width : '10%',
            align : 'center'
        },{
            field : '-',
            title : '操作',
            width : '6%',
            align : 'center',
            formatter : function(val, rec) {
                return '<a href="#" onclick="del(' +rec.id+ ')" class="btn btn-danger" id="del-' + rec.id +'"><i class="fa fa-times"></i></a>';
                //return '<a href="toUpdateVideoOrg.jspx" class="btn btn-danger"></a>';
            }

        } ] ],
        onClickRow: function (rowIndex,data){
            $("#title").val(data.title);
            $("#description").val(data.description);
            $("#k-grade").val(data.grade);
            $("#k-id").val(data.id);

            //alert(JSON.stringify(data));
            //var row = $('#videos-list').datagrid('getSelected');
        }
    });
}

//删除学生
function del(id){
    // 删除学生
    $.post('deleteVideos.jspx', {
        'id' : id
    }, function(data) {
        console.log(JSON.stringify(data));
        if (data.code == 1000) {
            alert("删除成功");
            $('#del-'+id).attr("disabled","true");
            $('#del-'+id).css("background-color","#e45c59");
        }else{
            alert("删除失败")
        }
    }, 'json');
}
//更新
$("#update").click(
function update(){
    //选取表单
    var form = $("#k-form");
    //获取表单数据
    var form_data = getFormData(form);

    //发送AJAX请求
    $.post('updateVideos.jspx',form_data,function(d){
        let res = d.code;
       console.log(res);
        createGridVideos();
        alert("更新成功");
        /*if (d.code ) {
            createGridVideos();
            alert("更新成功");
        }else{
            alert("更新失败")
        }*/
    })
});

function getFormData(form){
    var data = form.serialize();
    data = decodeURI(data);
    var arr = data.split('&');
    var item,key,value,newData={};
    for(var i=0;i<arr.length;i++){
        item = arr[i].split('=');
        key = item[0];
        value = item[1];
        if(key.indexOf('[]')!=-1){
            key = key.replace('[]','');
            if(!newData[key]){
                newData[key] = [];
            }
            newData[key].push(value);
        }else{
            newData[key] = value;
        }
    }
    return newData;
}
