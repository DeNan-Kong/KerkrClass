$(function() {
	createGridStudent();
	// 查询
	$('#go').click(function(){
		var gradezero=$('#gradezero').val();
		// var type=$('#type').val();
		createGridStudent(gradezero);
	});
	
	// 年级变换
	$('#changgo').click(function(){
		var gradeone=$('#gradeone').val();
		var gradetwo=$('#gradetwo').val();
		// var type=$('#type').val();
		updateGrade(gradeone,gradetwo);
	});
	
});

function updateGrade(gradeone,gradetwo) {
	$.post('changGradeOrg.jspx', {
		'gradeone' : gradeone,
		'gradetwo' : gradetwo
	}, function(data) {
		if (data.code=="1000") {
			alert('年级变换成功！');
		}else{
			alert(data.message);
		}
	}, 'json');
}

function createGridStudent(gradezero) {
	
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
			'grade' : gradezero
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
		}, {
            field : 'type',
            title : '学生状态',
            width : '15%',
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
			width : '15%',
			align : 'center',
            formatter : function(val, rec){
                if(val == 2){
                    return "在校生";
                }else if(val == 3){
                    return "网校生";
                }else{
                    return "-";
                }
            }
		}, {
			field : 'createTime',
			title : '注册时间',
			width : '20%',
			align : 'center'
		}, {
			field : '_operate',
			title : '操作',
			width : '100',
			align : 'center',
			formatter : function(val, rec) {
				return '<input type="button" style="background-color: #FF8888;border-width:1px;height:23px;width:50px;" '+
				'onclick=delStudent("'+rec.userId+'") value="删除" id="' + rec.userId +'"/>';
			}
		} ] ]
	});
}

//删除学生
function delStudent(userId){
	// 删除学生
	$.post('delStudentOrg.jspx', {
		'userId' : userId
	}, function(data) {
		if (data.result == "success") {
			alert("删除成功");
			$('#'+userId).attr("disabled","true");
			$('#'+userId).css("background-color","#DDDDDD");
		}else{
			alert("删除失败")
		}
	}, 'json');
}