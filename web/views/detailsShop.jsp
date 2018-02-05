
<%@ include file="/views/includeHeader.jsp" %>
<section style="height: 200px;z-index: -1;width:  100%;position: absolute;background: url(<c:choose>
<c:when test="${not empty shop.coverURL }">${imagesServerURL}${shop.coverURL} </c:when> <c:otherwise> http://localhost/fileupload/topseller/defaultStore.jpg</c:otherwise></c:choose>) center;background-size: cover"></section>
<section style="height: 200px;z-index: -1;width:  100%;background: #0c0c0c7d;position: absolute;"></section>
<section id="product-collection" class="section" style="height: 200px;padding: 10px;">
    <div class="container">
        <div style="display: flex;align-items: center;align-content: center;height: 200px">
            <div style="width: 200px">
                <div class="product-details-image">
                        <div>
                            <img style="width: 180px; height: 160px; background: #fff; object-fit: contain; border-radius: 10px;" src="
                        <c:choose>
                            <c:when test="${not empty shop.logoURL }">
                                    ${imagesServerURL}${shop.logoURL}
                            </c:when>
                            <c:otherwise>
                                http://localhost/fileupload/topseller/defaultStore.png
                            </c:otherwise>
                        </c:choose>
                    " alt="">
                </div>
                </div>
            </div>
            <div style="width: calc(100% - 200px);color: white">
                <div class="info-panel">
                    <h1 class="product-title">${shop.name}
                        <div class="pull-right">
                            <div class="reviews-icon">
                                <i class="fa <c:choose><c:when test="${shop.globalScore>0.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                <i class="fa <c:choose><c:when test="${shop.globalScore>1.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                <i class="fa <c:choose><c:when test="${shop.globalScore>2.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                <i class="fa <c:choose><c:when test="${shop.globalScore>3.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                <i class="fa <c:choose><c:when test="${shop.globalScore>4.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                            </div>
                        </div>
                    </h1>

                    <div class="price-ratting">
                        <div class="price float-left">
                            <p style="color: white"> <b>Address : </b>${shop.address}</p>
                            <p style="color: white"> <b>Phone : </b>${shop.phone}</p>
                            <p style="color: white"> <b>Category : </b>${shop.category.name}</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<section style="width: 100%;height: 200px;">
    <iframe
            width="2000"
            height="200"
            frameborder="0"
            scrolling="no"
            marginheight="0"
            marginwidth="0"
            src="https://maps.google.com/maps?q=+${shop.longitude}+,+${shop.latitude}+&hl=es;z=2&amp;output=embed"
    >
    </iframe>
</section>

<div id="content" class="product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <div id="reviews">
                    <div class="pro-tab-info pro-reviews" <c:if test="${not empty loggedUser}">style="padding-bottom: 150px;"</c:if>>
                        <c:if test="${shop.commentsList.size()>0}">
                            <div class="customer-review">
                                <h3 class="small-title" style="font-size: 18px;">Customer review</h3>
                                <div class="product-comments clearfix">
                                    <c:forEach items="${shop.commentsList}" var="comment">
                                        <div class="mb-30">
                                            <div class="pro-reviewer-comment" style="margin: 0;padding: 0">
                                                <div class="fix">
                                                    <div class="">
                                                        <h5><strong>${comment.user.fname} ${comment.user.lname}</strong></h5>
                                                        <div class="reviews-icon">
                                                            <i class="fa <c:choose><c:when test="${comment.score>0.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${comment.score>1.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${comment.score>2.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${comment.score>3.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                            <i class="fa <c:choose><c:when test="${comment.score>4.5}">i-color fa-star</c:when><c:otherwise>fa-star-o</c:otherwise></c:choose>"></i>
                                                        </div>
                                                        <p class="reply-date">${comment.date}</p>
                                                    </div>
                                                </div>
                                                <p>${comment.text}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty loggedUser}">
                            <div class="leave-review">
                            <h3 class="small-title" style="font-size: 18px;">Leave your review</h3>
                            <form:form method="post" action="/shop?id=${id}" commandName="formComment">
                                <div class="your-rating mb-30" style="margin-bottom: 5px;">
                                    <p class="mb-10"><strong>Your Rating</strong></p>
                                    <form:input path="rate" style="width: 80%"></form:input> / 5
                                </div>
                                <div class="reply-box">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <form:textarea class="form-control " path="comment" rows="4" placeholder="Your review here..."></form:textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <button class="btn btn-common" type="submit">Submit Review</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </form:form>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
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
</div>

<%@ include file="/views/includeFooter.jsp" %>
