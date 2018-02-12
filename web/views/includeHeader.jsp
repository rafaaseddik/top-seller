<%@ include file="/views/libs.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Ecommerce">
    <title>e-shop.tn - eCommerce web site</title>

    <link rel="shortcut icon" href="/assets/img/favicon.png">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/bootstrap-select.min.css" type="text/css">

    <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css" type="text/css">

    <link rel="stylesheet" href="/assets/fonts/line-icons/line-icons.css" type="text/css">

    <link rel="stylesheet" href="/assets/css/main.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/settings.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/animate.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="/assets/extras/owl.theme.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/ion.rangeSlider.css" type="text/css">
    <link rel="stylesheet" href="/assets/extras/ion.rangeSlider.skinFlat.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/component.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/slick.css" type="text/css">
    <link rel="stylesheet" href="/assets/extras/slick-theme.css" type="text/css">

    <link rel="stylesheet" href="/assets/extras/nivo-lightbox.css" type="text/css">

    <link rel="stylesheet" href="/assets/css/slicknav.css" type="text/css">

    <link rel="stylesheet" href="/assets/css/responsive.css" type="text/css">
</head>
<body>

<div class="header">

    <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-4">
                    <div class="language-wrapper">
                        <div class="box-language">
                            <form id="form-language">
                                <div class="btn-group toggle-wrap">
                                </div>
                            </form>
                        </div>

                        <a href="#"><i class="icon-phone"></i> Call Us: (216) 26 726 840 - (216) 25 011 291</a>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="col-md-6 col-sm-8">
                    <div class="search-area" style="width: 100%;">
                        <form action="/search" method="get">

                            <div class="control-group">
                                <select style="
                                        width:  100px;
                                        height: 38px;
                                        border: none;
                                        background:  none;
                                        margin:  0;
                                        padding:  0;
                                        border-radius: 0px!important;
                                    " name="type" class="categories-filter">
                                    <option value="1">Product</option>
                                    <option value="2">Shop</option>
                                </select>
                                |
                                <input class="search-field" name="keyword" placeholder="Search here...">
                                <button class="search-button" type="submit"><i class="icon-magnifier"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <nav class="navbar navbar-default" data-spy="affix" data-offset-top="50">
        <div class="container">
            <div class="row">
                <div class="navbar-header">

                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="/home">
                        <img src="/assets/img/logo.png" alt="">
                    </a>
                </div>
                <div class="navbar-collapse collapse">

                    <ul class="nav navbar-nav">
                        <li>
                            <a  <c:if test="${pageName == 'home'}"> class="active" </c:if> href="/home">
                                Home
                            </a>
                        </li>
                        <li>
                            <a <c:if test="${pageName == 'about'}"> class="active" </c:if> href="/about">
                                About
                            </a>
                        </li>
                        <li>
                            <a <c:if test="${pageName == 'product'}"> class="active" </c:if> href="#">Our products <span class="caret"></span></a>
                            <div class="dropdown mega-menu megamenu1">
                                <div class="row">

                                    <div class="col-sm-3 col-xs-12">
                                        <ul class="menulinks">
                                            <li class="maga-menu-title">
                                                <a href="#">Our products</a>
                                            </li>
                                            <li><a href="/filtre?cat_id=0">All products</a></li>
                                            <c:forEach items="${listSuperCategories}" var="category">
                                                <c:if test="true">
                                                    <li><a href="/filtre?cat_id=${category.id}">${category.name}</a></li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <c:forEach items="${listSuperCategories}" var="category">
                                        <c:if test="${category.children != null && category.children.size() > 0}">
                                            <div class="col-sm-3 col-xs-12">
                                                <ul class="menulinks">
                                                    <li class="maga-menu-title">
                                                        <a href="/filtre?cat_id=${category.id}">${category.name}</a>
                                                    </li>
                                                    <c:forEach items="${category.children}" var="children">
                                                        <li><a href="/filtre?cat_id=${children.id}">${children.name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a <c:if test="${pageName == 'shop'}"> class="active" </c:if> href="#">Our Shops <span class="caret"></span></a>
                            <div class="dropdown mega-menu megamenu1">
                                <div class="row">

                                    <div class="col-sm-3 col-xs-12">
                                        <ul class="menulinks">
                                            <li class="maga-menu-title">
                                                <a href="#">Our shops</a>
                                            </li>
                                            <li><a href="/filtre/shop?cat_id=0">All shops</a></li>
                                            <c:forEach items="${listSuperCategories}" var="category">
                                                <c:if test="true">
                                                    <li><a href="/filtre/shop?cat_id=${category.id}">${category.name}</a></li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <c:forEach items="${listSuperCategories}" var="category">
                                        <c:if test="${category.children != null && category.children.size() > 0}">
                                            <div class="col-sm-3 col-xs-12">
                                                <ul class="menulinks">
                                                    <li class="maga-menu-title">
                                                        <a href="/filtre/shop?cat_id=${category.id}">${category.name}</a>
                                                    </li>
                                                    <c:forEach items="${category.children}" var="children">
                                                        <li><a href="/filtre/shop?cat_id=${children.id}">${children.name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a <c:if test="${pageName == 'contact'}"> class="active" </c:if> href="/contact">
                                Contact
                            </a>
                        </li>
                    </ul>

                    <div class="icon-right pull-right">
                        <div class="text-right">

                            <div class="account link-inline">
                                <div class="dropdown text-right">
                                    <a href="#" aria-expanded="false" class="dropdown-toggle" data-toggle="dropdown">
                                        <span class="icon-user"></span>

                                        <c:choose>
                                            <c:when test="${empty loggedUser}">
                                                Account
                                            </c:when>
                                            <c:otherwise>
                                                ${loggedUser.fname} ${loggedUser.lname}
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="icon-arrow-down"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <!--<li><a href="login-form.html"><span class="icon icon-user"></span>My Account</a></li>
                                        <li><a href="wishlist.html"><span class="icon icon-heart"></span>My Wishlist</a></li>
                                        <li><a href="compare.html"><span class="icon icon-graph"></span>Compare</a></li>
                                        <li><a href="checkout.html"><span class="icon icon-check"></span>Checkout</a></li>-->
                                        <c:choose>
                                            <c:when test="${empty loggedUser}">
                                                <li><a href="/login/signin"><span class="icon icon-lock"></span>Log In</a></li>
                                                <li><a href="/login/signup"><span class="icon icon-user-follow"></span>Create an account</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${loggedUser.type.toString() == 'VENDOR'}">
                                                    <li><a href="/account/shop/add"><span class="icon icon-magnifier-add"></span>Add shop</a></li>
                                                    <li><a href="/account/shops"><span class="icon icon-list"></span>My shops</a></li>
                                                </c:if>
                                                <c:if test="${loggedUser.type.toString() == 'ADMIN'}">
                                                    <li><a href="/admin/users"><span class="icon icon-list"></span>List users</a></li>
                                                    <li><a href="/admin/shops"><span class="icon icon-list"></span>List shops</a></li>
                                                    <li><a href="/admin/products"><span class="icon icon-list"></span>List products</a></li>
                                                    <li><a href="/admin/reports"><span class="icon icon-list"></span>List reports</a></li>
                                                    <li><a href="/admin/messages"><span class="icon icon-list"></span>List messages</a></li>
                                                </c:if>
                                                <li><a href="/logout"><span class="icon icon-lock"></span>Log out</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <ul class="mobile-menu">
            <li>
                <a class="active" href="index.html">
                    Home
                </a>
                <ul class="dropdown">
                    <li>
                        <a href="index.html">Home V1</a>
                    </li>
                    <li>
                        <a class="active" href="index-2.html">Home V2</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="about.html">About</a>
            </li>
            <li>
                <a href="#">Catalog</a>
                <ul class="dropdown menulinks">
                    <li class="maga-menu-title">
                        <a href="#">Men</a>
                    </li>
                    <li><a href="category.html">Clothing</a></li>
                    <li><a href="category.html">Handbags</a></li>
                    <li><a href="category.html">Maternity</a></li>
                    <li><a href="category.html">Jewelry</a></li>
                    <li><a href="category.html">Scarves</a></li>
                    <li class="maga-menu-title">
                        <a href="#">Women</a>
                    </li>
                    <li><a href="category.html">Handbags</a></li>
                    <li><a href="category.html">Jewelry</a></li>
                    <li><a href="category.html">Clothing</a></li>
                    <li><a href="category.html">Watches</a></li>
                    <li><a href="category.html">Hats</a></li>
                    <li class="maga-menu-title">
                        <a href="#">Accessories</a>
                    </li>
                    <li><a href="category.html">Belts</a></li>
                    <li><a href="category.html">Scarves</a></li>
                    <li><a href="category.html">Hats</a></li>
                    <li><a href="category.html">Ties</a></li>
                    <li><a href="category.html">Handbags</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Shop</a>
                <ul class="menulinks">
                    <li class="maga-menu-title">
                        <a href="#">Shop Types</a>
                    </li>
                    <li><a href="shop.html">Shop</a></li>
                    <li><a href="shop-grid.html">Shop Grid Sidebar</a></li>
                    <li><a href="shop-list.html">Shop List Sidebar</a></li>
                    <li><a href="shop-right-sidebar.html">Shop Right Sidebar</a></li>
                    <li><a href="product-details.html">Product Details</a></li>
                    <li class="maga-menu-title">
                        <a href="#">Shop Pages</a>
                    </li>
                    <li><a href="shopping-cart.html">Cart Page</a></li>
                    <li><a href="checkout.html">Checkout Page</a></li>
                    <li><a href="wishlist.html">Wishlist</a></li>
                    <li><a href="order.html">Your Order</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="login-form.html">My Account</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Pages <span class="caret"></span></a>
                <ul class="dropdown">
                    <li>
                        <a href="about.html">About Us</a>
                    </li>
                    <li>
                        <a href="services.html">Services</a>
                    </li>
                    <li>
                        <a href="contact.html">Contact Us</a>
                    </li>
                    <li>
                        <a href="product-details.html">Product Details</a>
                    </li>
                    <li>
                        <a href="team.html">Team Member</a>
                    </li>
                    <li>
                        <a href="checkout.html">Checkout</a>
                    </li>
                    <li>
                        <a href="shopping-cart.html">Shopping cart</a>
                    </li>
                    <li>
                        <a href="faq.html">FAQs</a>
                    </li>
                    <li>
                        <a href="wishlist.html">Wishlist</a>
                    </li>
                    <li>
                        <a href="404.html">404 Error</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">Blog</a>
                <ul class="dropdown">
                    <li>
                        <a href="blog.html">Blog Right Sidebar</a>
                    </li>
                    <li>
                        <a href="blog-left-sidebar.html">Blog Left Sidebar</a>
                    </li>
                    <li>
                        <a href="blog-full-width.html">Blog Full Width</a>
                    </li>
                    <li>
                        <a href="blog-details.html">Blog Details</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="contact.html">Contact</a>
            </li>
        </ul>

    </nav>
</div>


