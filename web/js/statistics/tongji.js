$(function() {
	
	// 上传作业总数
	subjectCount(json.rates);
	
	// 注册人数
	registerCount(json.values);
	createGrid({'tongjiType':'0'});
	
	// 画面打开不需要检索的时候用
	//createGrid({'tongjiType':''});
	
	$('#go').click(function(){
		var type=$('#type').val();
		createGrid({'tongjiType':type});
	});
	
	$('#type').change(function(){
		var type=$(this).val();
		createGrid({'tongjiType':type});
	})
});

function createGrid(queryParams) {
	
	var apprvFlag = true;
	if(queryParams.tongjiType == '1'){
		apprvFlag = false;
	}
	
	$('#teh_grid').datagrid( {
		pagination : true,
		url : 'tongjiListManage.jspx',
		title : '注册详情',
		method : 'post',
		width : '90%',
		height : '500px',
		striped : true,
		fit : true,
		queryParams:queryParams,
		rownumbers:true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'name',
			title : '姓名',
			width : '100',
			align : 'center'
		}, {
			field : 'phoneNumber',
			title : '电话',
			width : '150',
			align : 'center',
			formatter : function(val, rec) {
				// 该行有问题
				if(val == undefined || val == null || val.length != 11){
					return val;
				}else{
					return val.substring(0,3)+"*****"+val.substring(8,11);
				}
			}
		}, {
			field : 'provinceName',
			title : '所在省份',
			width : '120',
			align : 'center'
		}, {
			field : 'cityName',
			title : '所在城市',
			width : '120',
			align : 'center'
		}, {
			field : 'subjectId',
			title : '科目',
			width : '100',
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
			width : '150',
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
			width : '200',
			align : 'center'
		},{
			field : 'orgId',
			title : '所属机构',
			width : '100',
			align : 'center'
		},{
			field : 'apprvStatus',
			title : '资格证审核状态',
			width : '200',
			align : 'center',
			hidden : apprvFlag,
			formatter : function(val, rec) {
				if(apprvFlag == false){
					return '<span style="cursor:pointer;" onclick="detail('+rec.phoneNumber+')">' + val + '</span>' + 
					'<input type="hidden" id="'+rec.phoneNumber+'" value="'+rec.certificateUrl+'">';
				}
			}
		} ] ]
	});
}

// 显示资格证
function detail(phoneNumber) {
	var cert = $('#'+phoneNumber).val();
	OpenWindow=window.open("", "newwin", "location=no,height=600px,width=900px,top=20px,left=40px,toolbar=no,scrollbars=scroll,menubar=no"); 
	OpenWindow.document.write("<HTML>") 
	OpenWindow.document.write("<TITLE>教师资格证</TITLE>") 
	OpenWindow.document.write("<BODY BGCOLOR=#ffffff>") 
	OpenWindow.document.write("<img style='width:100%;height:100%;' src='" + cert + "' alt='xxx' >") 
	OpenWindow.document.write("</BODY>") 
	OpenWindow.document.write("</HTML>") 
	OpenWindow.document.close()
}

// 注册人数
function registerCount(values){
	var myChart = echarts.init(document.getElementById('main'));
	option = {
		title : {
			x : 'center',
			text : '注册人数',
			textStyle:{
		    fontSize:20
		    },
		},
		/**
		 * 悬浮提示框
		 */
		tooltip : {
			trigger : 'item',
			formatter : function(a)
			{
				return a[1]+":"+ a.data;
			}
		},
		/**
		 * 工具栏
		 */
		toolbox : {
			show : false,
			feature : {
				dataView : {
					show : true,
					readOnly : false
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
		},
		calculable : true,
		grid : {
			borderWidth : 0,
			y : 35,
			y2 : 15
		},
		xAxis : [ {
			type : 'category',
			show : false,
			data : [ '老师', '家庭' ]
		} ],
		yAxis : [ {
			type : 'value',
			show : false
		} ],
		series : [ {
			type : 'bar',
			itemStyle : {
				normal : {
					color : function(params) {
						// build a color map as your need.
					var colorList = [ '#B5C334', '#ff7f00' ];
					return colorList[params.dataIndex]
				},
				label : {
					show : true,
					textStyle:{
					    fontSize:16,
					    color:'white'
					},
					position : 'inside',
				    formatter : '{b}\n{c}人'
				  }
				}
			},
			data : values,
			markPoint : {
				tooltip : {
					trigger : 'item',
					backgroundColor : 'rgba(0,0,0,0)',
					formatter : function(params) {
						return '';
					}
				},
				data : [ {
					xAxis : 0,
					y : 350,
					name : '123',
					symbolSize : 20,
					symbol : 'none'
				}, {
					xAxis : 1,
					y : 350,
					name : '12345',
					symbolSize : 20,
					symbol : 'none'
				} ]
			}
		} ]
	};
	myChart.setOption(option);
}


// 作业总数
function subjectCount(rates){
	var myChart1 = echarts.init(document.getElementById('main1'));
	option1 = {
			title : {
				x : 'center',
				text : '作业总数',
				textStyle:{
			    fontSize:20
			    },
			},
			/**
			 * 悬浮提示框
			 */
			tooltip : {
				trigger : 'item',
				formatter : function(a)
				{
					return a[1]+":"+ a.data + "份";
				}
			},
			/**
			 * 工具栏
			 */
			toolbox : {
				show : false,
				feature : {
					dataView : {
						show : true,
						readOnly : false
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			grid : {
				borderWidth : 0,
				y : 35,
				y2 : 15
			},
			xAxis : [ {
				type : 'category',
				show : false,
				data : [ '总数']
			} ],
			yAxis : [ {
				type : 'value',
				show : false
			} ],
			series : [ {
				type : 'bar',
				itemStyle : {
					normal : {
						color : function(params) {
							// build a color map as your need.
						var colorList = [ '#27dbe5'];
						return colorList[params.dataIndex]
					},
					label : {
						show : true,
						textStyle:{
						    fontSize:16,
						    color:'white'
						},
						position : 'inside',
					    formatter : '{b}\n{c}份'
					  }
					}
				},
				data : rates,
				markPoint : {
					tooltip : {
						trigger : 'item',
						backgroundColor : 'rgba(0,0,0,0)',
						formatter : function(params) {
							return '';
						}
					},
					data : [ {
						xAxis : 0,
						y : 350,
						name : '123',
						symbolSize : 20,
						symbol : 'none'
					}, {
						xAxis : 1,
						y : 350,
						name : '12345',
						symbolSize : 20,
						symbol : 'none'
					} ]
				}
			} ]
		};
	myChart1.setOption(option1);
}