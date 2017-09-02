<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>更改信息</title>
		<script type="text/javascript" src="./js/work/update.js"></script>
	</head>
	<body>
	    <div class="form-group" style="width: 50%; margin-top: 50px;">
			<div class="col-sm-3">
				<label class="control-label">
					姓名
				</label>
			</div>
			<div class="col-sm-9">
				<input type="text" class="form-control" placeholder="请输入用户名"
						name="name" id="name" value="${name}">
			</div>
		</div>
		<div class="form-group" style="width: 50%; margin-top: 50px;">
			<div class="col-sm-3">
				<label class="control-label">
					科目
				</label>
			</div>
			<div class="col-sm-9">
				<!--<input type="text" class="form-control" placeholder="请输入用户名"
						name="userFormMap.userName" id="userName">
				-->
				<select class="form-control" name="subjectType" id="subjectType"></select>
			</div>
		</div>
		<div class="line line-dashed line-lg pull-in" style="width: 50%;"></div>
		<div class="form-group" style="width: 50%; margin-top: 50px;">
			<label class="col-sm-3 control-label">
				年级
			</label>
			<div class="col-sm-9">
				<select class="form-control" name="grade" id="grade"></select>
			</div>
		</div>
		<div class="line line-dashed line-lg pull-in" style="width: 50%;"></div>
		<div class="form-group" style="width: 50%; margin-top: 50px;">
			<label class="col-sm-3 control-label">
				地域
			</label>
			<div class="col-sm-9" style="color: red;">
				<select class="form-control" name="province" id="province"></select>
				<select class="form-control" name="city" id="city"></select>
			</div>
		</div>
		<div class="line line-dashed line-lg pull-in" style="width: 50%;" ></div>
		<div class="form-group" style="width: 50%; margin-top: 100px;text-align: right;">
			<button type="submit" id="ok" class="btn btn-success btn-s-xs">
				保存
			</button>
		</div>
		<input type="hidden" id="hid_grade" value="${grade}">
		<input type="hidden" id="hid_province" value="${province}">
		<input type="hidden" id="hid_city" value="${city}">
		<input type="hidden" id="hid_subjectType" value="${subjectType}">
		<input type="hidden" id="hid_userId" value="${userId}">
	</body>
</html>