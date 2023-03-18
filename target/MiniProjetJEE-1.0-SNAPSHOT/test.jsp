<%--
  Created by IntelliJ IDEA.
  User: machd
  Date: 17/3/2023
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") == null){
        response.sendRedirect("/LoginPage.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%= session.getAttribute("user")%>
<a href="/Logout">logout</a>
</body>
</html>
