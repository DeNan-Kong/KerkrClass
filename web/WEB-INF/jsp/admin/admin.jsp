<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en" class="app">
	<head>
		<%@include file="/common/common.jspf"%>
		<script type="text/javascript">
		$(function() {
/* 			var tb = $("#loadhtml");
			tb.html(CommnUtil.loadingImg());
			tb.load(rootPath+"/tongjiUser.jspx"); */
			$("[nav-n]").each(function () {
					$(this).bind("click",function(){
							var nav = $(this).attr("nav-n");
							var sn = nav.split(",");
							var html = '<li><i></i>';
							html+='<a href="#">课课</a></li>';
							for(var i=0;i<2;i++){
								html+='<li><a href="javascript:void(0)">'+sn[i]+'</a></li>';
							}
							$("#topli").html(html);
							var tb = $("#loadhtml");
							tb.html(CommnUtil.loadingImg());
							tb.load(rootPath+sn[2]);
					});
				});
			});
</script>
<style type="text/css">
.logob
{
    background-image: url("/images/logoTea.png");
    background-size:cover;
}
.logban
{
    background-image: url("/images/logo/ban.png");
    background-size:cover;
}
.logtui
{
    background-image: url("/images/logo/tui.png");
    background-size:cover;
}
.logguan
{
    background-image: url("/images/logo/guan.png");
    background-size:cover;
}
.ke
{
    background-image: url("/images/logo/ke.png");
    background-size:cover;
}
.shen
{
    background-image: url("/images/logo/shen.png");
    background-size:cover;
}
</style>
	</head>
	<body class="" style="">
		<section class="vbox">
		<header class="bg-dark dk header navbar navbar-fixed-top-xs">
		<div class="navbar-header aside-md">
			<a class="btn btn-link visible-xs"
				data-toggle="class:nav-off-screen,open" data-target="#nav,html">
				<i class="fa fa-bars"></i> </a>
			<a href="#" class="navbar-brand" data-toggle="fullscreen">课课后台管理中心</a>
			<a class="btn btn-link visible-xs" data-toggle="dropdown"
				data-target=".nav-user"> <i class="fa fa-cog"></i> </a>
		</div>
		<ul class="nav navbar-nav hidden-xs">
			<li class="dropdown">
				<%--<a href="index.html#" class="dropdown-toggle dker"
					data-toggle="dropdown"> <i class="fa fa-building-o"></i> <span
					class="font-bold">Activity</span> </a>
				--%>
				<section
					class="dropdown-menu aside-xl on animated fadeInLeft no-borders lt">
				<div class="wrapper lter m-t-n-xs">
					<a href="index.html#" class="thumb pull-left m-r"> <img
							src="${ctx}/images/avatar.png" class="img-circle"> </a>
					<div class="clear">
						<a href="admin.jsp#"><span class="text-white font-bold">@Mike
								Mcalidek</span> </a>
						<small class="block">Art Director</small>
						<a href="index.html#" class="btn btn-xs btn-success m-t-xs">Upgrade</a>
					</div>
				</div>
				<div class="row m-l-none m-r-none m-b-n-xs text-center">
					<div class="col-xs-4">
						<div class="padder-v">
							<span class="m-b-xs h4 block text-white">245</span>
							<small class="text-muted">Followers</small>
						</div>
					</div>
					<div class="col-xs-4 dk">
						<div class="padder-v">
							<span class="m-b-xs h4 block text-white">55</span>
							<small class="text-muted">Likes</small>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="padder-v">
							<span class="m-b-xs h4 block text-white">2,035</span>
							<small class="text-muted">Photos</small>
						</div>
					</div>
				</div>
				</section>
			</li>
			<li>
				<div class="m-t m-l">
					<%--<a href="admin.jsp" class="dropdown-toggle btn btn-xs btn-primary"
						title="Upgrade"><i class="fa fa-long-arrow-up"></i>
					</a>
				--%>
				</div>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
			<li class="hidden-xs">
				<%--<a href="admin.jsp#" class="dropdown-toggle dk"
					data-toggle="dropdown"> <i class="fa fa-bell"></i> <span
					class="badge badge-sm up bg-danger m-l-n-sm count"
					style="display: inline-block;">3</span> </a>
				--%>
				<section class="dropdown-menu aside-xl">
				<section class="panel bg-white">
				<header class="panel-heading b-light bg-light">
				<strong>You have <span class="count"
					style="display: inline;">3</span> notifications </strong>
				</header>
				<div class="list-group list-group-alt animated fadeInRight">
					<a href="admin.jsp#" class="media list-group-item"
						style="display: block;"><span
						class="pull-left thumb-sm text-center"><i
							class="fa fa-envelope-o fa-2x text-success"></i> </span><span
						class="media-body block m-b-none">Sophi sent you a email<br>
							<small class="text-muted">1 minutes ago</small> </span> </a>
					<a href="admin.jsp#" class="media list-group-item"> <span
						class="pull-left thumb-sm"> <img
								src="${ctx}/images/avatar.png" alt="John said"
								class="img-circle"> </span> <span
						class="media-body block m-b-none"> Use awesome animate.css<br>
							<small class="text-muted">10 minutes ago</small> </span> </a>
					<a href="admin.jsp#" class="media list-group-item"> <span
						class="media-body block m-b-none"> 1.0 initial released<br>
							<small class="text-muted">1 hour ago</small> </span> </a>
				</div>
				<footer class="panel-footer text-sm">
				<a href="admin.jsp#" class="pull-right"><i class="fa fa-cog"></i>
				</a>
				<a href="iadmin.jsp#notes"
					data-toggle="class:show animated fadeInRight">See all the
					notifications</a>
				</footer>
				</section>
				</section>
			</li>
			<li class="dropdown hidden-xs">
				<%--<a href="admin.jsp#" class="dropdown-toggle dker"
					data-toggle="dropdown"><i class="fa fa-fw fa-search"></i>
				</a>
				--%>
				<section class="dropdown-menu aside-xl animated fadeInUp">
				<section class="panel bg-white">
				<form role="search">
					<div class="form-group wrapper m-b-none">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-info btn-icon">
									<i class="fa fa-search"></i>
								</button> </span>
						</div>
					</div>
				</form>
				</section>
				</section>
			</li>
			<li class="dropdown">
				<a href="admin.jsp#" class="dropdown-toggle" data-toggle="dropdown"> ${name} <b class="caret"></b>
				</a>
				<ul class="dropdown-menu animated fadeInRight">
					<span class="arrow top"></span>
					<%--<li>
						<a href="admin.jsp#">设置</a>
					</li>
					
					<li>
						<a href="admin.jsp">Profile</a>
					</li>
					<li>
						<a href="admin.jsp#"> <span
							class="badge bg-danger pull-right">3</span> Notifications </a>
					</li>
					
					<li>
						<a href="admin.jsp">帮助</a>
					</li>--%>
					<li>
						<a href="logoutAdminManage.jspx">退出</a>
					</li>
				</ul>
			</li>
		</ul>
		</header>
		<section>
		<section class="hbox stretch">
		<!-- .aside -->
		<aside class="bg-dark lter aside-md hidden-print hidden-xs" id="nav">
		<section class="vbox">
		<section class="w-f scrollable">
		<div class="slim-scroll" data-height="auto"
			data-disable-fade-out="true" data-distance="0" data-size="5px"
			data-color="#333333">
			<nav class="nav-primary hidden-xs">
			<ul class="nav">
				<li class="active">
					<a href="javascript:void(0)" class="active"> <i
						class="fa fa-dashboard icon"> <b class="ke bg-danger"></b> </i> <span
						class="pull-right"> <i class="fa fa-angle-down text"></i> <i
							class="fa fa-angle-up text-active"></i> </span> <span>首页</span> </a>
					<ul class="nav lt">
						<li class="active">
							<a href="javascript:void(0)" class="active"
								nav-n="首页,统计,/tongjiManage.jspx">
								<i class="fa fa-angle-right"></i> <span>统计</span> </a>
						</li>
						<li class="active">
							<a href="javascript:void(0)" class="active"
								nav-n="首页,日均增长,/toDayaddManage.jspx">
								<i class="fa fa-angle-right"></i> <span>日均增长</span> </a>
						</li>
						<li class="active">
							<a href="javascript:void(0)" class="active"
								nav-n="首页,信息反馈,/toFeedbackSales.jspx">
								<i class="fa fa-angle-right"></i> <span>课主任反馈</span> </a>
						</li>
						<li class="active">
							<a href="javascript:void(0)" class="active"
								nav-n="首页,心愿,/toWishManage.jspx">
								<i class="fa fa-angle-right"></i> <span>学生心愿</span> </a>
						</li>
                    </ul>
				</li>
				<li class="active">
                    <a href="javascript:void(0)" class="active"> <i
                        class="fa fa-dashboard icon"> <b class="logtui bg-danger"></b> </i> <span
                        class="pull-right"> <i class="fa fa-angle-down text"></i> <i
                            class="fa fa-angle-up text-active"></i> </span> <span>小教室</span> </a>
                    <ul class="nav lt">
                        <li class="active">
                            <a href="javascript:void(0)" class="active"
                                nav-n="机构,添加机构,/toAddJigouOrg.jspx">
                                <i class="fa fa-angle-right"></i> <span>添加机构</span></a>
                        </li>
                        <li class="active">
                            <a href="javascript:void(0)" class="active"
                                nav-n="机构,查询机构,/toJigouListOrg.jspx">
                                <i class="fa fa-angle-right"></i> <span>查询机构</span> </a>
                        </li>
                    </ul>
                </li>

			</ul>
			</nav>
			<!-- / nav -->
		</div>
		</section>
		<footer class="footer lt hidden-xs b-t b-dark">
		<div id="chat" class="dropup">
			<section class="dropdown-menu on aside-md m-l-n">
			<section class="panel bg-white">
			<header class="panel-heading b-b b-light">
			Active chats
			</header>
			<div class="panel-body animated fadeInRight">
				<p class="text-sm">
					No active chats.
				</p>
				<p>
					<a href="#" class="btn btn-sm btn-default">Start a chat</a>
				</p>
			</div>
			</section>
			</section>
		</div>
		<div id="invite" class="dropup">
			<section class="dropdown-menu on aside-md m-l-n">
			<section class="panel bg-white">
			<header class="panel-heading b-b b-light">
			John
			<i class="fa fa-circle text-success"></i>
			</header>
			<div class="panel-body animated fadeInRight">
				<p class="text-sm">
					No contacts in your lists.
				</p>
				<p>
					<a href="#" class="btn btn-sm btn-facebook"><i
						class="fa fa-fw fa-facebook"></i> Invite from Facebook</a>
				</p>
			</div>
			</section>
			</section>
		</div>
		<!--<a href="#nav" data-toggle="class:nav-xs"
			class="pull-right btn btn-sm btn-dark btn-icon"> <i
			class="fa fa-angle-left text"></i> <i
			class="fa fa-angle-right text-active"></i> </a>
		--><div class="btn-group hidden-nav-xs">   Copyright&copy;KERKR 2015
			<!--<button type="button" title="Chats"
				class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
				data-target="#chat">
				<i class="fa fa-comment-o"></i>
			</button>
			<button type="button" title="Contacts"
				class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown"
				data-target="#invite">
				<i class="fa fa-facebook"></i>
			</button>
		--></div>
		</footer>
		</section>
		</aside>
		<!-- /.aside -->
		<section id="content">
		<section id="id_vbox" class="vbox">
		<ul class="breadcrumb no-border no-radius b-b b-light" id="topli">
		</ul>
		<section class="scrollable" style="margin-top: 35px;">
		<div id="loadhtml"></div>
		</section>
		</section>
		</section>
		<aside class="bg-light lter b-l aside-md hide" id="notes">
		<div class="wrapper">
			Notification
		</div>
		</aside>
		</section>
		</section>
		</section>
		<!-- Bootstrap -->
		<div id="flotTip" style="display: none; position: absolute;"></div>
	</body>
</html>