
<%@ include file="/views/includeHeader.jsp" %>

<section style="background: white">
    <div class="container">
        <div class="row">
            <h1 class="section-title"><c:choose> <c:when test="${not empty type && type == 'edit'}">Edit</c:when> <c:otherwise>Add</c:otherwise></c:choose> product</h1>
            <div id="list-view" class="tab-pane active">
                <c:choose> <c:when test="${not empty type && type == 'edit'}">Edit</c:when> <c:otherwise>Create</c:otherwise></c:choose>


                <form:form commandName="productForm" action="" method="post" enctype="multipart/form-data">

                <div class="shop-list">
                <div class="col-md-12">
                    <div class="">
                            <div class="">

                                <div class="product-description mb-20">
                                    <p>Name : </p> <form:input cssClass="form-control" path="name"></form:input>
                                    <p>Status : </p>
                                    <form:select cssClass="form-control" path="pstatus">
                                        <form:option value="NEW">NEW</form:option>
                                        <form:option value="USED">USED</form:option>
                                        <form:option value="BROKEN">BROKEN</form:option>
                                        <form:option value="BARELY_USED">BARELY USED</form:option>
                                    </form:select>
                                    <p>Category : </p>
                                    <form:select cssClass="form-control" path="categoryId">
                                    <c:forEach items="${listSuperCategories}" var="cat">
                                        <form:option value="${cat.id}">-- ${cat.name}</form:option>
                                        <c:forEach items="${cat.children}" var="chil">
                                            <form:option value="${chil.id}">${chil.name}</form:option>
                                        </c:forEach>
                                    </c:forEach>
                                    </form:select>
                                    <p>Price : </p> <form:input cssClass="form-control" path="price"></form:input>
                                    <p>Quantity : </p> <form:input cssClass="form-control" path="quantity"></form:input>
                                    <p>Description : </p> <form:textarea rows="8" cssClass="form-control" path="description"></form:textarea><br>
                                    <c:if test="${type == 'edit'}">
                                    <div class="row">
                                        <c:forEach items="${productForm.images}" var="image">
                                            <div class="col-xs-3">
                                                <img style="max-height: 200px;object-fit: contain;margin-bottom: 5px" src="
                                                <c:choose>
                                                <c:when test="${not empty image}">
                                                    ${imagesServerURL}${image}
                                            </c:when>
                                                <c:otherwise>
                                                    ${imagesServerURL}defaultProduct.jpg
                                                </c:otherwise>
                                            </c:choose>
                                                ">
                                                <a href="/account/shop/product/photo/remove?id=${id}&name=${image}&shopId=${shopId}"><c:if test="${not empty image}"><img style="position: absolute; width: 50px; top: 0px;" src="${imagesServerURL}delete.png"></c:if></a>
                                            </div>
                                        </c:forEach>
                                    </div></c:if>
                                    <c:if test="${type == 'edit'}"><p>Add <c:if test="${type == 'edit'}">new</c:if> photo : </p> <input class="form-control" name="filePhoto" type="file" />
                                    <br>
                                    </c:if>
                                    <button class="btn btn-common"><i class="icon-basket-loaded-loaded"></i><c:choose> <c:when test="${not empty type && type == 'edit'}">Edit</c:when> <c:otherwise>Add</c:otherwise></c:choose></button>
                                </div>
                            </div>
                    </div>
                </div>
                </form:form>

            </div>
        </div>
        </div>
    </div>
</section>



<%@ include file="/views/includeFooter.jsp" %>
