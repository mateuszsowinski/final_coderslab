<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 22/05/2021
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<%@ include file="/WEB-INF/views/headerLoginUser.jsp" %>

<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/home">Strona główna</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Promocje</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="all-product-grid">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-top-dt">
                        <div class="product-left-title"><h2>Promocje</h2></div>
                        <a href="#" class="filter-btn pull-bs-canvas-right">Filtry</a>
                        <div class="product-sort">
                            <div class="ui selection dropdown vchrt-dropdown"><input name="gender" type="hidden"
                                                                                     value="default"><i
                                    class="dropdown icon d-icon"></i>
                                <div class="text"></div>
                                <div class="menu">
                                    <div class="item" data-value="0">Alfabetycznie</div>
                                    <div class="item" data-value="1">Cena- od najniższej</div>
                                    <div class="item" data-value="2">Cena- od najwyższej</div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-list-view">
                <div class="row">
                    <c:forEach var="promoList" items="${promoList}">
                        <form:form method="post" modelAttribute="cartAdd">
<%--                            <security:authorize access="isAuthenticated()">--%>
                                <div class="col-lg-3 col-md-6">
                                    <div class="product-item mb-30"><a href="/app/promo/show/${promoList.id}"
                                                                       class="product-img"><img
                                            src="/images/product/img-1.jpg" alt="">
                                            <%--                                <div class="product-absolute-options"><span class="offer-badge-1"></span><span--%>
                                            <%--                                        class="like-icon" title="wishlist"></span></div>--%>
                                    </a>
                                        <div class="product-text-dt"><p><span></span></p><h4>${promoList.name}</h4>
                                            <div class="product-price">${promoList.price}<span></span></div>
                                            <div class="qty-cart">
                                                <div class="quantity buttons_added">
                                                    <input type="button" value="-" class="minus minus-btn">
<%--                                                    <a hidden><form:input path="user.id" value="9"></form:input></a>--%>
                                                    <form:input path="quantity" type="number" step="1" name="quantity" value="1" class="input-text qty text"></form:input>
                                                    <input type="button" value="+" class="plus plus-btn"></div>
                                                <a hidden><form:input path="promo.id" value="${promoList.id}"></form:input></a>
                                                <span class="cart-icon"><form:button type="submit" class="uil uil-shopping-cart-alt"></form:button></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>

                        </form:form>
                    </c:forEach>
                    <div class="col-md-12">
                        <div class="more-product-btn">
                            <%--                            <button class="show-more-btn hover-btn" onclick="window.location.href = '#';">Show More--%>
                            <%--                            </button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>
