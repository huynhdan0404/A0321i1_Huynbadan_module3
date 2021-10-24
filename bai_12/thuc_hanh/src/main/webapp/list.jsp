<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/20/2021
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <td>id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
    </tr>
    <c:forEach var = "userList" items="${userList}">
        <tr>
            <td>${userList.id}</td>
            <td>${userList.name}</td>
            <td>${userList.email}</td>
            <td>${userList.country}</td>
        </tr>
    </c:forEach>
</table>
<p>
    <a href="/user?action=find">findUser</a>
</p>
</body>
</html>
