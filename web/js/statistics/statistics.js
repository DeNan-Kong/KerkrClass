$(function() {
pigailiang();
});
function pigailiang(){
	var values=[];
	var userId=$('#userId').val();
	$.getJSON('shujuUser.jspx',{'userId':userId},function(data){
		if(data){
			pigai(data.values);
			haoping(data.rates);
		}
	},'json');
	
}


function haoping(rates){
	var myChart = echarts.init(document.getElementById('main'));
	option = {
		title : {
			x : 'center',
			text : '好评率',
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
				return a[1]+":"+ a.data + "%";
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
			y : 80,
			y2 : 60
		},
		xAxis : [ {
			type : 'category',
			show : false,
			data : [ '好评', '差评' ]
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
					var colorList = [ '#B5C334', '#cccccc' ];
					return colorList[params.dataIndex]
				},
				label : {
					show : true,
					textStyle:{
					    fontSize:16,
					    color:'white'
					},
					position : 'inside',
				    formatter : '{b}\n{c}%'
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
	myChart.setOption(option);
}



function pigai(values){
	var myChart1 = echarts.init(document.getElementById('main1'));
	option1 = {
			title : {
				x : 'center',
				text : '批改量',
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
				y : 80,
				y2 : 60
			},
			xAxis : [ {
				type : 'category',
				show : false,
				data : [ '上月', '本月' ]
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
						var colorList = [ '#B5C334', '#cccccc' ];
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
	myChart1.setOption(option1);
}