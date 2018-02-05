
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
                    <div class="item">
                        <a href="category.html"><img src="/assets/img/touch-slider/img1.jpg" alt=""></a>
                    </div>
                    <div class="item">
                        <a href="category.html"><img src="/assets/img/touch-slider/img2.jpg" alt=""></a>
                    </div>
                    <div class="item">
                        <a href="category.html"><img src="/assets/img/touch-slider/img3.jpg" alt=""></a>
                    </div>
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
                            <h4>Men Sale</h4>
                            <p>New Collection</p>
                        </div>
                        <a href="#" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="feature-item-content">
                    <img src="/assets/img/feature/img3.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text">
                            <h4>Women's</h4>
                            <p>Upt <span>40%</span> OFF</p>
                        </div>
                        <a href="#" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="feature-item-content mb-30">
                    <img src="/assets/img/feature/img2.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text accessories">
                            <h4>Women's Backpacks</h4>
                            <p>View Collection</p>
                        </div>
                        <a href="#" class="btn btn-common">Shop Now</a>
                    </div>
                </div>
                <div class="feature-item-content">
                    <img src="/assets/img/feature/img4.jpg" alt="">
                    <div class="feature-content">
                        <div class="banner-text accessories">
                            <h4>Men's sunglasses</h4>
                            <p>View Collection</p>
                        </div>
                        <a href="#" class="btn btn-common">Shop Now</a>
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
            <!--<div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-01.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <span class="sticker new"><strong>NEW</strong></span>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">Qui Ratione Volup</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$49.00</span>
                            </div>
                            <div class="pull-right">
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
            <c:forEach items="${listNewArivalProduct}" var="product">
                <div class="col-md-3 col-sm-6 col-xs-12" style="height: 350px;">
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
</section>


<section class="discount-product-area">
    <div class="container">
        <div class="row">
            <div class="discount-text">
                <p>New Trendy Collection</p>
                <h3>Shop Collection 50% offer!</h3>
                <a href="#" class="btn btn-common btn-large">Buy Now</a>
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
                                                        <a href="/shop?id=${shop.id}"><img style="height: 200px;object-fit: contain" src="http://localhost/fileupload/topseller/defaultStore.png" alt=""></a>
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


<section id="content-area">
    <div class="container">
        <div class="hero-land clearfix">
            <c:choose>
                <c:when test="${not empty loggedUser}">
                    <div class="landing caption">
                        <h2>search product now</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis rem, ducimus reprehenderit sed molestiae iure sapiente accusamus incidunt minima expedita velit assumenda vitae libero. Eaque nostrum magni architecto, corporis doloremque!</p>
                        <p>
                            <a href="/filtre" class="btn btn-common"><span class="icon-organization"></span>Search Now</a>
                        </p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="landing caption">
                        <h2>Sign up</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis rem, ducimus reprehenderit sed molestiae iure sapiente accusamus incidunt minima expedita velit assumenda vitae libero. Eaque nostrum magni architecto, corporis doloremque!</p>
                        <p>
                            <a href="/login/signup" class="btn btn-common"><span class="icon-organization"></span> Sign up</a>
                        </p>
                    </div>
                </c:otherwise>
            </c:choose>
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
                                            <a href="/product?id=${product.id}"><img style="height: 115px;object-fit: cover" src="http://localhost/fileupload/topseller/defaultProduct.jpg" alt=""></a>
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
