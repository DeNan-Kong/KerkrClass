$(function() {
	$('#addBtn').click(function() {
		
		var orgPhoneNumber = $('#orgPhoneNumber').val();
		var orgName = $('#orgName').val();
		var orgAddress = $('#orgAddress').val();
		var password = $('#password').val();

		if(orgPhoneNumber == null || orgPhoneNumber == ""){
			alert('请输入手机号');
			return;
		}
		if(orgName == null || orgName == ""){
			alert('请输入机构名');
			return;
		}
		if(orgAddress == null || orgAddress == ""){
			alert('请输入机构地址');
			return;
		}
		if(password == null || password == ""){
			alert('请输入初始密码');
			return;
		}
		
		$('#addBtn').attr("disabled","disabled");
		password=$.md5(password);
		$.post('addJigouOrg.jspx', {
			'orgPhoneNumber' : orgPhoneNumber,
			'orgName' : orgName,
			'orgAddress' : orgAddress,
			'password' : password
		}, function(data) {
			if (data.code=="1000") {
				alert('添加成功！');
			}else{
				alert(data.message);
			}
		}, 'json');
	});
})