$(function() {
	$('#startDate').val(getStartDate());
	$('#endDate').val(getEndDate());
	selectTime();

	var startDate=$('#startDate').val();
	var endDate=$('#endDate').val();
	$.post('dayAddManage.jspx',{'startDate':startDate,'endDate':endDate},function(data){
		if(data){
			tu(data);
		}
	},'json');
	
	$('#go').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		$.post('dayAddManage.jspx',{'startDate':startDate,'endDate':endDate},function(data){
			if(data){
				tu(data);
			}
		},'json')
	});
	
});


function selectTime(){
	 $('#startDate').click(function() {
	      var ev = $('#endDate').val();
	      var sv=$('#startDate').val();
	      if (ev) {
	        WdatePicker({
	          minDate: '2016-01-01',
	          maxDate: ev,
	          readOnly: true
	        });
	      } else {
	        WdatePicker({
	          onpicked: function() {
	            $('#endDate').focus();
	          },
	          minDate: sv,
	          maxDate : '%y-%M-%d',
	          readOnly: true
	        });
	      }
	    });
	 $('#endDate').click(function() {
	        var sv = $('#startDate').val();
	        var ev = $('#endDate').val();
	        if (sv) {
	          WdatePicker({
	            minDate: sv,
	            maxDate : '%y-%M-%d',
	            readOnly: true
	          });
	        } else {
	          $('#startDate').focus();
	        }
	   });
}


function tu(data) {
	var myChart = echarts.init(document.getElementById('main'));
	option = {
		title : {
			text : '日均注册量'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '老师','学生' ]
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : false
				},
				dataView : {
					show : false,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar' ]
				},
				restore : {
					show : false
				},
				saveAsImage : {
					show : true
				}
			}
		},
		calculable : true,
		xAxis : [ {
			type : 'category',
			data : data.date
		} ],
		yAxis : [ {
			type : 'value'
		} ],
		series : [ {
			name : '老师',
			type : 'bar',
			data : data.teacher,
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				} ]
			}
		},{
			name : '学生',
			type : 'bar',
			data : data.student,
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				} ]
			}
		} ]
	};
	myChart.setOption(option);
}

// 结束时间
function getEndDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate  
    return currentdate;
}

// 开始时间
function getStartDate(){
	var date=new Date();
	var yesterday_milliseconds=date.getTime()-1000*60*60*24*30;     
	var yesterday = new Date();     
	    yesterday.setTime(yesterday_milliseconds);     
	  
	var strYear = yesterday.getFullYear();  
	var strDay = yesterday.getDate();  
	var strMonth = yesterday.getMonth()+1;
	if(strMonth<10)  
	{  
		strMonth="0"+strMonth;  
	}
    if (strDay >= 0 && strDay <= 9) {
    	strDay = "0" + strDay;
    }
	datastr = strYear+"-"+strMonth+"-"+strDay;
	return datastr;
  }

/**
function Date2Start(date) {   
	if(date==null){
		return '';
	}
	var yearStr = (date.year+1900).toString();
	var monStr = zeroFillPrev(date.month+1);
	var dayStr = zeroFillPrev(date.date-7);
	return 	yearStr + '-' + monStr + '-' + dayStr;
}

function Date2String(date) {   
	if(date==null){
		return '';
	}
	var yearStr = (date.year+1900).toString();
	var monStr = zeroFillPrev(date.month+1);
	var dayStr = zeroFillPrev(date.date);
	return 	yearStr + '-' + monStr + '-' + dayStr;
}


//DateTime转String
function DateTime2String(datatime) {   
	if(datatime==null){
		return '';
	}
	var yearStr = (datatime.year+1900).toString();
	var monStr = zeroFillPrev(datatime.month+1);
	var dayStr = zeroFillPrev(datatime.date);
	var hourStr = zeroFillPrev(datatime.hours);
	var minStr = zeroFillPrev(datatime.minutes);
	var secStr = zeroFillPrev(datatime.seconds);
	return 	yearStr + '-' + monStr + '-' + dayStr
			+ ' ' + hourStr + ':' + minStr + ':' + secStr;
}

// 日期补零
function zeroFillPrev(v){
	var str = v.toString();
	if(str.length==1){
		str = '0' + str;
	}
	return str;
}*/
