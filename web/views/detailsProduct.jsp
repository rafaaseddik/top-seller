
<%@ include file="/views/includeHeader.jsp" %>

<section id="product-collection" class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-details-image">
                    <div class="slider-for slider">
                        <c:choose>
                            <c:when test="${not empty product.images && product.images.size() > 0 }">
                                <c:forEach items="${product.images}" var="image">
                                    <div>
                                        <img src="${imagesServerURL}${image}" alt="">
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <img src="http://localhost/fileupload/topseller/defaultProduct.jpg" alt="">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <ul id="productthumbnail" class="slider slider-nav">
                        <c:choose>
                            <c:when test="${not empty product.images && product.images.size() > 0 }">
                                <c:forEach items="${product.images}" var="image">
                                    <li>
                                        <img src="${imagesServerURL}${image}" alt="">
                                    </li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                </div>
            </div>
            <div class="col-md-8 col-sm-6 col-xs-12">
                <div class="info-panel">
                    <h1 class="product-title">${product.name}</h1>

                    <div class="price-ratting">
                        <div class="price float-left">
                            ${product.price.toString().substring(0,product.price.toString().indexOf('.')+2)} DT
                        </div>
                    </div>

                    <div class="short-desc">
                        <h5 class="sub-title">Condition</h5>
                        <p>
                            <c:choose>
                                <c:when test="${product.status == 'BARELY_USED'}">
                                    BARELY USED
                                </c:when>
                                <c:otherwise>
                                    ${product.status}
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>

                    <div class="short-desc">
                        <h5 class="sub-title">quantity</h5>
                        <p>
                            ${product.quantity}
                        </p>
                    </div>

                    <div class="short-desc">
                        <h5 class="sub-title">Description</h5>
                        <p>
                            ${product.description}
                        </p>
                    </div>
                    <c:if test="${not empty product.shop.phone}">
                        <div class="quantity-cart">
                            <a <c:if test="${empty loggedUser}">href="/login/signin"</c:if>>
                                <button class="btn btn-common"><i class="icon-basket-loaded-loaded"></i><c:choose><c:when test="${not empty loggedUser}">${product.shop.phone}</c:when><c:otherwise>log in to see the phone number</c:otherwise></c:choose> </button>
                            </a>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</section>

<a href="/shop?id=${product.shop.id}">
    <div class="single-pro-tab section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-xs-3">
                    <c:choose>
                        <c:when test="${not empty product.shop.logoURL}">
                            <img style="max-height: 200px" src="${imagesServerURL}${product.shop.logoURL}">
                        </c:when>
                        <c:otherwise>
                            <img style="max-height: 200px" src="http://localhost/fileupload/topseller/defaultProduct.jpg" alt="">
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="col-md-9 col-xs-9">
                    <div class="pro-tab-info pro-description">
                        <h3 class="small-title">${product.shop.name}</h3>
                        <p>Category : ${product.shop.category.name}</p>
                        <p>Adresse : ${product.shop.address}</p>
                        <p>Phone : ${product.shop.phone}</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</a>
<c:if test="${true}">
    <section class="section">
        <div class="container">
            <h1 class="section-title">Customers also shopped for</h1>
            <hr class="lines">
            <div class="row">
                <div class="col-md-12">
                    <div id="new-products" class="owl-carousel">
                        <c:forEach items="${listSuggestedProducts}" var="product">
                            <div  style="height: 350px;">
                                <div class="shop-product">
                                    <div class="product-box">
                                        <c:choose>
                                            <c:when test="${not empty product.images && product.images.size() > 0 }">
                                                <a href="/product?id=${product.id}"><img style="height: 200px;object-fit: contain" src="${imagesServerURL}${product.images[0]}" alt=""></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/product?id=${product.id}"><img style="height: 200px;object-fit: cover" src="http://localhost/fileupload/topseller/defaultProduct.jpg" alt=""></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="product-info">
                                        <h4 class="product-title"><a href="/product?id=${product.id}">${product.name}</a></h4>
                                        <div class="align-items">
                                            <div class="pull-left">
                                                <span class="price">${product.price.toString().substring(0,product.price.toString().indexOf('.')+2)} DT</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>



<%@ include file="/views/includeFooter.jsp" %>
