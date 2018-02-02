
<%@ include file="/views/includeHeader.jsp" %>

<div id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-6 col-lg-offset-3">
                <div class="login">
                    <div class="login-form-container">
                        <div class="login-text">
                            <h3>Sign up</h3>
                            <p>Please Register using account detail bellow.</p>
                        </div>

                        <c:if test="${errors.size()>0}">
                            <h4 class="error-login">Errors :</h4>
                            <c:forEach items="${errors}" var="error">
                                <h5> <b class="error-login"><c:out value = " - ${error}"/></b> </h5>
                            </c:forEach>
                        </c:if>
                        <br>

                        <form:form method="POST" action="/login/signup" commandName="newUser" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="controls">
                                    <form:input class="form-control" placeholder="First Name"  path="fname"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                    <form:input class="form-control" placeholder="Last Name"  path="lname"></form:input>
                                </div>
                            </div>
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
                            <div class="form-group">
                                <div class="controls">
                                    <form:input class="form-control" placeholder="Region"  path="region"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                    <form:input class="form-control" placeholder="Phone"  path="phone"></form:input>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                    <input class="form-control" type="file" name="avatar_url"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                    <form:select path="type" class="form-control" placeholder="Client type">
                                        <form:option value="CLIENT">Client</form:option>
                                        <form:option value="VENDOR">Vendor</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="button-box">
                                <div class="login-toggle-btn">
                                    <a href="/login/signin">Have an account ?</a>
                                </div>
                                <button type="submit" class="btn btn-common log-btn">Sign up</button>
                            </div>
                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/includeFooter.jsp" %>
