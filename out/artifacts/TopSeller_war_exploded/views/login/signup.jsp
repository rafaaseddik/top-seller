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
<c:if test="${errors.size()>0}">
    <c:forEach items="${errors}" var="error">
        <br><b class="error-login"><c:out value = "${error}"/></b>
    </c:forEach>

    <br>
</c:if>
<form:form method="POST" action="/login/signup" commandName="newUser" enctype="multipart/form-data">
    <form:input path="fname" placeholder="First name"></form:input><br>
    <form:input path="lname" placeholder="Last name"></form:input><br>
    <form:input path="email" placeholder="Email Adress"></form:input><br>
    <form:password path="password" placeholder="Password"></form:password><br>
    <form:input path="region" placeholder="Region"></form:input><br>
    <form:input path="phone" placeholder="Phone"></form:input><br>
        <input type="file" name="avatar_url"/><br>
    <form:select path="type" placeholder="Client type">
        <form:option value="CLIENT">Client</form:option>
        <form:option value="VENDOR">Vendor</form:option>
    </form:select><br>
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>
