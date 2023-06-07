<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .container{
        margin-top: 30px;
        margin-left: auto;
        margin-right: auto;
        width: 50%;
        height: 150px;
        border-radius: 5px;
    }
    .input{
        padding-top: 20px;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    .firstname{
        float: left;
        font-weight: 500;
        font-size: 15px;
        padding-top: 5px;
    }
    .inputname{
        float: left;
        height: 35px;
        border-radius: 5px;
    }
    .lastname{
        float: left;
        font-weight: 500;
        font-size: 15px;
        padding-top: 5px;
    }
    .intputlastname{
        float: left;
        height: 35px;
        border-radius: 5px;
    }
    .calculation{
        float: left;
        font-weight: 500;
        font-size: 15px;
        padding-top: 5px;
    }
    .selectcalculation{
        float: left;
        height: 35px;
        border-radius: 5px;
    }
    .footer{
        display: flex;
        justify-content: flex-end;
    }
    .Calculate{
        width: 60px;
        margin: 10px;
        padding: 0px;
        height: 30px;
        background-color: rgb(219, 42, 42);
        text-align: center;
        line-height: 25px;
        color: white;
        border-radius: 3px;
    }
</style>
<head>

</head>
<body>
<form action="/calculate" method="post">
<div class="container">
    <div class="input">
        <div>
            <div class="firstname col-5">First Operand</div>
            <input class="inputname col-7" type="text" name="first-operand">
        </div>
        <div>
            <div class="calculation col-5">Addition</div>
            <select name="operator">
                <option value="+">Cộng</option>
                <option value="-">Trừ</option>
                <option value="*">Nhân</option>
                <option value="/">Chia</option>
            </select>
        </div>
        <div>
            <div class="lastname col-5">Second Operand</div>
            <input class="intputlastname col-7" type="text" name="second-operand">
        </div>
    </div>
    <div class="footer">
        <input class="Calculate col-3" type="submit" value="Calculate"/>
    </div>
</div>
</form>
</body>
</html>