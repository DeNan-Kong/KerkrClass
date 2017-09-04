$(function() {
	$('#startDate').val(getStartDate());
	$('#endDate').val(getEndDate());
	selectTime();

	// 初期检索
	var startDate=$('#startDate').val();
	var endDate=$('#endDate').val();
	var teacherId=$('#teacherId').val();
	createGridFid(startDate, endDate,teacherId);
	
	$('#go').click(function(){
		var startDate=$('#startDate').val();
		var endDate=$('#endDate').val();
		createGridFid(startDate, endDate, teacherId);
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

// 注册详情
function createGridFid(startDate,endDate,teacherId) {
	$('#teh_grid_sid').datagrid({
		pagination : true,
		pageSize : 10,
		url : 'sidUserListManage.jspx',
		title : '注册详情',
		method : 'post',
		width : '90%',
		height : '800px',
		fit : true,
		queryParams : {
			'startDate' : startDate,'endDate':endDate,'teacherId':teacherId
		},
		rownumbers : true,
		loadMsg : '正在努力为您查找中……',
		idField : 'id',
		singleSelect : true,
		columns : [ [ {
			field : 'phoneNumber',
			title : '电话',
			width : '150',
			align : 'center'
		}, {
			field : 'userName',
			title : '姓名',
			width : '150',
			align : 'center'
		}, {
			field : 'city',// 任意名字
			title : '所在地区',
			width : '120',
			align : 'center',
			formatter : function(val, rec){
				return rec.provinceName + ' / ' +rec.cityName;
			}
		}, {
			field : 'grade',
			title : '年级',
			width : '200',
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
		}, {
			field : 'createTime',
			title : '使用时间',
			width : '180',
			align : 'center'
		} ] ]
	});
}