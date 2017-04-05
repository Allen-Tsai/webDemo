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
            var bid = $("#bid").val();
            $("#updateBlog").click(function () {
                var uid = $.cookie("uid");
                var title = $("#title_").val();
                var text = $("#textEditor").val();
                if (title == "" || text == "") {
                    alert("请确认是否有空缺项！");
                } else {
                    var blog={
                        "bid": bid,
                        "title": title,
                        "content": text,
                        "uid": uid
                    };
                    $.ajax({
                        type: 'post',
                        url: '<%=basePath%>update',
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(blog),
                        success: function () {
                            alert("添加成功！");
                            window.location.href="<%=basePath%>";
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
        })
    </script>
    <title>编辑博文</title>
</head>
<body>
<h1>编辑博文</h1>
<div class="row mt">
    <div class="col-lg-12">
        <div class="showback">
            <div class="site-index">
                <table style="width: 100%">
                    <tr>
                        <td width="70%">
                            <input type="hidden" id="bid" value="${blog.bid}">
                            <div class="input-group">
                                <span class="input-group-addon" title="请输入文章标题">文章标题</span>
                                <input id="title_" type="text" class="form-control" value="${blog.title}"
                                       placeholder="请输入文章标题">
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="textEditor" class="label label-default">文章内容</label>
                                    <textarea class="form-control" id="textEditor" rows="6"
                                              placeholder="请输入文章内容">${blog.content}</textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <br/>
                                    <button id="updateBlog" type="button" class="btn btn-default">
                                        发布
                                    </button>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<!--footer start-->
<footer class="footer">
    <p class="pull-left"></p>
    <p class="pull-right">&copy; www.caihaolun.org 2016</p>
</footer>
</body>
</html>
