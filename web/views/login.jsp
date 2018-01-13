<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: rafaa
  Date: 12/1/2017
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="topseller.models.LoginUser" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
This is a login page
<form:form method="POST" action="login/submit" commandName="login">
   <form:input path="username"></form:input><br>
    <form:input path="password"></form:input>
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>
