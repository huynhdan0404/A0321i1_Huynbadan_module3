<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/17/2021
  Time: 6:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=create" method="post">
   <div>
       <label>id</label>
       <input type="text" name="idProduct">
   </div>
    <div>
        <label>name</label>
        <input type="text" name="nameProduct">
    </div>
    <div>
        <label>price</label>
        <input type="text" name="priceProduct">
    </div>
    <div>
        <label>status</label>
        <select name="statusProduct" >
            <option value="true">còn hàng</option>
            <option value="false">hết hàng</option>
        </select>
    </div>
    <input type="submit" value="submit">
</form>
</body>
</html>
