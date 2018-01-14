<%--
  Created by IntelliJ IDEA.
  User: rafaa
  Date: 1/14/2018
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include.jsp"%>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>
This is a signup page
<c:if test="${error}">
    <br><b class="error-login">There was an error with your E-Mail/Password combination. Please try again.</b>
    <br>
</c:if>
<form:form method="POST" action="/login/signup" commandName="newUser" enctype="multipart/form-data">
    <form:input path="fname" placeholder="fname"></form:input><br>
    <form:input path="lname"></form:input><br>
    <form:input path="email"></form:input><br>
    <form:password path="password" ></form:password>
    <form:input path="region"></form:input><br>
    <form:input path="phone"></form:input><br>
        <input type="file" name="avatar_url"/>
    <form:select path="type">
        <form:option value="CLIENT">Client</form:option>
        <form:option value="VENDOR">Vendor</form:option>
    </form:select><br>
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>
