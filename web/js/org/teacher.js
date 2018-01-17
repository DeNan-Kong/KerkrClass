$(function() {
	createGridStudent();
});

function createGridStudent() {
	
	$('#teh_grid').datagrid( {
		pagination : true,
		url : 'teacherListOrg.jspx',
		title : '老师详情',
		method : 'post',
		width : '90%',
		height : '500px',
		striped : true,
		fit : true,
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
		}, {
			field : 'subjectId',
			title : '科目',
			width : '10%',
			align : 'center',
			formatter : function(val, rec){
				if(val == "01"){
					return "语文";
				}else if(val == "02"){
					return "数学";
				}else if(val == "03"){
					return "英语";
				}else{
					return "";
				}
			}
		},{
			field : 'grade',
			title : '年级',
			width : '15%',
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
		},{
			field : 'createTime',
			title : '注册时间',
			width : '20%',
			align : 'center'
		}, {
			field : 'teacherId',
			title : '操作',
			width : '100',
			align : 'center',
			formatter : function(val, rec) {

				return '<input type="button" class="btn btn-danger" style="margin: 5px" '+
                    'onclick=delTeacher("'+val+'") value="删除"/>';
			}
		}  ] ]
	});
}

//删除学生
function delTeacher(tid){
	// 删除学生
	$.post('delTeacherOrg.jspx', {
		'teacherId' : tid
	}, function(data) {
		if (data.result == "success") {
            createGridStudent();
			alert("删除成功");
		}else{
			alert("删除失败")
		}
	}, 'json');
}