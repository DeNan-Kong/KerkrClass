$(function() {
	$('#addBtn').click(function() {
		
		var phoneNumber = $('#phoneNumber').val();
		var oil = $('#oil').val();
		var comment = $('#comment').val();

		if(phoneNumber == null || phoneNumber == ""){
			alert('请输入手机号');
			return;
		}
		if(oil == null || oil == ""){
			alert('请输入油量');
			return;
		}
		if(comment == null || comment == ""){
			alert('请输入添加原因');
			return;
		}
		
		$('#addBtn').attr("disabled","disabled");
		$.post('addOilManage.jspx', {
			'phoneNumber' : phoneNumber,
			'oil' : oil,
			'comment' : comment
		}, function(data) {
			if (data.code=="1000") {
				alert('加油成功！');
			}else{
				alert(data.message);
			}
		}, 'json');
	});
})