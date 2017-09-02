<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<html lang="en" class="app">
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript">
        $(function () {
            var tb = $("#loadhtml");
            tb.html(CommnUtil.loadingImg());
            tb.load(rootPath + "/toStudentListOrg.jspx");
            $("[nav-n]").each(function () {
                $(this).bind("click", function () {
                    var nav = $(this).attr("nav-n");
                    var sn = nav.split(",");
                    var html = '<li><i></i>';
                    html += '<a href="#">课课</a></li>';
                    for (var i = 0; i < 2; i++) {
                        html += '<li><a href="javascript:void(0)">' + sn[i] + '</a></li>';
                    }
                    $("#topli").html(html);
                    var tb = $("#loadhtml");
                    tb.html(CommnUtil.loadingImg());
                    tb.load(rootPath + sn[2]);
                });
            });
        });
    </script>
    <style type="text/css">
        .logob {
            background-image: url("${ctx}/images/logoTea.png");
            background-size: cover;
        }
    </style>
</head>
<body class="" style="">
<section class="vbox">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
        <div class="navbar-header aside-md" style="width:400px;">
            <a class="btn btn-link visible-xs"
               data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                <i class="fa fa-bars"></i> </a>
            <a href="#" class="navbar-brand" data-toggle="fullscreen">${orgName}</a>
            <a class="btn btn-link visible-xs" data-toggle="dropdown"
               data-target=".nav-user"> <i class="fa fa-cog"></i> </a>
        </div>
        <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
            <li class="dropdown">
                <a href="admin.jsp#" class="dropdown-toggle" data-toggle="dropdown"> ${name} <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <span class="arrow top"></span>
                    <li>
                        <a href="logoutOrg.jspx">退出</a>
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
                            <!-- nav -->
                            <nav class="nav-primary hidden-xs">
                                <ul class="nav">

                                    <!-- <li class="active"> 某一项展开-->
                                    <li class="active">
                                        <a href="javascript:void(0)" class="active"> <i
                                                class="fa fa-dashboard icon"> <b class="logob bg-danger"></b> </i> <span
                                                class="pull-right"> <i class="fa fa-angle-down text"></i> <i
                                                class="fa fa-angle-up text-active"></i> </span> <span>首页</span> </a>
                                        <ul class="nav lt">
                                            <li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,添加老师,/toAddTeacherOrg.jspx">
                                                    <i class="fa fa-angle-right"></i> <span>添加老师</span> </a>
                                            </li>
                                            <li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,添加学生,/toAddStudentOrg.jspx">
                                                    <i class="fa fa-angle-right"></i> <span>添加学生</span> </a>
                                            </li>
                                            <li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,查询老师,/toTeaListOrg.jspx">
                                                    <i class="fa fa-angle-right"></i> <span>查询老师</span> </a>
                                            </li>
                                            <li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,查询学生,/toStudentListOrg.jspx">
                                                    <i class="fa fa-angle-right"></i> <span>查询学生</span> </a>
                                            </li>
                                            <li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,上传视频,/toUploadVieoOrg.jspx">
                                                    <i class="fa fa-angle-right"></i> <span>上传视频</span></a>
                                            </li>
                                            <%--<li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,浏览视频,/toUploadVieoOrg.jspx">
                                                    <i class="fa fa-angle-right"></i> <span>浏览视频</span> </a>
                                            </li>--%>

                                            <li class="active">
                                                <a href="javascript:void(0)" class="active"
                                                   nav-n="首页,修改密码,/toUpdatePwdOrg.jspx"> <i
                                                        class="fa fa-angle-right"></i>
                                                    <span>修改密码</span> </a>
                                            </li>
                                            <li class="active">
                                                <a href="logoutOrg.jspx" class="active">
                                                    <i class="fa fa-angle-right"></i> <span>退出账号</span> </a>
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
                        </div>
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