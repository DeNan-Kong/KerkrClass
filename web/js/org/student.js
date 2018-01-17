$(function() {
	createGridStudent();
});

// 查询
$('#go').click(function(){
    createGridStudent();
});
// 年级变换
$('#changgo').click(function(){
    var gradeone=$('#gradeone').val();
    var gradetwo=$('#gradetwo').val();
    $.post('changGradeOrg.jspx', {
        'gradeone' : gradeone,
        'gradetwo' : gradetwo
    }, function(data) {
        if (data.code=="1000") {
            createGridStudent();
            alert('年级变换成功！');
        }else{
            alert(data.message);
        }
    }, 'json');
});

function createGridStudent() {
    var grade =$('#gradezero').val();
    var phoneNumber =$('#phoneNumber').val();
    var userName =$('#userName').val();
	
	$('#teh_grid').datagrid( {
		pagination : true,
		url : 'studentListOrg.jspx',
		title : '学生详情',
		method : 'post',
		width : '90%',
		height : '500px',
		striped : true,
		fit : true,
		queryParams : {
			grade : grade,
            phoneNumber : phoneNumber,
			userName : userName
		},
		rownumbers:true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'name',
			title : '姓名',
			width : '10%',
			align : 'center'
		}, {
			field : 'phoneNumber',
			title : '电话',
			width : '15%',
			align : 'center'
		},{
			field : 'grade',
			title : '年级',
			width : '8%',
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
					return "";
				}
			}
		}, {
            field : 'type',
            title : '学生状态',
            width : '10%',
            align : 'center',
            formatter : function(val, rec){
                if(val == '0'){
                    return "正常";
                }else if(val == '4'){
                    return "申请中";
                }else if(val == '5'){
                    return "申请未通过";
                }else {
                	return "火星学生";
				}
            }
        }, {
			field : 'onType',
			title : '学生类型',
			width : '10%',
			align : 'center',
            formatter : function(val, rec){
                if(val == 1){
                    return "面授生+寒假网课";
                }else if(val == 2){
                    return "面授生-寒假网课";
                }else if(val == 3){
                    return "网校生+寒假网课";
                }else if(val == 4){
                    return "网校生-寒假网课";
                }else{
                    return "其他";
                }
            }
		}, {
			field : 'address',
			title : '地址',
			width : '25%',
			align : 'center'
		}, {
			field : 'createTime',
			title : '注册时间',
			width : '10%',
			align : 'center'
		}, {
			field : '_operate',
			title : '操作',
			width : '10%',
			align : 'center',
			formatter : function(val, rec) {
				var addrVal = "";
                if(typeof(rec.address) != "undefined"){
                    addrVal = rec.address;
                    //console.log(addrVal);
				}
				var delHtml = '<input type="button" class="btn btn-danger" style="margin: 5px" '+
                    'onclick=delStudent("'+rec.userId+'") value="删除" id="' + rec.userId +'"/>';

				var updateHtml = '<input type="button" class="btn btn-info" style="margin: 5px" ' +
                'onclick= "initModal(\'' + rec.id + '\',\'' + rec.name + '\',\'' + rec.phoneNumber + '\',\'' + rec.grade +
					'\',\'' + rec.onType +'\',\'' + addrVal +'\')" value="更新"/>';
				return delHtml + updateHtml ;
			}
		}] ]
	});
}

//删除学生
function delStudent(userId){
	// 删除学生
	$.post('delStudentOrg.jspx', {
		'userId' : userId
	}, function(data) {
		if (data.result == "success") {
            createGridStudent();
			alert("删除成功");
		}else{
			alert("删除失败")
		}
	}, 'json');
}

function initModal(id,name,phoneNumber,grade,onType,address) {
    console.log(name + phoneNumber + grade+ onType+address);

    $("#uid").val(id);
    $("#updName").val(name);
    $("#updPhone").val(phoneNumber);
    $("#updGrade").val(grade);
    $("#onType").val(onType);
	$("#address").val(address);

    $('#myModal').modal('show');          // 初始化后立即调用 show 方法
};

$('#update').click(function () {
	var id = $("#uid").val();
	var userName = $("#updName").val();
	var grade = $("#updGrade").val();
	var phoneNumber = $("#updPhone").val();
	var onType = $("#onType").val();
	var address = $("#address").val();

	$.post('updateStudentOrg.jspx', {
		id : id,
        userName : userName,
        grade : grade,
        phoneNumber : phoneNumber,
        onType : onType,
        address : address
	}, function(data) {
		if (data.result == "success") {
            createGridStudent();
            $('#myModal').modal('hide');
			//alert("更新成功");
		}else{
			alert("更新失败")
		}
	}, 'json');
});

