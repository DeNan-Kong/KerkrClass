$(function() {
	$('#tixianBtn').click(function(){
		var userFlag = $('#userFlag').val();
		
		// 判断是否提现日
		if($('#tixianDay').val() != '1'){
			if(userFlag == '0'){
				// 普通老师
				alert('您来早啦，下周五再来提现哦！');
			}else if(userFlag == '1'){
				// 机构
				alert('您来早啦，下月1号再来提现哦！');
			}
			return;
		}
		
		// 判断当天是否已经提现
		if($('#hadTixian').val() == '1'){
			
			if(userFlag == '0'){
				// 普通老师
				alert('本周已提现，下次再来！');
			}else if(userFlag == '1'){
				// 机构
				alert('本月已提现，下次再来！');
			}
			return;
		}
		//iframe层-父子操作
		layer.open({
		  title:'提现',
		  type: 2,
		  area: ['300px', '330px'],
		  fix: false, //不固定
		  maxmin: true,
		  content: 'toTixianManage.jspx'
		});
		
		$('#tixianBtn').attr("disabled","true");
	});
});

