<%@ include file="/views/includeHeader.jsp" %>


<div class="single-pro-tab section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <h1 class="section-title">Reports</h1>
                <div class="single-pro-tab-menu">

                    <ul class="">
                        <li class="active"><a href="#products" data-toggle="tab">Products</a></li>
                        <li><a href="#shops" data-toggle="tab">Shops</a></li>
                    </ul>
                </div>

                <div class="tab-content">
                    <div class="tab-pane active" id="products">
                        <div class="pro-tab-info pro-description">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">User</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listProductReports}" var="report">
                                    <tr>
                                        <td>${report.subject.name}</td>
                                        <td>${report.user.fname} ${report.user.lname}</td>
                                        <td>${report.description}</td>
                                        <td>
                                            <a href="/admin/product/delete?id=${report.subject.id}">Delete</a> |
                                            <a href="/admin/product/block?id=${report.subject.id}"><c:choose><c:when test="${product.closed}">open</c:when><c:otherwise>close</c:otherwise></c:choose></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="shops">
                        <div class="pro-tab-info pro-reviews">
                            <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">Shop</th>
                                <th scope="col">User</th>
                                <th scope="col">Description</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listShopReports}" var="report">
                                <tr>
                                    <td>${report.subject.name}</td>
                                    <td>${report.user.fname} ${report.user.lname}</td>
                                    <td>${report.description}</td>
                                    <td>
                                        <a href="/admin/shop/delete?id=${report.subject.id}">Delete</a> |
                                        <a href="/admin/shop/block?id=${report.subject.id}"><c:choose><c:when test="${shop.closed}">open</c:when><c:otherwise>close</c:otherwise></c:choose></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/includeFooter.jsp" %>