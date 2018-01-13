<%--
  Created by IntelliJ IDEA.
  User: rafaa
  Date: 12/2/2017
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Liste des personnes</title>
</head>
<body>
<c:forEach items="${persons.getPerson()}" var="prod">
    <p> - <c:out value="${prod.nom}"/> <b> <c:out value="${prod.prenom}"/></b></p>

</c:forEach>

${user.username}
</body>
</html>
