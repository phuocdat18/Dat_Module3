<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<form method="post" id="frmHiden" action="/customers?action=delete">
    <input type="hidden" id="txtIdEdit" name="idEdit"  />
</form>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Action</td>
    </tr>

    <c:forEach items="${requestScope.customers}" var="c">
        <tr>
            <td>${c.getId()}</td>
            <td>${c.getName()}</td>
            <td>${c.getEmail()}</td>
            <td>${c.getAddress()}</td>
            <td>
                <a href="/customers?action=edit&id=${c.getId()}"><i class="fa-solid fa-pen-to-square"></i></a>
                <a onclick="handleDelete('${c.getId()}','${c.getName()}')"><i class="fa-solid fa-trash"></i></a>
            </td>
        </tr>
    </c:forEach>
    <a href="/customers?action=create&id=${id}"><i class="fa-solid fa-pen-to-square"></i></a>
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








