$(function() {
	
	//FID生成
	$('#createFidBtn').click(function() {
		
		// 个数check
		var fidNum = $('#fidNumId').val();
		if(fidNum == null || fidNum == ""){
			alert('请输入FID个数');
			return;
		}
		if(isNaN(fidNum)){
			alert('请输入数字');
			return;
		}else if(fidNum > 1000){
			alert('每次生成不得超过1000个');
			return;
		}
		
		// 油量check
		var oilNum = $('#oilId').val();
		if(oilNum == null || oilNum == ""){
			alert('请输入油量');
			return;
		}
		if(isNaN(oilNum)){
			alert('请输入数字');
			return;
		}else if(oilNum > 1000){
			alert('你生成的太多了');
			return;
		}

		if(confirm("是否确定要生成FID")){
			
			$('#createFidBtn').attr("disabled","disabled");
			
			// 生成fid
			$.post('createFidManage.jspx', {
				'fidNum' : fidNum,
				'oil' : oilNum
			}, function(data) {
				if (data.result == "success") {
					alert("FID生成成功");
				}else{
					alert("FID生成失败！！！");
				}
			}, 'json');
		}
	});
	
	//FID查询
	$('#searchFid').click(function() {
		var fidType = $('#fidType').val();
		createGridFid(fidType);
	});
	
	//SID查询
	$('#searchSid').click(function() {
		var sidType = $('#sidType').val();
		createGridSid(sidType);
	});
	
	//FID选项
	$('#fid').click(function() {
		$('#fidDiv').css("display","block");
		$('#sidDiv').css("display","none");
		$('#fid').css("background-color","#5cb85c");
		$('#sid').css("background-color","#DDDDDD");
	});
	
	//SID选项
	$('#sid').click(function() {
		$('#fidDiv').css("display","none");
		$('#sidDiv').css("display","block");
		$('#fid').css("background-color","#DDDDDD");
		$('#sid').css("background-color","#5cb85c");
	});
});

// FID查询
function createGridFid(fidType) {
	$('#teh_grid_fid').datagrid({
		pagination : true,
		pageSize : 10,
		url : 'fidListManage.jspx',
		title : 'FID使用情况',
		method : 'post',
		width : '90%',
		height : '800px',
		fit : true,
		queryParams : {
			'fidSidType' : fidType
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'fid',
			title : 'FID',
			width : '150',
			align : 'center'
		}, {
			field : 'startTime',
			title : '生成时间',
			width : '150',
			align : 'center'
		}, {
			field : 'discountAmount',
			title : '优惠金额',
			width : '100',
			align : 'center'
		}, {
			field : 'useCount',
			title : '状态',
			width : '120',
			align : 'center',
			formatter : function(val, rec) {
				// 该行有问题
				if(val){
					return '<font color="green">已使用</font>';
				}else{
					return '<font color="red">未使用</font>';
				}
			}
		}, {
			field : 'endTime',
			title : '到期时间',
			width : '200',
			align : 'center'
		}, {
			field : 'userName',
			title : '用户姓名',
			width : '180',
			align : 'center'
		}, {
			field : 'phoneNumber',
			title : '手机号',
			width : '180',
			align : 'center'
		} ] ]
	});
}

//SID查询
function createGridSid(sidType) {
	$('#teh_grid_sid').datagrid({
		pagination : true,
		pageSize : 10,
		url : 'sidListManage.jspx',
		title : 'SID使用情况',
		method : 'post',
		width : '90%',
		height : '800px',
		fit : true,
		queryParams : {
			'fidSidType' : sidType
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'sid',
			title : 'SID',
			width : '150',
			align : 'center'
		}, {
			field : 'teacherName',
			title : '姓名',
			width : '150',
			align : 'center'
		}, {
			field : 'cityName',
			title : '城市',
			width : '120',
			align : 'center'
		}, {
			field : 'phoneNumber',
			title : '手机号',
			width : '150',
			align : 'center'
		}, {
			field : 'discountAmount',
			title : '优惠金额',
			width : '100',
			align : 'center'
		}, {
			field : 'registerTime',
			title : '注册时间',
			width : '150',
			align : 'center'
		}, {
			field : 'status',
			title : '状态',
			width : '80',
			align : 'center',
			formatter : function(val, rec) {
				// 该行有问题
				if(val == "0"){
					return '<font color="green">正常</font>';
				}else{
					return '<font color="red">作废</font>';
				}
			}
		}, {
			field : 'useCount',
			title : '使用次数',
			width : '60',
			align : 'center'
		}, {
			field : '_operate',
			title : '操作',
			width : '100',
			align : 'center',
			formatter : function(val, rec) {
				if(rec.status == "0"){
					return '<input type="button" style="background-color: #FF8888;border-color: #4cae4c;height:23px;width:50px;" '+
					'onclick="invalidSid('+rec.sid+')" value="作废" id="' + rec.sid +'"/>';
				}else{
					return '<input type="button" disabled="true"; style="background-color: #DDDDDD;border-color: #4cae4c;height:23px;width:50px;" '+
					'value="作废"/>';
				}
			}
		} ] ]
	});
}

//作废SID
function invalidSid(sid){
	// 生成fid
	$.post('invalidSidManage.jspx', {
		'sid' : sid
	}, function(data) {
		if (data.result == "success") {
			alert("SID作废成功");
			$('#'+sid).attr("disabled","true");
			$('#'+sid).css("background-color","#DDDDDD");
		}else{
			alert("作废失败")
		}
	}, 'json');
}