<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<title>在线JSON校验格式化工具（Be JSON）</title>
		 
		<meta name="keywords" content="在线,JSON,JSON 校验,格式化,xml转json 工具,json视图,可视化,程序,服务器,域名注册,正则表达式,测试,在线json格式化工具,json 格式化,json格式化工具,json字符串格式化,json 在线查看器,json在线,json 在线验证,json tools online,在线文字对比工具" />
		<meta name="description" content="在线,JSON,JSON 校验,格式化,xml转json 工具,json视图,可视化,程序,服务器,域名注册,正则表达式,测试,在线json格式化工具,json 格式化,json格式化工具,json字符串格式化,json 在线查看器,json在线,json 在线验证,json tools online,在线文字对比工具">
				<!-- Site CSS -->
		<script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
		<link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<script src="http://7bv9ya.com1.z0.glb.clouddn.com/jquery.cookie.js"></script>

		<style>
			.list-group-item a{padding-right:20px}
			#links a{font-size:13px}
			#desc1{font-size: 13px;}
			.newFeatureTip{
				  width: 13px;
				  height: 13px;
				    background-repeat: no-repeat;
				position: absolute;
				  top: 5px;color: red;
				  right: 10px;}
				  
				.newItem{
					  float: left;
					  color: red;
					  position: absolute;
					  margin-top: 2px;
					  margin-left: 8px;
				}
				.announce{
					color:red;
				}
				
				.nav > li:hover .dropdown-menu {display: block;}
		</style>
	</head>

	<body>
		<div class="aw-container-wrap">
			<div class="container">
				<div class="row">
					<div class="aw-content-wrap clearfix">
						<div class=" aw-main-content" style="min-height:700px;max-height:2000px">
							<script>
								
								var storageKey = "newtools20150817";
								if($.cookie(storageKey)==null){
									$("#convertTools").after('<span class="newFeatureTip">●</span>');
									$("#rgbhex").before('<span class="newItem">●</span>');
									$("#convertTools").click(function(){
										//localStorage.setItem(storageKey,"1");
										var d = new Date(); 
										d.setTime(d.getTime() + (240*60 * 60 * 1000));
										$.cookie(storageKey,1, { expires: d ,path:"/"});
										$(".newFeatureTip").text('');
									})
								}
						
															
							</script>
							<div style="clear:both"></div>
							<!-- content st --><script type="text/javascript">
	if (typeof JSON === 'undefined') {
		document.write('<sc' + 'ript type="text/javascript" src="c/js/json2.js"></sc' + 'ript>');
	}
</script>
<script src="/static/js/c/js/jquery-linedtextarea/jquery-linedtextarea.js" type="text/javascript"></script>
<link href="/static/js/c/js/jquery-linedtextarea/jquery-linedtextarea.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/static/js/c/js/inone.js"></script>

<!--[if IE]><link rel="stylesheet" href="/static/js/c/css/blueprint/lib/ie.css" type="text/css" media="screen, projection"><![endif]-->
<link rel="stylesheet" href="/static/js/c/css/screen.css" type="text/css" media="screen, projection">
<style>
	.linedwrap {
		width: 100%
	}
	.linedwrap .codelines .lineno {
		padding-top: 1px;
  		font-size: 13pt;
	}
	#json_input {
		padding: 0px;
		width: 100%;
		border-radius: 4px;
	}
	JSONValidate {
		border-radius: 4px;
	}
	.error {
		background: #FBE3E4;
		color: #D12F19;
		border-color: #FBC2C4;
	}
	.success {
		background: green;
		color: white;
		border-color: #FBC2C4;
	}
	.error,
	.notice,
	.success {
		margin-bottom: 1em;
		border: 2px solid #ddd;
		padding: .8em;
	}
	.hide {
		display: none;
	}
	.ab{width: 284px;height: 34px;font-family: 华文细黑;color: white;font-size: 17px;line-height: 40px;margin-left: 30%;text-align: center;}
	a{text-decoration: none;}
	a:hover {text-decoration: none;}
	#attention {  margin-top:10px;
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 4px;
  -webkit-box-shadow: none;
  font-size: 12px;
  box-shadow: none;}
  #attention li{font-size: 12px;}
  .panel-footer a {color: gray;font-size: 13px;text-decoration: none;}
</style>
<div class="panel panel-default">
	<div class="panel-body">
		<!--内容块开始-->
		<div class="banner clear">
			<div>
				<a href="http://www.imooc.com/course/list?mc_marking=4841ba423488a83116f4c72ef4548fff&amp;mc_channel=bejson&amp;mc_billing=%E5%85%8D%E8%B4%B9%E8%B5%A0%E9%80%81&amp;mc_keywords=&amp;mc_position=&amp;mc_business=" rel="external nofollow" target="_blank">
					<img src="http://ww1.sinaimg.cn/large/7a09523bjw1eu3ihfzv7sj20vo02idhf.jpg" style="width:100%">
				</a>
			</div>

		</div>
		<form id="JSONValidate" method="post" action="http://www.bejson.com/." name="JSONValidate" style="margin-top: 10px;">
			<input type="hidden" id="reformat" value="1" />
			<input type="hidden" id="compress" value="0" />
			<div>
				<textarea id="json_input" name="json_input" class="json_input" rows="30" spellcheck="false" placeholder="Enter JSON to validate, or a URL to JSON to validate."></textarea>
			</div>
			<div class="validateButtons clear">
				<div class="left" style="float:left">
					<div class="btn-group" role="group" aria-label="...">
						<button name="validate" id="validate" value="Validate" class="btn btn-primary">校验</button>
						<input name="validate" class="btn btn-danger" onclick="javascript:$('#json_input').focus(); " type="reset" value="清空" />
					</div>
				</div>
				
			</div>
		</form>
		<div style="clear:both;"></div>

		<pre id="results" style="display: none;"></pre>
	</div>
	
	<form name="alipay_form" style="padding-bottom: 0;border:none;" method="post" action="https://shenghuo.alipay.com/send/payment/fill.htm" target="_blank" accept-charset="GBK" onsubmit="document.charset='gbk';">
		<input type="hidden" value="ij2ee@139.com" name="optEmail" />
		<input type="hidden" value="10" name="payAmount" />
		<input type="hidden" name="title" placeholder="付款说明" value="打赏你的" />
		<input type="hidden" name="memo" placeholder="付款说明" value="老夫打赏你杯咖啡钱,拿去不谢！" />
	</form>

	<!--内容块结束-->
<div class="panel-footer">
	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">扫描二维码付款</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div style="clear: both;"></div>
	<div style="float: left;">[<a href='http://www.juapk.com' target='_blank' title='巨卓网'>巨卓网</a>]
[<a href='http://www.zuidaima.com' target='_blank' title='最代码'>最代码</a>][<a target='_blank' title='路饭网' href="http://www.45fan.com">路饭网</a>][<a href="http://www.ibilibili.com/" target="_blank">blibili视频mp3解析站</a>]<a href="http://www.miibeian.gov.cn/" rel="external nofollow" target="blank" class="beian">蜀ICP备14009725号</a>
</div>

<div  style="float: right;"><a href="http://www.qiniu.com" title="BeJson云存储赞助商:七牛云" target="_blank"><img  src="http://assets.qiniu.com/qiniu-transparent.png" style="height:54px"></a></div>
<div style="clear: both;"></div>

</div>

</div>

<!-- content ed -->


</div></div></div></div></div>
<div style="display:none"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_3302454'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s9.cnzz.com/stat.php%3Fid%3D3302454' type='text/javascript'%3E%3C/script%3E"));</script></div>
</body></html>