$(function() {
	$('#addBtn').click(function() {
		
		var phoneNumber = $('#phoneNumber').val();
		var userName = $('#userName').val();
		var grade = $('#grade').val();
		var password = $('#password').val();

		if(phoneNumber == null || phoneNumber == ""){
			alert('请输入手机号');
			return;
		}
		if(userName == null || userName == ""){
			alert('请输入姓名');
			return;
		}
		if(grade == null || grade == ""){
			alert('请输入年级');
			return;
		}
		if(password == null || password == ""){
			alert('请输入初始密码');
			return;
		}
		
		$('#addBtn').attr("disabled","disabled");
		password=$.md5(password);
		$.post('addStudentOrg.jspx', {
			'phoneNumber' : phoneNumber,
			'userName' : userName,
			'grade' : grade,
			'password' : password
		}, function(data) {
			if (data.code=="1000") {
				alert('添加成功！');
			}else{
				alert(data.message);
			}
			$('#addBtn').removeAttr("disabled");
		}, 'json');
	});
})