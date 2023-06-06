<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    *{
        padding: 0;
        margin: 0;
    }
    .table{
        width: 80%;
        margin-top: 10px;
        margin-left: auto;
        margin-right: auto;
    }
    .head{
        display: flex;
        justify-content: center;
        margin-top: 100px;
    }
</style>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<table class="table">
    <h1 class="head">Danh sách khách hàng</h1>
    <thead>
    <tr>
        <th scope="col">Tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <tbody>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.birthday}</td>
            <td>${customer.address}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<form action="/customer?action=create" method="post">
    <label>Name</label>
    <input type="text" value="" name="name" placeholder="NHap ten"/>

    <input type="submit" value="submit"/>
</form>
</body>
</html>