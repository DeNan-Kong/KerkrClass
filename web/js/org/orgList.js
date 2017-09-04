$(function() {
	
	$.post('jigouListOrg.jspx',{},
		function(data){
			
			var optCon = "";
			$.each(data, function(index,content){
				
				optCon=optCon + "<option value=" + content.org_id + ">" + content.org_name + "</option>"
			});
			
			$('#selOrgId').append(optCon);
		
		},'json');
	
	
	$('#go').click(function(){
		var selOrgId=$('#selOrgId').val();
		var type=$('#type').val();
		createGridSid(selOrgId,type);
	});
});

//SID查询
function createGridSid(orgId,type) {
	$('#teh_grid').datagrid({
		pagination : true,
		pageSize : 10,
		url : 'jigouInfoOrg.jspx',
		title : '机构用户明细',
		method : 'post',
		width : '90%',
		height : '800px',
		fit : true,
		queryParams : {
			'orgId' : orgId,
			'type' : type
		},
		rownumbers : true,
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
		} ] ]
	});
}
