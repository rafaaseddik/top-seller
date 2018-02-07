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
                                            <a href="/account/shop/product/remove?id=${product.id}&shopId=${shop.id}">Delete</a> |
                                            <a href="/account/shop/product/edit?id=${product.id}&shopId=${shop.id}">Modify</a>
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
                                        <a href="/account/shop/product/remove?id=${product.id}&shopId=${shop.id}">Delete</a> |
                                        <a href="/account/shop/product/edit?id=${product.id}&shopId=${shop.id}">Modify</a>
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