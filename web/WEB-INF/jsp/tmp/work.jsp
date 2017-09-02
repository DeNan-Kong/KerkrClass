<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="/common/common.jspf"%>
		
		<%
			String str = request.getSession().getAttribute("jsonData").toString();
			System.out.println(str + "=====================");
		%>
		<script type="text/javascript">
		var json=<%=str%>
		</script>
		<script type="text/javascript" src="./js/drag.js"></script>
		<script type="text/javascript" src="./js/work/work.js"></script>
		<link rel="stylesheet" href="./css/work.css" type="text/css">
		<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
	text-align: right;
}

html,body,#form,.panel-body,.form-group {
	height: 100%;
}

/**made in zw**/
.panelzwdiv {
	height: 260px;
	width: 100%;
	bottom: 10px;
	position: absolute;
	overflow: hidden;
}

.rot1 {
	-moz-transform: rotate(90deg);
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
	filter: progid :       DXImageTransform.Microsoft.BasicImage (     
		 rotation =  
		    1 );
	-ms-filter: progid :       DXImageTransform.Microsoft.BasicImage (    
		  rotation =   
		   1 );
}

.rot2 {
	-moz-transform: rotate(180deg);
	-webkit-transform: rotate(180deg);
	transform: rotate(180deg);
	filter: progid :       DXImageTransform.Microsoft.BasicImage (     
		 rotation =  
		    2 );
	-ms-filter: progid :       DXImageTransform.Microsoft.BasicImage (    
		  rotation =   
		   2 );
}

.rot3 {
	-moz-transform: rotate(270deg);
	-webkit-transform: rotate(270deg);
	transform: rotate(270deg);
	filter: progid :       DXImageTransform.Microsoft.BasicImage (     
		 rotation =  
		    3 );
	-ms-filter: progid :       DXImageTransform.Microsoft.BasicImage (    
		  rotation =   
		   3 );
}

.right {
	width: 136px;
	height: 39px;
}

.col-sm-9 {
	width: 50%;
	float: left;
	text-align: left;
	height: 100%;
}

.col-sm-10 {
	width: 50%;
	float: left;
	height: 100%;
	text-align: center;
}

label[class ^="btn btn-default"] {
	margin-top: -4px;
}
</style>

	</head>
	<body>
		<div class="l_err" style="width: 100%; margin-top: 2px;"></div>

		<div class="panel-body">
			<div class="form-group"
				style="margin-bottom: auto; margin-right: auto; margin-left: auto;">
				<div id="dragContainer" class="col-sm-9"
					style="padding-left: 0px; padding-right: 0px;">
					<img alt="" src="${ctx}/${subject.imageUrl}" id="ming"
						style="max-width: 100%;">
				</div>
				<div class="col-sm-10"
					style="text-align: center; padding-left: 0px; padding-right: 0px;">
					<div
						style="padding: 5px; width: 100%; height: 55%; float: left; border: solid 1px #cccccc; overflow: scroll;">
						<ul id="tt" class="easyui-tree"></ul>
					</div>
					<div class="panelzwdiv">
						<div style="text-align: center; height: 45px; width: 100%;">
							<img style=" height: 45px;cursor: pointer;" src="./images/rotLeft.png" id="rotLeft">
							<img style="height: 45px;cursor: pointer;" src="./images/rotRight.png" id="rotRight">
						</div>
						<input type="button" id="right"
							style="width: 50%; height: 35px; margin-top: 3%; color: white;" value="正确" />
						<input type="button" id="wrong"
							style="width: 50%; height: 35px; color: white;" value="错误" />
							
						
						<input type="button" id="kbq"
							style="width: 50%; height: 35px; color: white;" value="看不清楚" />
						<input type="hidden" id="subjectType" value="${subjectType}">
						<input type="hidden" id="rootPath" value="${ctx}">
						<div
							style="float: left; width: 100%; height: 20%; margin-top: 2%; text-align: center;">
							<input type="button" value="提交" class="btn btn-success btn-s-xs"
								id="submit">
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="${ctx}/js/bootstrap-filestyle.min.js"></script>
	</body>
</html>