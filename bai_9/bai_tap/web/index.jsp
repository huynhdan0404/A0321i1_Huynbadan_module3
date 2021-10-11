<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/8/2021
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form method="post" action="/discountcalculator">
    <label>Product Description</label>
    <input type="text">
    <label>List Price</label>
    <input type="text" name="price">
    <label>Discount Percent</label>
    <input type="text" name="discount">
    <input type="submit" value="submit">
  </form>
  </body>
</html>
