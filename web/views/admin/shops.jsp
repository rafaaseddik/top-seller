
<%@ include file="/views/includeHeader.jsp" %>

<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title">Shops</h1>
            <div id="list-view" class="tab-pane active">
                <div class="shop-list">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">shop</th>
                            <th scope="col">category</th>
                            <th scope="col">phone</th>
                            <th scope="col">score</th>
                            <th scope="col">longitude</th>
                            <th scope="col">latitude</th>
                            <th scope="col">creation Date</th>
                            <th scope="col">actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listShops}" var="shop">
                            <tr>
                                <td><a href="/shop?id=${shop.id}" ><span class="pull-left">${shop.name}</span></a> <c:if test="${shop.closed}"><span class="btn-danger pull-right" style="padding: 0 8px;">closed</span></c:if></td>
                                <td>${shop.category.name}</td>
                                <td>${shop.phone}</td>
                                <td>${shop.globalScore}</td>
                                <td>${shop.longitude}</td>
                                <td>${shop.latitude}</td>
                                <td>${shop.creationDate}</td>
                                <td>
                                    <a href="/admin/shop/delete?id=${shop.id}">Delete</a> |
                                    <a href="/admin/shop/block?id=${shop.id}"><c:choose><c:when test="${shop.closed}">open</c:when><c:otherwise>close</c:otherwise></c:choose></a>
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
