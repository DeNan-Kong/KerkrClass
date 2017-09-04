$(function() {
	createGridWish();
});

function createGridWish() {
	$('#teh_grid').datagrid({
		pagination : true,//是否显示分页的标签
		pageSize : 10,
		url : 'wishListManage.jspx',
		title : '心愿详情',
		method : 'post',
		width : '100%',
		height : '100px',
		fit : true,
		queryParams : {//传入参数设置
			//
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [[ {
			field : 'userId',
			title : '用户ID',
			width : '10%',
			align : 'center'
		}, {
			field : 'userName',
			title : '用户姓名',
			width : '10%',
			align : 'center'
		}, {
			field : 'pointAll',
			title : '学分',
			width : '10%',
			align : 'center'
		}, {
			field : 'comment',
			title : '心愿内容',
			width : '60%',
			align : 'center'
		}, {
			field : 'createTime',
			title : '提交时间',
			width : '10%',
			align : 'center'
		} ]] 
	});
}