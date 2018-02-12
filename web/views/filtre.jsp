
<%@ include file="/views/includeHeader.jsp" %>

<div id="content" class="product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div class="widget-search md-30">
                    <form action="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&page=${page}" method="get">
                        <input class="form-control" name="keyword" placeholder="Search here..." value="${keyword}" type="text">
                        <input style="display: none" name="condition" value="${condition}" />
                        <input style="display: none" name="cat_id" value="${cat_id}" />
                        <input style="display: none" name="minPrice" value="${minPrice}" />
                        <input style="display: none" name="maxPrice" value="${maxPrice}" />
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
                                                    <li><a <c:if test="${cat_id == children.id}"> class="pr-all" </c:if> href="/filtre?cat_id=${children.id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${page}">${children.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <a <c:if test="${cat_id == item.id}"> class="pr-all" </c:if> href="/filtre?cat_id=${item.id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${page}">${item.name} <span></span></a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                        <li><a href="/filtre?cat_id=0&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${page}" <c:if test="${cat_id == 0}"> class="pr-all" </c:if> >Product All</a></li>
                    </ul>
                </div>
                <div class="widget-ct widget-color mb-30">
                    <div class="widget-s-title">
                        <h4>Condition</h4>
                    </div>
                    <div class="widget-info color-filter clearfix">
                        <ul>
                            <li><a <c:if test="${condition == 'ANY'}"> style="color: #0764ff" </c:if> href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=ANY&keyword=${keyword}&page=${page}"><span class="color"></span>Any</a></li>
                            <li><a <c:if test="${condition == 'NEW'}"> style="color: #0764ff" </c:if> href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=NEW&keyword=${keyword}&page=${page}"><span class="color color-6"></span>New</a></li>
                            <li><a <c:if test="${condition == 'BARELY_USED'}"> style="color: #0764ff" </c:if> href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=BARELY_USED&keyword=${keyword}&page=${page}"><span class="color color-1"></span>Barely used</a></li>
                            <li><a <c:if test="${condition == 'USED'}"> style="color: #0764ff" </c:if> href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=USED&keyword=${keyword}&page=${page}"><span class="color color-2"></span>Used</a></li>
                            <li><a <c:if test="${condition == 'BROKEN'}"> style="color: #0764ff" </c:if> href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=BROKEN&keyword=${keyword}&page=${page}"><span class="color color-3"></span>Broken</a></li>

                        </ul>
                    </div>
                </div>
                <div class="widget-ct widget-filter mb-30">
                    <div class="widget-s-title">
                        <h4>Filter By Price</h4>
                    </div>
                    <form action="/filtre" method="get">
                        <div style="position: relative;">
                            <div style="align-items: center;display: flex; padding: 0 10px;" >
                                <div class="form-group" style="margin-right: 3px">
                                    Min price :
                                    <input class="form-control" type="text" id="minprice" name="minPrice" value="${minPrice}" />
                                </div>

                                <div class="form-group" style="margin-left: 3px">
                                    Max price :
                                    <input class="form-control" type="text" id="maxprice" name="maxPrice" value="${maxPrice}" />
                                </div>
                                <input style="display: none" name="condition" value="${condition}" />
                                <input style="display: none" name="cat_id" value="${cat_id}" />
                                <input style="display: none" name="keyword" value="${keyword}" />
                                <input style="display: none" name="page" value="${page}" />
                            </div>
                            <div class="filter-btn">
                                <button style="width: 100%;" class="btn btn-common" type="submit">Filter</button>
                            </div>
                        </div>
                    </form>
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
                        <div id="grid-view" class="tab-pane active">
                            <c:forEach items="${listProduits}" var="product">
                                <div class="col-md-4 col-sm-6 col-xs-12" style="height: 350px;" >
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
                </div>

                <div class="pagination">
                    <div class="results-navigation pull-left">
                        Showing: ${(limit*(page-1))+1} - ${(limit*(page))} Of ${(limit*(nbPages))}
                    </div>
                    <nav class="navigation pull-right">
                        <c:if test="${page > 1}"><a class="next-page" href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${page-1}"><i class="fa fa-angle-left"></i></a></c:if>
                        <c:choose>
                            <c:when test="${nbPages>4}">
                                <c:choose>
                                    <c:when test="${page>3 && page<nbPages-2}">
                                        <c:forEach var = "i" begin = "1" end = "2">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${page}" end = "${page}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${nbPages-1}" end = "${nbPages}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${page>3 && page>=nbPages-2}">
                                        <c:forEach var = "i" begin = "1" end = "2">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${page}" end = "${nbPages}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var = "i" begin = "1" end = "${page+1}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                        <div class="divider">...</div>
                                        <c:forEach var = "i" begin = "${nbPages-2}" end = "${nbPages}">
                                            <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var = "i" begin = "1" end = "${nbPages}">
                                     <a <c:choose> <c:when test="${page == i}"> class="current page-num" </c:when> <c:otherwise> class="page-num" </c:otherwise> </c:choose>  href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${i}">${i}</a>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${page < nbPages}"><a class="next-page" href="/filtre?cat_id=${cat_id}&minPrice=${minPrice}&maxPrice=${maxPrice}&condition=${condition}&keyword=${keyword}&page=${page+1}"><i class="fa fa-angle-right"></i></a></c:if>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</div>


<%@ include file="/views/includeFooter.jsp" %>
