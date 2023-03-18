<%--
  Created by IntelliJ IDEA.
  User: machd
  Date: 17/3/2023
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style><%@include file="css/login.css"%></style>
</head>
<body>

<div class="center">
    <h1>Admin login </h1>
    <form action="/Login" method="post">
        <div class="inputbox">
            <input type="email" name="email" required="required">
            <span>Email</span>
        </div>
        <div class="inputbox">
            <input type="password" name="password" required="required">
            <span>Password</span>
        </div>
        <div class="inputbox">
            <input type="submit" value="Login">
        </div>
    </form>
</div>

<script src="script.js"></script>
</body>
</html>
