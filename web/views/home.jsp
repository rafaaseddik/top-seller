
<%@ include file="/views/includeHeader.jsp" %>


<section class="section gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="categories-wrapper white-bg">
                    <h3 class="block-title">Product Categories</h3>
                    <ul class="vertical-menu">

                        <li>
                            <a href="/filtre?cat_id=0">All Products</a>
                        </li>
                        <c:forEach items="${listSuperCategories}" var="item">
                            <li <c:if test="${item.children != null && item.children.size() > 0}"> class="dropdown" </c:if>>
                            <c:choose>
                                <c:when test="${not empty item.children && item.children.size() > 0 }">
                                    <a  class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" href="#"> ${item.name} <i class="caret-right fa fa-angle-right"></i></a>
                                    <ul class="dropdown-menu">
                                        <c:forEach items="${item.children}" var="children">
                                            <li><a href="/filtre?cat_id=${children.id}">${children.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <a href="/filtre?cat_id=${item.id}"> ${item.name}</a>
                                </c:otherwise>
                            </c:choose>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="touch-slider owl-carousel" data-slider-pagination="true">
                    <c:forEach items="${listShops}" var="shop">
                        <div class="item">
                            <a href="/shop?id=${shop.id}"><img style="width: 100%;height: 445px;object-fit: cover" src="<c:choose>
                                <c:when test="${not empty shop.coverURL}">
                                    ${imagesServerURL}${shop.coverURL}
                                </c:when>
                                <c:otherwise>
                                ${imagesServerURL}defaultStore.jpg
                                </c:otherwise>
                                </c:choose>" alt=""><h1 style="position: absolute; bottom: 10px; left: 20px; font-size: 50px; color: white; text-shadow: 2px 2px #0763ff">${shop.name}</h1></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="feature-categories section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="feature-item-content">
                    <img src="/assets/img/feature/img1.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text">
                            <h4>Men</h4>
                            <p>New Collection</p>
                        </div>
                        <a href="/filtre?cat_id=15" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="feature-item-content">
                    <img src="/assets/img/feature/img3.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text">
                            <h4>Women's</h4>
                            <p>New Collection</p>
                        </div>
                        <a href="/filtre?cat_id=18" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="feature-item-content mb-30">
                    <img src="${imagesServerURL}gift.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text accessories">
                            <h4>LOW PRICE GIFTS</h4>
                            <p>30 DT & UNDER</p>
                        </div>
                        <a href="/filtre?keyword=gift&maxPrice=30" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
                <div class="feature-item-content">
                    <img src="${imagesServerURL}devices.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text accessories">
                            <h4>Devices</h4>
                            <p>Phones , computers , ...</p>
                        </div>
                        <a href="/filtre?cat_id=11" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="shop-collection">
    <div class="container">
        <h1 class="section-title">New Arrivals</h1>
        <hr class="lines">
        <div class="row">
            <c:forEach items="${listNewArivalProduct}" var="product">
                <div class="col-md-3 col-sm-6 col-xs-12" style="height: 350px;">
                    <div class="shop-product">
                        <div class="product-box">
                            <c:choose>
                                <c:when test="${not empty product.images && product.images.size() > 0 }">
                                    <a href="/product?id=${product.id}"><img style="height: 200px;object-fit: contain" src="${imagesServerURL}${product.images[0]}" alt=""></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/product?id=${product.id}"><img style="height: 200px;object-fit: cover" src="${imagesServerURL}defaultProduct.jpg" alt=""></a>
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
</section>


<section class="discount-product-area" style="background:url('${imagesServerURL}shops.jpg')">
    <div class="container">
        <div class="row">
            <div class="discount-text">
                <h3>DISCOVER OUR SHOPS</h3>
                <a href="/filtre/shop" class="btn btn-common btn-large">Discover</a>
            </div>
        </div>
    </div>
</section>


<section class="section">
    <div class="container">
        <h1 class="section-title">Best Shops</h1>
        <hr class="lines">
        <div class="row">
            <div class="col-md-12">
                <div id="new-products" class="owl-carousel">
                <c:forEach items="${listShops}" var="shop">
                    <div class="item">
                                        <div class="shop-product">
                                            <div class="product-box">
                                                <c:choose>
                                                    <c:when test="${not empty shop.logoURL}">
                                                        <a href="/shop?id=${shop.id}"><img style="height: 200px;object-fit: contain" src="${imagesServerURL}${shop.logoURL}" alt=""></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/shop?id=${shop.id}"><img style="height: 200px;object-fit: contain" src="${imagesServerURL}defaultStore.png" alt=""></a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="product-info">
                                                <h4 class="product-title"><a href="/shop?id=${shop.id}">${shop.name}</a></h4>
                                                <div class="align-items">
                                                    <div class="pull-left">
                                                        <span class="price" style="font-size: 12px;">${shop.category.name}</span>
                                                    </div>
                                                    <div class="pull-right">
                                                        <div class="reviews-icon">
                                                            <i class="fa <c:choose><c:when test="${shop.globalScore>0.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${shop.globalScore>1.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${shop.globalScore>2.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${shop.globalScore>3.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${shop.globalScore>4.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                        </div>
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



<section class="listcart-products section">
    <div class="container">
        <h1 class="section-title">Recommended For You</h1>
        <hr class="lines">
        <div class="row">
            <c:forEach items="${listRecommendedProducts}" var="item">
            <div class="col-md-4 col-sm-4 col-xs-12" >
                <div class="listcartproducts">
                    <h2 class="title-cart">${item.getKey().name}</h2>
                    <div class="products-item-inner">
                    <c:forEach items="${item.value}" var="product">
                        <div class="products-item">
                                <div class="left">
                                    <c:choose>
                                        <c:when test="${not empty product.images && product.images.size() > 0 }">
                                            <a href="/product?id=${product.id}"><img style="height: 115px;object-fit: contain" src="${imagesServerURL}${product.images[0]}" alt=""></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/product?id=${product.id}"><img style="height: 115px;object-fit: cover" src="${imagesServerURL}defaultProduct.jpg" alt=""></a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="/product?id=${product.id}" class="quick-view"><i class="icon-magnifier"></i></a>
                                </div>
                                <div class="right">
                                    <h5 class="product-name">${product.name}</h5>
                                    <div class="price">
                                            ${product.price.toString().substring(0,product.price.toString().indexOf('.')+2)} DT
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>


<%@ include file="/views/includeFooter.jsp" %>
