$(function(){
	roat();
});

function roat() {
	var param = {
		right : document.getElementById("rotRight"),
		left : document.getElementById("rotLeft"),
		img : document.getElementById("ming"),
		rot : 0
	};
	var fun = {
		right : function() {
			param.rot += 1;
			param.img.className = "rot" + param.rot;
			if (param.rot === 3) {
				param.rot = -1;
			}
		},
		left : function() {
			param.rot -= 1;
			if (param.rot === -1) {
				param.rot = 3;
			}
			param.img.className = "rot" + param.rot;
		}
	};
	param.right.onclick = function() {
		fun.right();
		return false;
	};
	param.left.onclick = function() {
		fun.left();
		return false;
	};

}
function look(texa) {
}
function closeRight(rDivId){
	$('#'+rDivId).hide();
}
function closeDiv(divId){
	$('#'+divId).hide();
}

$(function() {
	// 根路径
	var rootPath = $('#rootPath').val();
	var picFlag = 0;
	if(json.length!=0){
		$("#ming").attr("src",rootPath+'/'+json[0].imageUrl);
		//$('#id').val(json[0].id);
		//$('#subjectId').val(json[0].subjectId);
	}
	var subjectType=$('#subjectType').val();
	var id="";
	var subjectId="";
	// 结果数组
	var resultArr = [];
	//不清楚数组
	var badArr=[];
	$('#tt').tree( {
		url : 'listKey.jspx?text='+subjectType,
		method : 'post',
		checkbox : true
	})
	$('#ok').click(function() {
		var nodes = $('#tt').tree('getChecked');
		var s = '';
		for ( var i = 0; i < nodes.length; i++) {
			if (s != '')
				s += ',';
			s += nodes[i].text;
		}
		$('#answerKey').val(s);
	});
	var texa = [];
	var flag = 0;
	var rFlag=0;
	$('#right')
			.click(function() {
				rFlag = rFlag + 1;
				var obj = rFlag + '';
				var rDivId='rdiv'+rFlag+'';
				// 方式一
				obj = $("<div style='width:70%;height:20%;' id="+rDivId+" ondblclick=closeRight('"+rDivId+"')><img class='right'  onmousedown='return false;' style='max-width: 40%;'  src='./images/right.png'/></div>");
					/*
					 * 方式二 elem.draggable({ containment : '#dragContainer',
					 * scroll : false });
					 */
					obj.dragDrop( {
						fixarea : [ 0, $('#dragContainer').width(), 0,
								$('#dragContainer').height() - 50 ],
						callback : function(params) {
							var left = (params.moveX / $('#dragContainer')
									.width()).toFixed(2) * 100 + '%';
							var top = (params.moveY / $('#dragContainer')
									.height()).toFixed(2) * 100 + '%';
							obj.css( {
								'left' : left,
								'top' : top
							});
						}
					});
					$('#dragContainer').append(obj);
				});
	$('#wrong')
			.click(
					function() {
						flag = flag + 1;
						var obj = flag + '';
						var divId='div'+flag+'';
						obj = $("<div style='width: 50%; height: 20%;' id="+divId+" ondblclick=closeDiv('"+divId+"')><img src='./images/wrong.png' onmousedown='return false;' onclick=look('"
								+ flag
								+ "')  id=img"
								+ flag
								+ "; style='max-width: 40%;float: left;'>"
								+ "<textarea onpropertychange='this.style.height=this.scrollHeight;'  oninput='this.style.height = this.scrollHeight;'  id='"
								+ flag
								+ "'style='overflow-y: hidden;height:40px;display:block;max-width: 50%; margin-left: 2%; border: 1px solid#d6d6d6; border-radius: 5px;resize: none;' /></textarea>");
						obj.dragDrop( {
							fixarea : [ 0, $('#dragContainer').width(), 0,
									$('#dragContainer').height() - 50 ],
							callback : function(params) {
								var left = (params.moveX / $('#dragContainer')
										.width()).toFixed(2) * 100 + '%';
								var top = (params.moveY / $('#dragContainer')
										.height()).toFixed(2) * 100 + '%';
								obj.css( {
									'left' : left,
									'top' : top
								});
							}
						});
						texa.push(flag);
						$('#dragContainer').append(obj);
					});

	// 看不清 推送
	$('#kbq').click(function() {
		if (picFlag == 0) {
			id=json[0].id;
			subjectId = json[0].subjectId;
		}else{
			id=json[picFlag].id;
			subjectId = json[picFlag].subjectId;
		}
		$.post('pushUser.jspx', {
			'id' : id,
			'subjectId':subjectId
		}, function(data) {
			if (data) {
				picFlag = picFlag + 1;
				resultArr.push(data.code);
				badArr.push(data.code);
				if (picFlag == json.length) {
					//alert('已经是最后一张了！')
				} else {
					texa=[];
					flag=0;
					//tree清空
					$('#tt').tree({cascadeCheck:$(this).is(':checked')})
					$('#dragContainer').html('');
					id = json[picFlag].id;
					subjectId = json[picFlag].subjectId;
					elem1 = $('<img id="ming" style="max-width: 100%; "  src="'
							+ rootPath + '/' + json[picFlag].imageUrl
							+ '"/>');
					$('#dragContainer').append(elem1);
					roat();
				}
				if (resultArr.length == json.length) {
					alert('批改完成')
					$.post('updateTask.jspx',{'subjectId':data.code,'badLength':badArr.length},function(data){
					if(data){
						var tb = $("#loadhtml");
						tb.html(CommnUtil.loadingImg());
						tb.load(rootPath+"/listTask.jspx?userId="+data.userId+"&status=0&type=0");
					}
					},'json')
				}
				
			}
		}, 'json');
	})
	// 提交按钮
	$('#submit').click(function() {
		var nodes = $('#tt').tree('getChecked');
		var answerKey = '';
		for ( var i = 0; i < nodes.length; i++) {
			if (answerKey != '')
				answerKey += ',';
			answerKey += nodes[i].text;
		}
		var content = "";
		$.each(texa, function(i, val) { undefined
			var str=$('#' + val).val();
				content = content + str + "|"
		});
		var contents = content.substring(0, content.length - 1);
		if (picFlag == 0) {
			subjectId = json[0].subjectId;
			id=json[0].id;
		}else{
			subjectId = json[picFlag].subjectId;
			id=json[picFlag].id;
		}
		/*if(texa.length!=0&&answerKey==''){
			alert('请勾选知识点！')
			return;
		}*/
		var imageUrl = $('#dragContainer').html();
		if(imageUrl.indexOf('ondblclick')==-1){
			alert('未批改，不能提交!')
		}else{
			$.post('addAnswer.jspx', {
				'id' : id,
				'subjectId' : subjectId,
				'imageUrl' : imageUrl,
				'content' : contents,
				'answerKey' : answerKey
			}, function(data) {
				if (data) {
					resultArr.push(data.code);
					picFlag = picFlag + 1
					if (picFlag == json.length) {
						$('#next').unbind("click");
					} else {
						texa=[];
						flag=0;
						$('#tt').tree({cascadeCheck:$(this).is(':checked')})
						$('#dragContainer').html('');
						id = json[picFlag].id;
						subjectId = json[picFlag].subjectId;
						elem1 = $('<img id="ming" style="max-width: 100%; "  src="'
								+ rootPath + '/' + json[picFlag].imageUrl
								+ '"/>');
						$('#dragContainer').append(elem1);
						roat();
					}
					if (resultArr.length == json.length) {
						alert('批改完成')
						$.post('updateTask.jspx',{'subjectId':data.code,'badLength':badArr.length},function(data){
						if(data){
							var tb = $("#loadhtml");
							tb.html(CommnUtil.loadingImg());
							tb.load(rootPath+"/listTask.jspx?userId="+data.userId+"&status=0&type=0");
						}
						},'json')
					}
				}
			},'json');
		}
	});
	// 下一张图片
	$('#next').click(
			function() {
				picFlag = picFlag + 1;
				if (picFlag == json.length) {
					alert('已经到底了！')
					$('#next').unbind("click");
				} else {
					texa=[];
					flag=0;
					$('#dragContainer').html('');
					id = json[picFlag].id;
					subjectId = json[picFlag].subjectId;
					elem1 = $('<img id="ming" style="max-width: 100%; "  src="'
							+ rootPath + '/' + json[picFlag].imageUrl
							+ '"/>');
					$('#dragContainer').append(elem1);
					roat();
				}
			});
})