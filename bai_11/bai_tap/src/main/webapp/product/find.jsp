<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/17/2021
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=find" method="post">
    <label>idProduct</label>
    <input type="text" name="idProduct">
    <input type="submit" value="submit">
</form>

<table border="1">
    <tr>
        <td>id</td>
        <td>Name Product</td>
        <td>Price</td>
        <td>Status</td>
    </tr>
        <tr var = "resusltProduct" items="${resusltProduct}">
            <td>${resusltProduct.id}</td>
            <td>${resusltProduct.name}</td>
            <td>${resusltProduct.price}</td>
            <td>${resusltProduct.status ? "còn hàng" : "hết hàng"}</td>
        </tr>
</table>
<p>
    <a href="/product">Show list product</a>
</p>
</body>
</html>
