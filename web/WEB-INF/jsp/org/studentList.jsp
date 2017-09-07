<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>学生信息</title>
        <script
            src="${pageContext.request.contextPath}/js/org/student.js"
            type="text/javascript"></script> 
    </head>
    <body>   
        <div style="margin-top:10px;margin-left: 50%;">
            <span style="width: 332px;height: 40px;font-size:25px;color: #64CDBD;">学生信息</span>
        </div>
        <div style="margin-left: 0px; margin-top: 0px;">
        <div class="col-md-6" style="height: 5%; width: 350px; margin-top: 10px;">年级：
			<select name="gradezero" style="height: 40px; width: 30%; margin-bottom: 0px;" id="gradezero">
                 <option value=""></option>
                 <option value="01">一年级</option>
                 <option value="02">二年级</option>
                 <option value="03">三年级</option>
                 <option value="04">四年级</option>
                 <option value="05">五年级</option>
                 <option value="06">六年级</option>
            </select>
            <input type="button" value="查询" class="btn btn-success btn-s-xs" id="go" style="margin-bottom:2px;">           
        </div>
        
        <div class="col-md-6" style="height: 5%; width: 350px; margin-top: 10px;margin-left:250px;">FROM
			<select name="gradeone" style="height: 40px; width: 30%; margin-bottom: 0px;" id="gradeone">
                 <option value=""></option>
                 <option value="01">一年级</option>
                 <option value="02">二年级</option>
                 <option value="03">三年级</option>
                 <option value="04">四年级</option>
                 <option value="05">五年级</option>
                 <option value="06">六年级</option>
            </select>        
        </div>
        <div class="col-md-6" style="height: 5%; width: 350px; margin-top: 10px;margin-left:-210px;">TO
			<select name="gradetwo" style="height: 40px; width: 30%; margin-bottom: 0px;" id="gradetwo">
                 <option value=""></option>
                 <option value="01">一年级</option>
                 <option value="02">二年级</option>
                 <option value="03">三年级</option>
                 <option value="04">四年级</option>
                 <option value="05">五年级</option>
                 <option value="06">六年级</option>
            </select>
            <input type="button" value="年级变换" class="btn btn-success btn-s-xs" id="changgo" style="margin-bottom:2px;">           
        </div>
        </div>
        
		
        <div class="col-md-6" style="height: 70%; width: 100%; margin-top: 20px;">
            <div id="teh_grid" style="height: 20%; width: 70%; float: left;"></div>
        </div>
    </body>
</html>