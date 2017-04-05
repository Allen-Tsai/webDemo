<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/1
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <link rel="shortcut icon" href="<%=basePath%>assets/images/logo.ico">
    <link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/style-responsive.css" rel="stylesheet">
    <script src="<%=basePath%>assets/js/jquery.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <style type="text/css">
        body {
            font-family: STFangSong, Helvetica, Arial, Vernada, Tahoma, STXihei, "Microsoft YaHei", "Songti SC", SimSun, Heiti, sans-serif;
        !important;
        }
    </style>
    <title>${blog.title}</title>
</head>
<body>
<section class="wrapper site-min-height">

    <div class="row mt">
        <div class="col-lg-12">
            <div class="showback">
                <div class="site-index">
                    <div class="jumbotron">
                        <h2 align="center">${blog.title}</h2>
                        <p>${blog.content}</p>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a href="<%=basePath%>"  type="button" class="btn btn-default">
                                返回
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer start-->
<footer class="footer">
    <p class="pull-left"></p>
    <p class="pull-right">&copy; www.caihaolun.org 2016</p>
</footer>
</body>
</html>
