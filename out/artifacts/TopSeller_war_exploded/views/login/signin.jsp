<%@ include file="/views/includeHeader.jsp" %>

<div id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-6 col-lg-offset-3">
                <div class="login">
                    <div class="login-form-container">
                        <div class="login-text">
                            <h3>Login</h3>
                            <p>Please Register using account detail bellow.</p>
                        </div>

                        <c:if test="${errors.size()>0}">
                            <h4 class="error-login">Errors :</h4>
                            <c:forEach items="${errors}" var="error">
                                <h5> <b class="error-login"><c:out value = " - ${error}"/></b> </h5>
                            </c:forEach>
                        </c:if>

                        <br>

                        <form:form class="login-form" method="post" action="/login/signin/" commandName="login">
                            <div class="form-group">
                                <div class="controls">
                                    <form:input class="form-control" placeholder="Email"  path="email"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                    <form:input class="form-control" placeholder="Password"  path="password"></form:input>
                                </div>
                            </div>
                            <div class="button-box">
                                <div class="login-toggle-btn">
                                    <input type="checkbox">
                                    <label>Remember me</label>
                                    <a href="/login/signup">Create account ?</a>
                                </div>
                                <button type="submit" class="btn btn-common log-btn">Login</button>
                            </div>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/includeFooter.jsp" %>
