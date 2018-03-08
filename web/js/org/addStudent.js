$(function() {
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
            console.log(data.total);
        }
    });
    //数据回显
    //$("#watch-tags").val([1,2]).trigger("change");
});
$('#addBtn').click(function() {
    var phoneNumber = $('#phoneNumber').val();
    var userName = $('#userName').val();
    var grade = $('#grade').val();
    var password = $('#password').val();
    // onType = $('#onType').val();
    var address = $('#address').val();
    var tagIds = $('#watch-tags').val();

    console.log(tagIds);

    var reg = /^1[34578]\d{9}$/;
    if(phoneNumber == null || phoneNumber == ""){
        alert('请输入手机号');
        return;
    }else if( !reg.test(phoneNumber)){
        alert("手机号码格式不正确");
        return;
    }

    if(userName == null || userName == ""){
        alert('请输入姓名');
        return;
    }
    if(grade == null || grade == ""){
        alert('请输入年级');
        return;
    }
    if(password == null || password == ""){
        alert('请输入初始密码');
        return;
    }

    $('#addBtn').attr("disabled","disabled");
    password=$.md5(password);

    $.ajax({
        type: 'post',
        url: 'addStudentOrg.jspx',
        data: {
            phoneNumber : phoneNumber,
            userName : userName,
            grade : grade,
            password: password,
            address : address,
            tagIds : tagIds
        },
        cache: false,
        dataType: 'json',
        traditional: true,
        success: function (data) {
            if (data.code=="1000") {
                alert('添加成功！');
            }else{
                alert(data.message);
            }
            $('#addBtn').removeAttr("disabled");
        }
    });    
});