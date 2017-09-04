$(function() {
	//未付款查询
	$('#nopay').click(function() {
		createGridNopay('0');
		$('#searchType').val('0');
		$('#paymoney').removeAttr("disabled");
	});
	
	//付款中断查询
	$('#paying').click(function() {
		createGridNopay('1');
		$('#searchType').val('1');
		$('#paymoney').removeAttr("disabled");
	});
	
	//付款结果查询
	$('#hadpay').click(function() {
		createGridHadpay();
		$('#searchType').val('2');
		$('#paymoney').attr("disabled","true");
	});
	
	//批量付款
	$('#paymoney').click(function() {
		
		$('#alipayment').submit();		
	});
});

// 未付款查询
function createGridNopay(searchType) {
	$('#teh_grid').datagrid({
		pagination : false,
		pageSize : 10,
		url : 'searchPayRecordManage.jspx',
		title : '批量支付',
		method : 'post',
		width : '90%',
		height : '700px',
		fit : true,
		queryParams : {
			'searchType' : searchType // 用户申请中查询
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'teacherId',
			title : '教师ID',
			width : '100',
			align : 'center'
		}, {
			field : 'toName',
			title : '收款人姓名',
			width : '150',
			align : 'center'
		}, {
			field : 'amount',
			title : '金额',
			width : '120',
			align : 'center'
		}, {
			field : 'createTime',
			title : '申请提现时间',
			width : '200',
			align : 'center'
		}, {
			field : 'toAccount',
			title : '收款方支付宝账号',
			width : '180',
			align : 'center'
		}, {
			field : 'serialNumber',
			title : '流水号',
			width : '180',
			align : 'center'
		} ] ],
		loadFilter: function(data){
			$('#batchNum').val(data.total);
			if(data.total == '0'){
				$('#paymoney').attr("disabled","true");
			}
			return data;
		}
	});
}

//付款结果查询
function createGridHadpay() {
	$('#teh_grid').datagrid({
		pagination : false,
		pageSize : 10,
		url : 'searchPayRecordManage.jspx',
		title : '批量支付',
		method : 'post',
		width : '90%',
		height : '700px',
		fit : true,
		queryParams : {
			'searchType' : '2'
		},//付款结果查询
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'teacherId',
			title : '教师ID',
			width : '100',
			align : 'center'
		}, {
			field : 'toName',
			title : '收款人姓名',
			width : '150',
			align : 'center'
		}, {
			field : 'amount',
			title : '金额',
			width : '120',
			align : 'center'
		}, {
			field : 'createTime',
			title : '申请提现时间',
			width : '200',
			align : 'center'
		}, {
			field : 'toAccount',
			title : '收款方支付宝账号',
			width : '180',
			align : 'center'
		}, {
			field : 'serialNumber',
			title : '流水号',
			width : '180',
			align : 'center'
		} , {
			field : 'result',
			title : '支付结果',
			width : '180',
			align : 'center'
		}, {
			field : 'reason',
			title : '原因',
			width : '180',
			align : 'center'
		}] ]
	});
}