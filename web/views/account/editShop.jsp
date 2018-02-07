
<%@ include file="/views/includeHeader.jsp" %>

<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title"><c:choose> <c:when test="${not empty type && type == 'edit'}">Edit</c:when> <c:otherwise>Add</c:otherwise></c:choose> shop</h1>
            <div id="list-view" class="tab-pane active">
                <form:form commandName="shopForm" method="post" action="" enctype="multipart/form-data">

                <div class="shop-list">
                <div class="col-md-12">
                    <div class="shop-product">
                        <div class="product-box">
                            <h4 style="text-align: center">Logo :</h4>
                            <img style="background: #fff; object-fit: contain;border: solid 1px #cccccc7a; border-radius: 10px;" src="
                        <c:choose>
                            <c:when test="${not empty shop.logoURL }">
                                    ${imagesServerURL}${shop.logoURL}
                            </c:when>
                            <c:otherwise>
                                http://localhost/fileupload/topseller/defaultStore.png
                            </c:otherwise>
                        </c:choose> " alt="">
                            <input class="form-control" name="logoFile" type="file" />
                            <hr>

                            <h4 style="text-align: center">Cover :</h4>
                            <img style="background: #fff; object-fit: contain;border: solid 1px #cccccc7a; border-radius: 10px;" src="
                        <c:choose>
                            <c:when test="${not empty shop.coverURL }">
                                    ${imagesServerURL}${shop.coverURL}
                            </c:when>
                            <c:otherwise>
                                http://localhost/fileupload/topseller/defaultStore.jpg
                            </c:otherwise>
                        </c:choose> " alt="">
                            <input class="form-control" name="coverFile" type="file" />
                        </div>
                            <div class="product-info">
                                <c:if test="${type=='edit'}">
                                <div class="fix">
                                    <div class="star-rating pull-right">
                                        <div class="reviews-icon">
                                            <i class="fa <c:choose><c:when test="${shop.globalScore>0.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                            <i class="fa <c:choose><c:when test="${shop.globalScore>1.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                            <i class="fa <c:choose><c:when test="${shop.globalScore>2.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                            <i class="fa <c:choose><c:when test="${shop.globalScore>3.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                            <i class="fa <c:choose><c:when test="${shop.globalScore>4.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                <div class="product-description mb-20">
                                    <p>Name : </p> <form:input cssClass="form-control" path="name"></form:input>
                                    <p>Category : </p> <form:select cssClass="form-control" path="categoryId">
                                    <c:forEach items="${listSuperCategories}" var="cat">
                                        <form:option value="${cat.id}">-- ${cat.name}</form:option>
                                        <c:forEach items="${cat.children}" var="chil">
                                            <form:option value="${chil.id}">${chil.name}</form:option>
                                        </c:forEach>
                                    </c:forEach>
                                    </form:select>
                                    <p>Adresse : </p> <form:input cssClass="form-control" path="address"></form:input>
                                    <p>Phone : </p> <form:input cssClass="form-control" path="phone"></form:input>
                                    <p>Longitude : </p> <form:input cssClass="form-control" path="longitude"></form:input>
                                    <p>Latitude : </p> <form:input cssClass="form-control" path="latitude"></form:input> <br>
                                    <button class="btn btn-common"><i class="icon-basket-loaded-loaded"></i><c:choose> <c:when test="${not empty type && type == 'edit'}">Edit</c:when> <c:otherwise>Add</c:otherwise></c:choose></button>
                                </div>
                            </div>
                    </div>
                </div>
                </form:form>

            </div>
        </div>
        </div>
        <c:if test="${type=='edit'}">
        <div class="row">
            <h1 class="section-title">Products</h1>
            <a href="/account/shop/product/add?shopId=${shop.id}"><button class="btn btn-primary pull-right" style="position: relative; top: -50px;padding: 10px;">Add product</button></a>
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
                                <td>${product.name}</td>
                                <td>${product.price.toString().substring(0,product.price.toString().indexOf('.')+2)} DT</td>
                                <td>${product.quantity}</td>
                                <td>${product.category.name}</td>
                                <td>${product.status}</td>
                                <td>
                                    <a href="/account/shop/product/remove?id=${product.id}&shopId=${shop.id}">Delete</a> |
                                    <a href="/account/shop/product/edit?id=${product.id}&shopId=${shop.id}">Modify</a>
                                </td>
                            </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
        </c:if>
    </div>
</section>



<%@ include file="/views/includeFooter.jsp" %>
