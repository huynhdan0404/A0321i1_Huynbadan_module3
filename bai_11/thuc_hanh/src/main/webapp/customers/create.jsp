<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/17/2021
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <form action="/customer?action=create" method="post">
            <div>
                <label>id khách hàng</label>
                <input type="text" name="idCustomer">
            </div>
            <div>
                <label>tên khách hàng</label>
                <input type="text" name="nameCustomer">
            </div>
            <div>
                <label>email</label>
                <input type="text" name="email">
            </div>
            <div>
                <label>địa chỉ</label>
                <input type="text" name="address">
            </div>
            <input type="submit" value="submit">
        </form>
    </div>
</body>
</html>
