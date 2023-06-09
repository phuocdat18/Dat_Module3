<%--
  Created by IntelliJ IDEA.
  User: Phuoc Dat
  Date: 7/6/2023
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<c:if test="${requestScope.message != null}">
    <h6>Thêm thành công</h6>
</c:if>
<form action="/customers?action=create" method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer"></td>
            </tr>
            <tr>
                <label for="type">Type</label>

                <select name="type" id="type" >
                    <option value="">--None--</option>
                    <c:forEach items="${types}" var="type">
                        <option value="${type.id}">${type.type}</option>
                    </c:forEach>
                </select>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
