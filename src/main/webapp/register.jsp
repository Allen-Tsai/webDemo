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
    <title>这里是标题</title>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery.cookie.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $("#register-button").click(function () {
                var id = $("#id-reg").val();
                var username = $("#username-reg").val();
                var password = $("#password1").val();
                var repassword = $("#password2").val();
                if (password != repassword) {
                    alert("密码与确认密码不一致！");
                } else if (id == "" || username == "" || password == "") {
                    alert("请确认是否有空缺项！");
                } else {
                    var user = {
                        "uid": id,
                        "username": username,
                        "password": password
                    };
                    $.ajax({
                        type: 'post',
                        url: '<%=basePath%>register',
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(user),
                        success: function (data) {
                            if (data["result"] == "SUCCESS") {
                                alert("注册成功！");
                                var uid_ = $.cookie("uid");
                                var uname_ = $.cookie("username");
                                $("#top_menu").html
                                ('<li class="dropdown"><a data-toggle="dropdown" class="dropdown-toggle"' +
                                    ' href="#" title="">' +
                                    '<i class="fa fa-user" aria-hidden="true"></i>' +
                                    '&nbsp;' + uname_ + '</a><ul class="dropdown-menu extended tasks-bar">' +
                                    '<div class="notify-arrow notify-arrow-green"></div><li>' +
                                    '<p class="green">' + uname_ + '</p> </li> <li class="external"> ' +
                                    '<a href="#"><i class="fa fa-key" aria-hidden="true"></i>修改密码</a>' +
                                    '<a href="logout/'+uid_+'" class="logout-button"><i class="fa fa-sign-out" aria-hidden="true"></i> ' +
                                    '注销</a></li></ul></li>');
                                $("#myDiv").load("articleList/" + uid_);
                            } else {
                                alert("注册失败！" + data["result"]);
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
            })
        })
    </script>
</head>
<body>
<div class="panel panel-default" style="margin-left: 200px;margin-right: 200px;">
    <div class="panel-heading">
        <h3 class="panel-title">注册</h3>
    </div>
    <div class="panel-body" id="panel-body">
        <form id="vmaig-auth-register-form" method="post">
            <div class="form-group">
                <label for="id-reg" class="control-label">用户id</label>
                <input type="text" class="form-control" id="id-reg" placeholder="请输入用户id号">
            </div>
            <div class="form-group">
                <label for="username-reg" class="control-label">用户名</label>
                <input type="text" class="form-control" id="username-reg" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="password1" class="control-label">密码</label>
                <input type="password" class="form-control" id="password1" placeholder="请输入密码">
            </div>

            <div class="form-group">
                <label for="password2" class=" control-label">确认密码</label>
                <input type="password" class="form-control" id="password2" placeholder="请再次输入密码">
            </div>
            <br>

            <button id="register-button" type="button" class="btn btn-vmaig-auth pull-right">提交
            </button>
        </form>
    </div>
</div>
</body>
</html>
