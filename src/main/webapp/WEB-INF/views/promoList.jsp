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

<%@ include file="/WEB-INF/views/headerLoginUser.jsp" %>

<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/home">Strona główna</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Produkty do promocji</li>
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
                        <div class="product-left-title"><h2>Produkty do promocji</h2></div>
                        <a href="#" class="filter-btn pull-bs-canvas-right">Filtruj</a>
                        <div class="product-sort">
                            <div class="ui selection dropdown vchrt-dropdown"><input name="gender" type="hidden"
                                                                                     value="default"><i
                                    class="dropdown icon d-icon"></i>
                                <div class="text">Filtry</div>
                                <div class="menu">
                                    <div class="item" data-value="1">Cena - od najwyższej do najniższej </div>
                                    <div class="item" data-value="2">Cena - od najniższej do najwyższej </div>
                                    <div class="item" data-value="3">Alfabetycznie</div>
                                    4
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-list-view">
                <div class="row">
<%--                    <c:forEach var="categories" items="${categories}">--%>
<%--                        <tr>--%>
<%--                            <td>${categories.id}</td>--%>
<%--                            <td>${categories.name}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
                    <div class="col-lg-3 col-md-6">
                        <div class="product-item mb-30"><a href="single_product_view.html" class="product-img"><img
                                src="/images/product/img-1.jpg" alt="">
                         </p><h4>Product Title Here</h4>
                                <div class="product-price">$12 <span>$15</span></div>
                                <div class="qty-cart">
                                    <div class="quantity buttons_added"><input type="button" value="-"
                                                                               class="minus minus-btn"><input
                                            type="number" step="1" name="quantity" value="1"
                                            class="input-text qty text"><input type="button" value="+"
                                                                               class="plus plus-btn"></div>
                                    <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="more-product-btn">
                            <button class="show-more-btn hover-btn" onclick="window.location.href = '#';">Show More
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>
