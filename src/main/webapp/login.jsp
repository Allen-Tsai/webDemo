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
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery.cookie.js"></script>
    <title>这里是标题</title>
    <script type="application/javascript">
        $(document).ready(function () {
            $("#register_").click(function () {
                $("#myDiv").load("register.jsp");
            });
            $("#login_").click(function () {
                var uid = $("#uid").val();
                var username = $("#username").val();
                var password = $("#password").val();
                if (uid == "" || username == "" || password == "") {
                    alert("请确认是否有空缺项！");
                } else {
                    var user_ = {
                        "uid": uid,
                        "username": username,
                        "password": password
                    };
                    $.ajax({
                        type: 'post',
                        url: '<%=basePath%>validate',
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(user_),
                        success: function (data) {
                            if (data["result"] == "SUCCESS") {
                                alert("登陆成功！");
                                var uid = $.cookie("uid");
                                var uname = $.cookie("username");
                                $("#top_menu").html
                                ('<li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle"' +
                                    ' href="#" title="">' +
                                    '<i class="fa fa-user" aria-hidden="true"></i>' +
                                    '&nbsp;' + uname + '</a><ul class="dropdown-menu extended tasks-bar">' +
                                    '<div class="notify-arrow notify-arrow-green"></div><li>' +
                                    '<p class="green">' + uname + '</p> </li> <li class="external"> ' +
                                    '<a href="#"><i class="fa fa-key" aria-hidden="true"></i>修改密码</a>' +
                                    '<a href="logout/'+uid+'" class="logout-button"><i class="fa fa-sign-out" aria-hidden="true"></i> ' +
                                    '注销</a></li></ul></li>');
                                $("#myDiv").load("articleList/" + uid);
                            } else {
                                alert("登录失败！" + data["result"]);
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.status);
                            alert(XMLHttpRequest.readyState);
                            alert(textStatus);
                            alert(errorThrown);
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<div class="panel panel-default" style="margin-left: 300px;margin-right: 300px;">
    <div class="panel-heading">
        <h3 class="panel-title">请登录</h3>
    </div>
    <div class="panel-body">
        <form id="vmaig-auth-login-form" class="clearfix" method="post" role="form">
            <input type="hidden" name="csrfmiddlewaretoken" value="Alp7ceHvD7WOhd4gFvOYwd0S9Hlvmwid">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <input id="uid" type="text" class="form-control" placeholder="请输入id号">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <input id="username" type="text" class="form-control" placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-lock"></span>
                    </div>
                    <input id="password" type="password" class="form-control" placeholder="请输入密码"/>
                </div>
            </div>
            <button id="login_" type="button" class="btn btn-vmaig-auth pull-left">登录
            </button>
            <a href="#" id="register_" type="button" class="btn btn-vmaig-auth pull-right">注册</a>
        </form>
    </div>
</div>
</body>
</html>
