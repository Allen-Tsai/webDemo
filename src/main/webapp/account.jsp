<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/5
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="application/javascript">
    $(document).ready(function () {
        $("#changePassword").click(function () {
            $("#myDiv").load("changePassword.jsp");
        })
    })
</script>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <thead>
                <tr style="background-color: #1da1f2; color:seashell">
                    <th>
                        用户id
                    </th>
                    <th>
                        用户头像
                    </th>
                    <th>
                        用户名
                    </th>
                    <th>
                        修改密码
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr class="active">
                    <td>
                        ${user.uid}
                    </td>
                    <td>
                        <img src="assets/images/touxiang.jpg" height="50px" width="50px">
                    </td>
                    <td>
                        ${user.username}
                    </td>
                    <td>
                        <a href="#" id="changePassword">修改密码</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
