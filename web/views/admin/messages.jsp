<%@ include file="/views/includeHeader.jsp" %>
<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title">Messages</h1>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">full name</th>
        <th scope="col">email</th>
        <th scope="col">subject</th>
        <th scope="col">message</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listMessages}" var="msg">
        <tr>
            <td>${msg.fullname}</td>
            <td>${msg.email}</td>
            <td>${msg.subject}</td>
            <td>${msg.message}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
        </div>
    </div>
</section>
<%@ include file="/views/includeFooter.jsp" %>
