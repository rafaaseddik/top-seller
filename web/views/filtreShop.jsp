
<%@ include file="/views/includeHeader.jsp" %>

<div id="content" class="product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="widget-search md-30">
                    <form action="/filtre/shop" method="get">
                        <input class="form-control" name="keyword" placeholder="Search here..." value="${keyword}" type="text">
                        <input style="display: none" name="cat_id" value="${cat_id}" />
                        <input style="display: none" name="page" value="${page}" />
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
                                                    <li><a <c:if test="${cat_id == children.id}"> class="pr-all" </c:if>  href="/filtre/shop?cat_id=${children.id}&page=${page}&keyword=${keyword}">${children.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <a <c:if test="${cat_id == item.id}"> class="pr-all" </c:if> href="/filtre/shop?cat_id=${item.id}&page=${page}&keyword=${keyword}">${item.name} <span></span></a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                        <li><a <c:if test="${cat_id == 0}"> class="pr-all" </c:if> href="/filtre/shop?cat_id=0&page=${page}&keyword=${keyword}">Shop All</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="shop-content">
                    <div class="col-md-12">
                        <div class="product-option mb-30 clearfix">

                            <div class="showing text-right">
                                <p class="hidden-xs">Showing: ${(limit*(page-1))+1} - ${(limit*(page))} Of ${(limit*(nbPages))} Results</p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="list-view" class="tab-pane active">
                            <div class="shop-list">
                                <c:forEach items="${listShops}" var="shop">
                                    <div class="col-md-12">
                                        <div class="shop-product clearfix">
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
                                                <div class="fix">
                                                    <h4 class="product-title pull-left"><a href="/shop?id=${shop.id}">${shop.name}</a></h4>
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
                                                <div class="product-description mb-20">
                                                    <p>Category : ${shop.category.name}</p>
                                                    <p>Adresse : ${shop.address}</p>
                                                    <p>Phone : ${shop.phone}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pagination">
                    <div class="results-navigation pull-left">
                        Showing: ${(limit*(page-1))+1} - ${(limit*(page))} Of ${(limit*(nbPages))}
                    </div>
                    <nav class="navigation pull-right">
                        <c:if test="${page > 1}"><a class="next-page" href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${page-1}"><i class="fa fa-angle-left"></i></a></c:if>
                        <c:choose>
                            <c:when test="${nbPages>4}">
                                <c:choose>
                                    <c:when test="${page>3 && page<nbPages-2}">
                                        <c:forEach var = "i" begin = "1" end = "2">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${page}" end = "${page}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${nbPages-1}" end = "${nbPages}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${page>3 && page>=nbPages-2}">
                                        <c:forEach var = "i" begin = "1" end = "2">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${page}" end = "${nbPages}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var = "i" begin = "1" end = "${page+1}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${nbPages-2}" end = "${nbPages}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var = "i" begin = "1" end = "${nbPages}">
                                    <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${i}">${i}</a>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${page < nbPages}"><a class="next-page" href="/filtre/shop?cat_id=${cat_id}&keyword=${keyword}&page=${page+1}"><i class="fa fa-angle-right"></i></a></c:if>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</div>


<%@ include file="/views/includeFooter.jsp" %>
