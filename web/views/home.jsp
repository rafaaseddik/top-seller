
<%@ include file="/views/includeHeader.jsp" %>


<section class="section gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4">
                <div class="categories-wrapper white-bg">
                    <h3 class="block-title">Product Categories</h3>
                    <ul class="vertical-menu">

                        <li>
                            <a href="#">All Products</a>
                        </li>
                        <c:forEach items="${listSuperCategories}" var="item">
                            <li <c:if test="${item.children != null && item.children.size() > 0}"> class="dropdown" </c:if>>


                            <c:choose>
                                <c:when test="${not empty item.children && item.children.size() > 0 }">
                                    <a  class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" href="#"> ${item.name} <i class="caret-right fa fa-angle-right"></i></a>
                                    <ul class="dropdown-menu">
                                        <c:forEach items="${item.children}" var="children">
                                            <li><a href="#">${children.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <a href="#"> ${item.name}</a>
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
            <div class="col-md-3 col-sm-6 col-xs-12">
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
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-02.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <span class="sticker discount"><strong>-40%</strong></span>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">Eius Modi Tempo</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$59.00</span>
                            </div>
                            <div class="pull-right">
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-03.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">Quia Voluptas Sit</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$69.00 <del>$79.00</del></span>
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
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-04.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <span class="sticker sale"><strong>Sale</strong></span>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">An Tium Lores Eos</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$39.00</span>
                            </div>
                            <div class="pull-right">
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-05.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <span class="sticker sale"><strong>Sale</strong></span>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">Magni Dolores Eos</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$69.00</span>
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
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-06.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">Natur Aut Odit Aut</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$39.00 <del>$79.00</del></span>
                            </div>
                            <div class="pull-right">
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-07.jpg" alt=""></a>
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
                        <h4 class="product-title"><a href="product-details.html">Nisi Ut Aliqu</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$56.00</span>
                            </div>
                            <div class="pull-right">
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="shop-product">
                    <div class="product-box">
                        <a href="#"><img src="/assets/img/products/img-08.jpg" alt=""></a>
                        <div class="cart-overlay">
                        </div>
                        <div class="actions">
                            <div class="add-to-links">
                                <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="product-info">
                        <h4 class="product-title"><a href="product-details.html">Beatae Vitae Dicta</a></h4>
                        <div class="align-items">
                            <div class="pull-left">
                                <span class="price">$79.00</span>
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
            </div>
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
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-01.jpg" alt=""></a>
                            </div>
                            <div class="product-info">
                                <h4 class="product-title"><a href="product-details.html">Nisi Ut Aliqu</a></h4>
                                <div class="align-items">
                                    <div class="pull-left">
                                        <span class="price" style="font-size: 12px;">12 products</span>
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
                    </div>
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-02.jpg" alt=""></a>
                                <div class="cart-overlay">
                                </div>
                                <div class="actions">
                                    <div class="add-to-links">
                                        <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                        <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                        <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-info">
                                <h4 class="product-title"><a href="product-details.html">Eius Modi Tempo</a></h4>
                                <div class="align-items">
                                    <div class="pull-left">
                                        <span class="price">$59.00 <del>$79.00</del></span>
                                    </div>
                                    <div class="pull-right">
                                        <div class="reviews-icon">
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-03.jpg" alt=""></a>
                                <div class="cart-overlay">
                                </div>
                                <span class="sticker sale"><strong>Sale</strong></span>
                                <div class="actions">
                                    <div class="add-to-links">
                                        <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                        <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                        <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-info">
                                <h4 class="product-title"><a href="product-details.html">Quia Voluptas Sit</a></h4>
                                <div class="align-items">
                                    <div class="pull-left">
                                        <span class="price">$68.00</span>
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
                    </div>
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-04.jpg" alt=""></a>
                                <div class="cart-overlay">
                                </div>
                                <div class="actions">
                                    <div class="add-to-links">
                                        <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                        <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                        <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-info">
                                <h4 class="product-title"><a href="product-details.html">An Tium Lores Eos</a></h4>
                                <div class="align-items">
                                    <div class="pull-left">
                                        <span class="price">$59.00 <del>$69.00</del></span>
                                    </div>
                                    <div class="pull-right">
                                        <div class="reviews-icon">
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-05.jpg" alt=""></a>
                                <div class="cart-overlay">
                                </div>
                                <span class="sticker discount"><strong>-40%</strong></span>
                                <div class="actions">
                                    <div class="add-to-links">
                                        <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                        <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                        <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-info">
                                <h4 class="product-title"><a href="product-details.html">Magni Dolores Eos</a></h4>
                                <div class="align-items">
                                    <div class="pull-left">
                                        <span class="price">$79.00</span>
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
                    </div>
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-06.jpg" alt=""></a>
                                <div class="cart-overlay">
                                </div>
                                <div class="actions">
                                    <div class="add-to-links">
                                        <a href="#" class="btn-cart"><i class="icon-basket-loaded"></i></a>
                                        <a href="#" class="btn-wish"><i class="icon-heart"></i></a>
                                        <a class="btn-quickview md-trigger" data-modal="modal-3"><i class="icon-eye"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-info">
                                <h4 class="product-title"><a href="product-details.html">Natur Aut Odit Aut</a></h4>
                                <div class="align-items">
                                    <div class="pull-left">
                                        <span class="price">$69.00</span>
                                    </div>
                                    <div class="pull-right">
                                        <div class="reviews-icon">
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="i-color fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="shop-product">
                            <div class="product-box">
                                <a href="#"><img src="/assets/img/feature-products/img-07.jpg" alt=""></a>
                                <div class="cart-overlay">
                                </div>
                                <span class="sticker sale"><strong>Sale</strong></span>
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
                                        <span class="price">$56.00</span>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section id="content-area">
    <div class="container">
        <div class="hero-land clearfix">
            <div class="landing caption">
                <h2>Start Selling with ShopR</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis rem, ducimus reprehenderit sed molestiae iure sapiente accusamus incidunt minima expedita velit assumenda vitae libero. Eaque nostrum magni architecto, corporis doloremque!</p>
                <p>
                    <a href="category.html" class="btn btn-common"><span class="icon-organization"></span> Apply Now</a>
                </p>
            </div>
        </div>
    </div>
</section>


<section class="listcart-products section">
    <div class="container">
        <h1 class="section-title">Recommended For You</h1>
        <hr class="lines">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="listcartproducts">
                    <h2 class="title-cart">Men's</h2>
                    <div class="products-item-inner">
                        <div class="products-item">
                            <div class="left">
                                <a href="product-details.html"><img src="/assets/img/products/p1.jpg" alt=""></a>
                                <a href="product-details.html" class="quick-view"><i class="icon-magnifier"></i></a>
                            </div>
                            <div class="right">
                                <h5 class="product-name">Floral Print Buttoned</h5>
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <div class="price">
                                    $ 49.00
                                </div>
                            </div>
                        </div>
                        <div class="products-item">
                            <div class="left">
                                <a href="product-details.html"><img src="/assets/img/products/p2.jpg" alt=""></a>
                                <a href="product-details.html" class="quick-view"><i class="icon-magnifier"></i></a>
                            </div>
                            <div class="right">
                                <h5 class="product-name">Floral Print Buttoned</h5>
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <div class="price">
                                    $ 12.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="listcartproducts">
                    <h2 class="title-cart">Women's</h2>
                    <div class="products-item-inner">
                        <div class="products-item">
                            <div class="left">
                                <a href="product-details.html"><img src="/assets/img/products/p3.jpg" alt=""></a>
                                <a href="product-details.html" class="quick-view"><i class="icon-magnifier"></i></a>
                            </div>
                            <div class="right">
                                <h5 class="product-name">Floral Print Buttoned</h5>
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <div class="price">
                                    $ 59.00
                                    <span class="old-price">$ 69.78</span>
                                </div>
                            </div>
                        </div>
                        <div class="products-item">
                            <div class="left">
                                <a href="product-details.html"><img src="/assets/img/products/p4.jpg" alt=""></a>
                                <a href="product-details.html" class="quick-view"><i class="icon-magnifier"></i></a>
                            </div>
                            <div class="right">
                                <h5 class="product-name">Floral Print Buttoned</h5>
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <div class="price">
                                    $ 19.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="listcartproducts">
                    <h2 class="title-cart">Accessories</h2>
                    <div class="products-item-inner">
                        <div class="products-item">
                            <div class="left">
                                <a href="product-details.html"><img src="/assets/img/products/p5.jpg" alt=""></a>
                                <a href="product-details.html" class="quick-view"><i class="icon-magnifier"></i></a>
                            </div>
                            <div class="right">
                                <h5 class="product-name">Floral Print Buttoned</h5>
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <div class="price">
                                    $ 36.60
                                </div>
                            </div>
                        </div>
                        <div class="products-item">
                            <div class="left">
                                <a href="product-details.html"><img src="/assets/img/products/p6.jpg" alt=""></a>
                                <a href="product-details.html" class="quick-view"><i class="icon-magnifier"></i></a>
                            </div>
                            <div class="right">
                                <h5 class="product-name">Floral Print Buttoned</h5>
                                <div class="reviews-icon">
                                    <i class="i-color fa fa-star"></i>
                                    <i class="i-color fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <div class="price">
                                    $ 12.00
                                    <span class="old-price">$ 16.78</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--
<div class="client section">
<div class="container">
<div class="row">
<div id="client-logo" class="owl-carousel flexed-center-elements">
<div class="client-logo item mini-item">
<a href="#">
<img src="/assets/img/clients/logo-01.png" alt="" />
</a>
</div>
<div class="client-logo item ">
<a href="#">
<img src="/assets/img/clients/logo-02.png" alt="" />
</a>
</div>
<div class="client-logo item ">
<a href="#">
<img src="/assets/img/clients/logo-03.png" alt="" />
</a>
</div>
<div class="client-logo item mini-item">
<a href="#">
<img src="/assets/img/clients/logo-04.png" alt="" />
</a>
</div>
<div class="client-logo item mini-item">
<a href="#">
<img src="/assets/img/clients/logo-05.png" alt="" />
</a>
</div>
</div>
</div>
</div>
</div>
-->

<%@ include file="/views/includeFooter.jsp" %>
