
<%@ include file="/views/includeHeader.jsp" %>

<div id="content" class="product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="widget-search md-30">
                    <form action="#">
                        <input class="form-control" placeholder="Search here..." type="text">
                        <button type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
                <div class="widget-ct widget-categories mb-30">
                    <div class="widget-s-title">
                        <h4>Categories</h4>
                    </div>
                    <ul id="accordion-category" class="product-cat">
                        <c:forEach items="${listSuperCategories}" var="item">
                            <li class="panel">
                                <c:choose>
                                    <c:when test="${not empty item.children && item.children.size() > 0 }">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-category" href="#category${item.id}"> ${item.name} <span><i class="icon-arrow-down"></i></span></a>
                                        <div id="category${item.id}" class="panel-collapse collapse">
                                            <ul class="listSidebar">
                                                <c:forEach items="${item.children}" var="children">
                                                    <li><a href="/filtre/shop?cat_id=${children.id}">${children.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/filtre/shop?cat_id=${item.id}">${item.name} <span></span></a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                        <li><a href="/filtre/shop?cat_id=0" class="pr-all">Shop All</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="shop-content">
                    <div class="col-md-12">
                        <div class="product-option mb-30 clearfix">

                            <div class="showing text-right">
                                <p class="hidden-xs">Showing 01-09 of 17 Results</p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="list-view" class="tab-pane active">
                            <div class="shop-list">
                                <div class="col-md-12">
                                    <div class="shop-product clearfix">
                                        <div class="product-box">
                                            <a href="#"><img src="/assets/img/products/img-01.jpg" alt=""></a>
                                        </div>
                                        <div class="product-info">
                                            <div class="fix">
                                                <h4 class="product-title pull-left"><a href="product-details.html">Qui Ratione Volup</a></h4>
                                                <div class="star-rating pull-right">
                                                    <div class="reviews-icon">
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="product-description mb-20">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate pariatur tenetur fugiat quasi corrupti rerum officiis doloribus, cumque, culpa optio officia voluptatum fugit quis.</p>
                                                <p><b>phone :</b> 26726840</p>
                                                <p><b>closed :</b> false</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="shop-product clearfix">
                                        <div class="product-box">
                                            <a href="#"><img src="assets/img/products/img-02.jpg" alt=""></a>
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
                                            <div class="fix">
                                                <h4 class="product-title pull-left"><a href="product-details.html">Eius Modi Tempo</a></h4>
                                                <div class="star-rating pull-right">
                                                    <div class="reviews-icon">
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fix mb-10">
                                                <span class="price">$ 56.20</span>
                                            </div>
                                            <div class="product-description mb-20">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate pariatur tenetur fugiat quasi corrupti rerum officiis doloribus, cumque, culpa optio officia voluptatum fugit quis.</p>
                                            </div>
                                            <button class="btn btn-common"><i class="fa fa-heart-o" aria-hidden="true"></i> Add to wishlist</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="shop-product clearfix">
                                        <div class="product-box">
                                            <a href="#"><img src="assets/img/products/img-03.jpg" alt=""></a>
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
                                            <div class="fix">
                                                <h4 class="product-title pull-left"><a href="product-details.html">Quia Voluptas Sit</a></h4>
                                                <div class="star-rating pull-right">
                                                    <div class="reviews-icon">
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fix mb-10">
                                                <span class="price">$ 56.20</span>
                                                <span class="old-price font-16px ml-10"><del>$ 96.20</del></span>
                                            </div>
                                            <div class="product-description mb-20">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate pariatur tenetur fugiat quasi corrupti rerum officiis doloribus, cumque, culpa optio officia voluptatum fugit quis.</p>
                                            </div>
                                            <button class="btn btn-common"><i class="fa fa-heart-o" aria-hidden="true"></i> Add to wishlist</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="shop-product clearfix">
                                        <div class="product-box">
                                            <a href="#"><img src="assets/img/products/img-04.jpg" alt=""></a>
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
                                            <div class="fix">
                                                <h4 class="product-title pull-left"><a href="product-details.html">An Tium Lores Eos</a></h4>
                                                <div class="star-rating pull-right">
                                                    <div class="reviews-icon">
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fix mb-10">
                                                <span class="price">$ 56.20</span>
                                            </div>
                                            <div class="product-description mb-20">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate pariatur tenetur fugiat quasi corrupti rerum officiis doloribus, cumque, culpa optio officia voluptatum fugit quis.</p>
                                            </div>
                                            <button class="btn btn-common"><i class="fa fa-heart-o" aria-hidden="true"></i> Add to wishlist</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="shop-product clearfix">
                                        <div class="product-box">
                                            <a href="#"><img src="assets/img/products/img-05.jpg" alt=""></a>
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
                                            <div class="fix">
                                                <h4 class="product-title pull-left"><a href="product-details.html">Magni Dolores Eos</a></h4>
                                                <div class="star-rating pull-right">
                                                    <div class="reviews-icon">
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="i-color fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fix mb-10">
                                                <span class="price">$ 56.20</span>
                                            </div>
                                            <div class="product-description mb-20">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate pariatur tenetur fugiat quasi corrupti rerum officiis doloribus, cumque, culpa optio officia voluptatum fugit quis.</p>
                                            </div>
                                            <button class="btn btn-common"><i class="fa fa-heart-o" aria-hidden="true"></i> Add to wishlist</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pagination">
                    <div class="results-navigation pull-left">
                        Showing: 1 - 6 Of 17
                    </div>
                    <nav class="navigation pull-right">
                        <a class="next-page" href="#"><i class="fa fa-angle-left"></i></a>
                        <span class="current page-num">1</span>
                        <a class="page-num" href="#">2</a>
                        <a class="page-num" href="#">3</a>
                        <div class="divider">...</div>
                        <a class="next-page" href="#"><i class="fa fa-angle-right"></i></a>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</div>


<%@ include file="/views/includeFooter.jsp" %>
