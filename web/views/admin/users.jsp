
<%@ include file="/views/includeHeader.jsp" %>

<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title">Users</h1>
            <div id="list-view" class="tab-pane active">
                <div class="shop-list">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">name</th>
                            <th scope="col">type</th>
                            <th scope="col">phone</th>
                            <th scope="col">email</th>
                            <th scope="col">nb Strikes</th>
                            <th scope="col">region</th>
                            <th scope="col">actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listUsers}" var="user">
                            <tr>
                                <td>${user.fname} ${user.lname}</td>
                                <td>${user.type}</td>
                                <td>${user.phone}</td>
                                <td>${user.email}</td>
                                <td>${user.nbStrikes}</td>
                                <td>${user.region}</td>
                                <td>
                                    <a href="/account/shop/product/remove?id=${product.id}&shopId=${shop.id}">Delete</a> |
                                    <a href="/account/shop/product/edit?id=${product.id}&shopId=${shop.id}">make admin</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="/views/includeFooter.jsp" %>
