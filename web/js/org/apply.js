$(function () {
    createGridStudent();

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

function createGridStudent() {

    $('#apply-grid').datagrid({
        pagination: true,
        url: 'applyStuListOrg.jspx',
        //title : '',
        method: 'post',
        width: '90%',
        height: '500px',
        striped: true,
        fit: true,
        rownumbers: true,
        loadMsg: '正在努力为您查找中……',
        idField: 'id',
        singleSelect: true,
        columns: [[{
            field: 'name',
            title: '姓名',
            width: '10%',
            align: 'center'
        }, {
            field: 'phoneNumber',
            title: '电话',
            width: '15%',
            align: 'center'
        }, {
            field: 'grade',
            title: '年级',
            width: '15%',
            align: 'center',
            formatter: function (val, rec) {
                if (val == "01") {
                    return "一年级";
                } else if (val == "02") {
                    return "二年级";
                } else if (val == "03") {
                    return "三年级";
                } else if (val == "04") {
                    return "四年级";
                } else if (val == "05") {
                    return "五年级";
                } else if (val == "06") {
                    return "六年级";
                } else {
                    return "";
                }
            }
        }, {
            field: 'createTime',
            title: '注册时间',
            width: '15%',
            align: 'center'
        }, {
            field: 'id',
            title: '审核',
            width: '380px',
            align: 'center',
            formatter: function (val, rec) {
                return "<input style='margin: 5px' class='btn btn-success btn-s-xs' type='button' onclick=\"javascript:initModal(" + val + ")\" value=\"审核\">" +
                    "<input style='margin: 5px' class=\"btn btn-danger btn-s-xs\" type=\"button\" onclick=\"javascript:checkStu(" + val + ",'5')\" value=\"审核不通过\">"
            }
        }]]
    });
}
//审核学生
function checkStu(id, type) {
    $.post('checkApplyStuOrg.jspx', {
        'id': id,
        'type': type
    }, function (data) {
        if (data.result == "success") {
            alert("审核成功");
            createGridStudent();
        } else {
            alert("审核不成功")
        }
    }, 'json');
}

$("#sure").click(function () {
    var id = $("#uid").val();
    var tagIds = $('#watch-tags').val();

    $.ajax({
        type: 'post',
        url: 'checkApplyStuOrg.jspx',
        data: {
            id: id,
            type: 0,
            tagIds : tagIds
        },
        cache: false,
        dataType: 'json',
        traditional: true,
        success: function (data) {
            if (data.result == "success") {
                $('#apply-m').modal('hide');
                createGridStudent();
            } else {
                alert("审核不成功")
            }
        }
    });
});

function initModal(id ){
    console.log(id);

    $("#uid").val(id);
    $("#watch-tags").val([]).trigger("change");
    $('#apply-m').modal('show');          // 初始化后立即调用 show 方法
};