<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keyword" content="webDemo">
    <link rel="shortcut icon" href="<%=basePath%>assets/images/logo.ico">
    <title>简单的博客系统</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/style-responsive.css" rel="stylesheet">
    <script src="<%=basePath%>assets/js/jquery.js"></script>
    <script src="<%=basePath%>assets/js/jquery.cookie.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <style type="text/css">
        body {
            font-family: STFangSong, Helvetica, Arial, Vernada, Tahoma, STXihei, "Microsoft YaHei", "Songti SC", SimSun, Heiti, sans-serif;
        !important;
        }
    </style>
    <script type="application/javascript">
        $(document).ready(function () {
            var uid = $.cookie("uid");
            var uname = $.cookie("username");
            if (uname != null) {
                $("#top_menu").html
                ('<li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle"' +
                    ' href="#" title="">' +
                    '<i class="fa fa-user" aria-hidden="true"></i>' +
                    '&nbsp;' + uname + '</a><ul class="dropdown-menu extended tasks-bar">' +
                    '<div class="notify-arrow notify-arrow-green"></div><li>' +
                    '<p class="green">' + uname + '</p> </li> <li class="external"> ' +
                    '<a href="changePassword.jsp"><i class="fa fa-key" aria-hidden="true"></i>修改密码</a>' +
                    '<a href="logout/'+uid+'" class="logout-button"><i class="fa fa-sign-out" aria-hidden="true"></i> ' +
                    '注销</a></li></ul></li>');
            }

            $("li#mainPage").addClass("mt active");
            $("#myDiv").load("homePage.jsp");
            $("#register").click(function () {
                $("#myDiv").load("register.jsp");
            });
            $("#login").click(function () {
                $("#myDiv").load("login.jsp");
            });
            $("#index").click(function () {
                $("li").removeClass("mt active");
                $("li#mainPage").addClass("mt active");
                $("#myDiv").load("articleList/" + uid);
            });
            $("#source").click(function () {
                $("li").removeClass("mt active");
                $("li#articleWt").addClass("mt active");
                $("#myDiv").load("articleWt.jsp");
            });
            $("#accountId").click(function () {
                $("li").removeClass("mt active");
                $("li#account").addClass("mt active");
                $("#myDiv").load("account/" + uid);
            });
        });
    </script>
</head>

<body>
<section id="container">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation">
                <img src="assets/images/logo.ico" height="30px" width="30px">
            </div>
        </div>
        <!--logo start-->
        <a href="#" class="logo"><b>简单博客系统</b></a>
        <!--logo end-->
        <div class="nav notify-row">
            <!--  notification start -->
            <ul class="nav top-menu" id="top_menu">
                <li><a href="#" id="register">注册</a></li>
                <li><a href="#" id="login">登录</a></li>
            </ul>
            <!--  notification end -->
        </div>
    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <aside>
        <div id="sidebar" class="nav-collapse scrollable">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <li>
                    <img src="<%=basePath%>assets/images/touxiang.jpg" height="180px" width="180px">

                </li>
                <li id="mainPage" class="mt active">
                    <a href="#" id="index">
                        主页
                    </a>
                </li>
                <li id="articleWt">
                    <a href="#" id="source">
                        写文章
                    </a>
                </li>
                <li id="account" class="sub-menu">
                    <a href="#" id="accountId">
                        账户
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">

            <div class="row mt">
                <div class="col-lg-12">

                    <div class="showback">
                        <div class="site-index">
                            <div class="jumbotron">
                                <div id="myDiv"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <! --/wrapper -->
    </section><!-- /MAIN CONTENT -->

    <!--main content end-->
    <!--footer start-->
    <footer class="footer">
        <p class="pull-left"></p>
        <p class="pull-right">&copy; www.caihaolun.org 2016</p>
    </footer>
    <!--footer end-->
</section>
<!--script for this page-->

<script>
</script>

</body>
</html>
