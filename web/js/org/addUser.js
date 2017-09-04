$(function() {
	
	var orgId = $('#orgId').val();
	var orgPhoneNumber = $('#orgPhoneNumber').val();
	
	createGridSid(orgId);
	
	//SID生成
	$('#createSidBtn').click(function() {
		
		// 个数check
		var userName = $('#userName').val();
		var phoneNumber = $('#phoneNumber').val();
		if(userName == null || userName == ""){
			alert('请输入姓名');
			return;
		}
		if(phoneNumber == null || phoneNumber == ""){
			alert('请输入手机号');
			return;
		}
		
		if(isNaN(phoneNumber)){
			alert('请输入正确手机号');
			return;
		}else if(phoneNumber.length != 11){
			alert('请输入正确手机号');
			return;
		}
			
		$('#createSidBtn').attr("disabled","disabled");
		
		// 生成fid
		$.post('addUserOrg.jspx', {
			'orgId' : orgId,
			'orgPhoneNumber' : orgPhoneNumber,
			'phoneNumber' : phoneNumber,
			'userName' : userName
		}, function(data) {
			if (data.result == "success") {
				alert("推广编码生成成功");
			}else{
				alert(data.message);
			}
			$('#createSidBtn').removeAttr("disabled");
			createGridSid(orgId);
		}, 'json');
	});
	
	//SID查询
	$('#searchSid').click(function() {
		createGridSid(orgId);
	});
	
});

//SID查询
function createGridSid(orgId) {
	$('#teh_grid_sid').datagrid({
		pagination : true,
		pageSize : 10,
		url : 'sidListOrg.jspx',
		title : '业务员推广明细',
		method : 'post',
		width : '90%',
		height : '800px',
		fit : true,
		queryParams : {
			'orgId' : orgId
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'userName',
			title : '姓名',
			width : '200',
			align : 'center'
		}, {
			field : 'phoneNum',
			title : '手机号',
			width : '200',
			align : 'center'
		}, {
			field : 'sid',
			title : '推广编码',
			width : '200',
			align : 'center'
		}, {
			field : 'useCount',
			title : '推广次数',
			width : '150',
			align : 'center'
		}, {
			field : 'createTime',
			title : '加入时间',
			width : '200',
			align : 'center'
		} ] ],
		loadFilter: function(data){
			$('#useCount').html('总次数 : '+data.useCount);
			return data;
		}
	});
}
