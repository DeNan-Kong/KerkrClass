$(function() {
	createGridNopay()
});

function createGridNopay() {
	$('#teh_grid').datagrid({
		pagination : true,//是否显示分页的标签
		pageSize : 10,
		url : 'feedbackListSales.jspx',
		title : '反馈详情',
		method : 'post',
		width : '100%',
		height : '100px',
		fit : true,
		queryParams : {//传人参数设置
			//
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [[ {
			field : 'userId',
			title : '反馈人',
			width : '20%',
			align : 'center'
		}, {
			field : 'content',
			title : '内容',
			width : '65%',
			align : 'center'
		}, {
			field : 'createTime',
			title : '反馈时间',
			width : '15%',
			align : 'center'
		} ]] 
	});
}