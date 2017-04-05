<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/5
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript">
        $(document).ready(function () {
            $("#changePassword").click(function () {
                var a = $("#originPasswd").val();
                var b = $("#newPasswd").val();
                var c = $("#newPasswdAgain").val();
                if (a == "" || b == "" || c == "") {
                    alert("请查看是否有空缺项！");
                } else if (b != c) {
                    alert("错误！新密码与重复密码不匹配！");
                } else {
                    var uid = $.cookie("uid");
                    $.post("<%=basePath%>changePasswd/" + uid, {"newPassword": b},
                        function () {
                            alert("密码修改成功！");
                            window.location.href = "<%=basePath%>"
                        });
                }
            })
        })
    </script>
</head>
<body>
<div class="panel panel-default" style="margin-left: 300px;margin-right: 300px;">
    <div class="panel-heading">
        <h3 class="panel-title">修改密码</h3>
    </div>
    <div class="panel-body">
        <form id="vmaig-auth-login-form" class="clearfix" method="post" role="form">
            <input type="hidden" name="csrfmiddlewaretoken" value="Alp7ceHvD7WOhd4gFvOYwd0S9Hlvmwid">
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <input id="originPasswd" type="password" class="form-control" placeholder="请输入原密码">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <input id="newPasswd" type="password" class="form-control" placeholder="请输入新密码">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-lock"></span>
                    </div>
                    <input id="newPasswdAgain" type="password" class="form-control" placeholder="请确认输入新密码"/>
                </div>
            </div>
            <button id="changePassword" type="button" class="btn btn-vmaig-auth pull-left">修改密码
            </button>
            <a href="<%=basePath%>" type="button" class="btn btn-vmaig-auth pull-right">返回</a>
        </form>
    </div>
</div>
</body>
</html>
