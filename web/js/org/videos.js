$(function() {
    createGridVideos();
    //动态下拉菜单
    $.ajax({
        url:'getTagsListOrg.jspx',
        type:'post', //GET
        async:true,    //或false,是否异步
        data: {},
        timeout:5000,    //超时时间
        dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
        success:function(data,textStatus,jqXHR){
            //var data = [{id: 1, text: '面授生'}, {id: 2, text: '网校生'}, {id: 3, text: '寒假网课'}];//下拉列表中的数据项
            $("#watch-tags").select2({
                placeholder: "请选择",
                language: "zh-CN",
                multiple: true,
                maximumSelectionLength: 5,
                data: data.rows,
            });//启动select2
            //console.log(data.total);
        }
    });
    //数据回显
    //$("#watch-tags").val([1,2]).trigger("change");
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
        rownumbers: true,
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
            width : '8%',
            align : 'center',
            formatter : function(val, rec) {
                //console.log(JSON.stringify(rec));
                return '<a href="'+ val +'" class="btn btn-info" style="margin: 3px" target="_blank">查看</a>';
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
        },{
            field : 'watchAuthor',
            title : '观看权限',
            width : '10%',
            hidden:'true'
        } ] ],
        onClickRow: function (rowIndex,data){
            $("#title").val(data.title);
            $("#description").val(data.description);
            $("#k-grade").val(data.grade);
            $("#k-id").val(data.id);

            var tags = [];
            if( typeof(data.watchAuthor) != "undefined" ){
                tags = data.watchAuthor.split("#");
            }
            //console.log( tags);
            //数据回显
            $("#watch-tags").val(tags).trigger("change");

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

$('#update').click(function () {
    var id = $("#k-id").val();
    var title = $("#title").val();
    var grade = $("#k-grade").val();
    var description = $("#description").val();
    var tagIds =  $("#watch-tags").val();
    console.log(tagIds);
    $.ajax({
        type: 'post',
        url: 'updateVideos.jspx',
        data: {
            id : id,
            title : title,
            description : description,
            grade : grade,
            tagIds : tagIds,
        },
        cache: false,
        dataType: 'json',
        traditional: true,
        success: function (data) {
            if(data.code == 1000){
                createGridVideos();
                alert(data.message)
            }else {
                alert(data.message)
            }
        }
    });
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
