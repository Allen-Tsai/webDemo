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
    <title>Title</title>
    <meta charset="utf-8">
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery.cookie.js"></script>
    <script type="application/javascript">
        $(document).ready(function () {
            $("#pullout").click(function () {
                var uid = $.cookie("uid");
                var title = $("#title").val();
                var text = $("#text").val();
                if (title == "" || text == "") {
                    alert("请确认是否有空缺项！");
                } else {
                    $.post("<%=basePath%>addArticle", {"title": title, "content": text, "uid": uid},
                        function (data) {
                            if (data["result"] == "SUCCESS") {
                                alert("添加成功！");
                                $("#myDiv").load("articleList/" + uid);
                            }
                        });
                }
            });
        })
    </script>
</head>
<body>
<h2>博文写作</h2>

<table style="width: 100%">
    <tr>
        <td width="70%">
            <div class="input-group">
                <span class="input-group-addon" title="请输入文章标题">文章标题</span>
                <input id="title" type="text" class="form-control" placeholder="请输入文章标题">
            </div>
            <br/>
            <div class="row">
                <div class="col-md-12">
                    <label for="text" class="label label-default">文章内容</label>
                    <textarea class="form-control" id="text" rows="6" placeholder="请输入文章内容"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <br/>
                    <button id="pullout" type="button" class="btn btn-default">
                        发布
                    </button>
                </div>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
