
<%@ include file="/views/includeHeader.jsp" %>

<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title">Products</h1>
            <div id="list-view" class="tab-pane active">
                <div class="shop-list">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">name</th>
                            <th scope="col">price</th>
                            <th scope="col">quantity</th>
                            <th scope="col">category</th>
                            <th scope="col">status</th>
                            <th scope="col">actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProducts}" var="product">
                            <tr>
                                <td><a href="/product?id=${product.id}" ><span class="pull-left">${product.name}</span></a> <c:if test="${product.closed}"><span class="btn-danger pull-right" style="padding: 0 8px;">closed</span></c:if></td>
                                <td>${product.price.toString().substring(0,product.price.toString().indexOf('.')+2)} DT</td>
                                <td>${product.quantity}</td>
                                <td>${product.category.name}</td>
                                <td>${product.status}</td>
                                <td>
                                    <a href="/account/shop/product/remove?id=${product.id}&shopId=${shop.id}">Close</a> |
                                    <a href="/account/shop/product/edit?id=${product.id}&shopId=${shop.id}">Delete</a>
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
