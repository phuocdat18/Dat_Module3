<%--
  Created by IntelliJ IDEA.
  User: Phuoc Dat
  Date: 7/6/2023
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<c:if test="${requestScope.message != null}">
    <h6>Thêm thành công</h6>
</c:if>
<form action="/product?action=edit" method="post">
    <fieldset>
        <legend>Edit information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope.product.getName()}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="price" id="price" value="${requestScope.product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Describe: </td>
                <td><input type="text" name="describe" id="describe" value="${requestScope.product.getDescribe()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Edit product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
