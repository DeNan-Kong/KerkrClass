$(function() {
	createGridStudent();
});

function createGridStudent() {
	
	$('#apply-grid').datagrid( {
		pagination : true,
		url : 'applyStuListOrg.jspx',
		//title : '',
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
			width : '15%',
			align : 'center'
		}, {
			field : 'id',
			title : '审核',
			width : '380px',
			align : 'center',
			formatter : function(val, rec) {
                return "<input style='margin: 5px' class='btn btn-success btn-s-xs' type='button' onclick=\"javascript:checkStu("+val+",'2')\" value=\"审核为在校生\">" +
                    "<input style='margin: 5px' class=\"btn btn-success btn-s-xs\" type=\"button\" onclick=\"javascript:checkStu("+val+",'3')\" value=\"审核为网校生\">" +
                    "<input style='margin: 5px' class=\"btn btn-danger btn-s-xs\" type=\"button\" onclick=\"javascript:checkStu("+val+",'5')\" value=\"审核不通过\">"
			}
		}  ] ]
	});
}

//审核学生
function checkStu(id,type){
	$.post('checkApplyStuOrg.jspx', {
		'id' : id,
		'type':type
	}, function(data) {
		if (data.result == "success") {
			alert("审核成功");
            createGridStudent();
		}else{
			alert("审核不成功")
		}
	}, 'json');
}