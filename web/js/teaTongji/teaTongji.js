$(function() {
	$('#sendBtn').click(function(){
		var phoneNumber=$('#phoneNumber').val();
		var sid=$('#sid').val();
		$.post('sendSidManage.jspx',{'phoneNumber':phoneNumber,"sid":sid},function(data){
			if(data.result == "success"){
				alert("发送成功");
			}else{
				alert("发送失败");
			}
		},'json');
	});
});

