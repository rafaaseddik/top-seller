
<%@ include file="/views/includeHeader.jsp" %>

<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title">My shops</h1>
            <div id="list-view" class="tab-pane active">
            <div class="shop-list">
                <a href="/account/shop/add"><button class="btn btn-primary pull-right" style="position: relative; top: -50px;padding: 10px;">Add shop</button></a>
                <c:forEach items="${listMyShops}" var="shop">
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
                                <p>Phone : ${shop.phone}</p><br>
                                <a href="/account/shop/edit?id=${shop.id}" ><button class="btn btn-common"><i class="icon-basket-loaded-loaded"></i>Modify</button></a>
                                <a href="/account/shop/delete?id=${shop.id}" ><button style="background: #ff4949" class="btn btn-common"><i class="icon-basket-loaded-loaded"></i>Delete</button></a>
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


<%@ include file="/views/includeFooter.jsp" %>
