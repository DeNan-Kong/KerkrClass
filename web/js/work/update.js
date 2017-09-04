$(function() {
	var subject_arr = [ '数学', '英语', '语文' ];
	var subject_code_arr = [ '02', '03', '01' ];
	var grade_arr = [ '一年级', '二年级', '三年级', '四年级', '五年级', '六年级' ];
	var grade_code_arr = [ '01', '02', '03', '04', '05', '06' ];

	var subjectType = $('#hid_subjectType').val();
	var grade = $('#hid_grade').val();
	var province = $('#hid_province').val();
	var city = $('#hid_city').val();
	var userId = $('#hid_userId').val();
	
	// 科目
	$('#subjectType').empty();
	var ops;
	for ( var i = 0; i < subject_arr.length; i++) {
		if (subject_code_arr[i] == subjectType) {
			ops += '<option selected="selected" value="' + subject_code_arr[i]
					+ '">' + subject_arr[i] + '</option>';
		} else {
			ops += '<option value="' + subject_code_arr[i] + '">' + subject_arr[i]
					+ '</option>';
		}
	}
	$('#subjectType').append(ops);

	// 年级
	$('#grade').empty();
	var ops0;
	for ( var i = 0; i < grade_arr.length; i++) {
		if (grade_code_arr[i] == grade) {
			ops0 += '<option selected="selected" value="' + grade_code_arr[i] + '">'
					+ grade_arr[i] + '</option>';
		} else {
			ops0 += '<option value="' + grade_code_arr[i] + '">' + grade_arr[i]
					+ '</option>';
		}
	}
	$('#grade').append(ops0);

	// 省
    $.post('listProvinceSales.jspx',{'':''},function(data){
		if (data != null) {
			$('#province').empty();
			var ops1;
			for ( var i = 0; i < data.length; i++) {
				if(data[i+1] == province){
					ops1 += '<option  selected="selected"  value="' + data[i+1] + '">'
					+ data[i] + '</option>';
				}else{
					ops1 += '<option value="' + data[i+1] + '">'
					+ data[i] + '</option>';
				}
				i++;
			}
			$('#province').append(ops1);
		}
	},'json');

    // 市
	$.post('listCitySales.jspx',{'cityCode':province},function(data){
		if (data != null) {
			$('#city').empty();
			var ops = '';
			for ( var i = 0; i < data.length; i++) {
				if(data[i+1] == city){
					ops += '<option selected="selected" value="' + data[i+1] + '">'
					+ data[i] + '</option>';
				}else{
					ops += '<option value="' + data[i+1] + '">'
					+ data[i] + '</option>';
				}
				i++;	
			}
			$('#city').append(ops);
		}
	},'json');
	
	 $('#province').change(function(){
		var cityCode=$(this).val();
		$.post('listCitySales.jspx',{'cityCode':cityCode},function(data){
			if (data != null) {
				$('#city').empty();
				var ops = '';
				for ( var i = 0; i < data.length; i++) {
					ops += '<option value="' + data[i+1] + '">'
					+ data[i] + '</option>';
					i++;	
				}
				$('#city').append(ops);
			}
		},'json');
	});

	$('#ok').click(function() {
		
		var subjectType = $('#subjectType').val();
		var province = $('#province').val();
		var city = $('#city').val();
		var name=$('#name').val();
		var grade = $('#grade').val();
		if (subjectType == '-1') {
			alert('请选择学科！');
			return;
		}
		if (grade == '-1') {
			alert('请选择年级！');
			return;
		}
		if (province == '-1') {
			alert('请选择省份！');
			return;
		}
		if (city == '') {
			alert('请选择城市！');
			return;
		}
		if (name == '') {
			alert('请输入姓名！');
			return;
		}

		$.post('updateInfoSales.jspx', {
			'teacherId' : userId,
			'subjectType' : subjectType,
			'provinceCode' : province,
			'cityCode' : city,
			'grade' : grade,
			'name':name
		}, function(data) {
			if (data.code=="1000") {
				alert('个人信息修改成功！');
				/*
				 * var tb = $("#loadhtml"); tb.html(CommnUtil.loadingImg());
				 * tb.load(rootPath+"/taskSubject.jspx?subjectType="+data.subjectType+"&grade="+data.grade+"&province="+data.province);
				 */
				//window.location.href = 'login.jsp'
			}
		}, 'json');
	});
})