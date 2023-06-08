<%--
  Created by IntelliJ IDEA.
  User: Phuoc Dat
  Date: 7/6/2023
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ListProduct</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<form method="post" id="frmHiden" action="/product?action=delete">
    <input type="hidden" id="txtIdEdit" name="idEdit"  />
</form>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Describe</td>
        <td>Action</td>
    </tr>

    <c:forEach items="${requestScope.product}" var="product">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>
                <a href="/product?action=edit&id=${c.getId()}"><i class="fa-solid fa-pen-to-square"></i></a>
                <a onclick="handleDelete('${product.getId()}','${product.getName()}')"><i class="fa-solid fa-trash"></i></a>
            </td>
        </tr>
    </c:forEach>
    <a href="/product?action=create&id=${id}"><i class="fa-solid fa-pen-to-square"></i></a>
</table>
<script>
    function handleDelete(id, name){
        document.getElementById("txtIdEdit").value = id;
        let cf = confirm("Ban co muon xoa " + name);
        if(cf){
            document.getElementById("frmHiden").submit();
        }
    }
</script>
</body>
</html>
