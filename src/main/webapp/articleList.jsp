<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/1
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript">

    </script>
</head>
<body>
<h2>博文列表</h2>

<table style="width: 100%;font-size: 15px">
    <tr>
        <td width="70%">
            <ul class="list-group">
                <c:forEach items="${blogList}" var="blog">
                    <li class="list-group-item title">
                        <a id="detail" href="show/${blog.bid}">${blog.title}</a>
                        <span style="float: right">
                    <a id="update" href="update/${blog.bid}">编辑</a>
                    <a id="delete" style="margin-right:20px" href="delete/${blog.bid}">删除</a>
                        </span>
                    </li>
                </c:forEach>
                <div class="container-fluid" style="float: right">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="pagination" id="paging">
                                <li value="pre">
                                    <a href="#">上一页</a>
                                </li>
                                <li value="1">
                                    <a href="#">1</a>
                                </li>
                                <li value="2">
                                    <a href="#">2</a>
                                </li>
                                <li value="3">
                                    <a href="#">3</a>
                                </li>
                                <li value="4">
                                    <a href="#">4</a>
                                </li>
                                <li value="5">
                                    <a href="#">5</a>
                                </li>
                                <li value="next">
                                    <a href="#">下一页</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <span style="float: right;margin-right: 20px"> 当前第1页，共10条记录</span>
                    </div>
                </div>
            </ul>
        </td>
    </tr>

</table>
</body>
</html>
