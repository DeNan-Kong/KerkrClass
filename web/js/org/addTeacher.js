$(function() {
	$('#addBtn').click(function() {
		
		var teaPhone = $('#teaPhone').val();
		var teaName = $('#teaName').val();
		var teaSubject = $('#teaSubject').val();
		var teaGrade = $('#teaGrade').val();
		var password = $('#password').val();

		if(teaPhone == null || teaPhone == ""){
			alert('请输入手机号');
			return;
		}
		if(teaName == null || teaName == ""){
			alert('请输入姓名');
			return;
		}
		if(teaSubject == null || teaSubject == ""){
			alert('请输入科目');
			return;
		}
		if(teaGrade == null || teaGrade == ""){
			alert('请输入年级');
			return;
		}
		if(password == null || password == ""){
			alert('请输入初始密码');
			return;
		}
		
		$('#addBtn').attr("disabled","disabled");
		password=$.md5(password);
		$.post('addTeacherOrg.jspx', {
			'teaPhone' : teaPhone,
			'teaName' : teaName,
			'teaSubject' : teaSubject,
			'teaGrade' : teaGrade,
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