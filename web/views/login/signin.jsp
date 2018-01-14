<%--
  Created by IntelliJ IDEA.
  User: rafaa
  Date: 12/1/2017
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include.jsp"%>
<html>
<head>
    <title>Signin</title>
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
This is a signin page
<c:if test="${error}">
    <br><b class="error-login">There was an error with your E-Mail/Password combination. Please try again.</b>
    <br>
</c:if>
<form:form method="POST" action="/login/signin/" commandName="login">
    <form:input path="email"></form:input><br>
    <form:password path="password" ></form:password>
    <input type="submit" value="Submit" />
</form:form>
<a href="/login/signup">Create account</a>
</body>
</html>
