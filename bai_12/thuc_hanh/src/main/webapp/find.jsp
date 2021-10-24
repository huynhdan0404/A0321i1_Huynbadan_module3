<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/20/2021
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user?action=find" method="post">
    <label>idUser</label>
    <input type="text" name="id">
    <input type="submit" value="submit">
</form>

<table border="1">
    <tr>
        <td>id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Country</td>
    </tr>
    <tr var = "user" items="${user}">
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
    </tr>
</table>
</body>
</html>
