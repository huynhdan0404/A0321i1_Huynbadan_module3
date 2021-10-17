<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/17/2021
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Customers</h1>
<table border="1">
    <tr>
        <td>id</td>
        <td>Name Product</td>
        <td>Price</td>
        <td>Status</td>
    </tr>
    <c:forEach var = "product" items="${productList}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.status ? "còn hàng" : "hết hàng"}</td>
        </tr>
    </c:forEach>
</table>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<p>
    <a href="/product?action=delete">Delete product</a>
</p>
<p>
    <a href="/product?action=find">Find product</a>
</p>
</body>
</html>
