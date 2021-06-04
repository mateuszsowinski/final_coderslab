<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 02/06/2021
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@include file="/WEB-INF/views/headerLoginUser.jsp"%>
<form:form method="post" modelAttribute="points">
    <form:hidden path="points" value="${promo.points}"/>
    <form:hidden path="promoPoints" value="${promo.id}"/>

<form:form method="post" modelAttribute="cartAdd">

<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/home">Strona główna</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${promo.name}</li>
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
                    <div class="product-dt-view">
                        <div class="row">
                            <div class="col-lg-4 col-md-4">
                                <div id="sync1" class="owl-carousel owl-theme">
                                    <div class="item"><img src="/images/product/big-1.jpg" alt=""></div>

                                </div>
                                <div id="sync2" class="owl-carousel owl-theme">
                                    <div class="item"><img src="/images/product/big-1.jpg" alt=""></div>
                                     </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="product-dt-right"><h2>${promo.name}</h2>
                                    <div class="no-stock"><p class="pd-no">Numer promocji<span>${promo.id}</span></p>
<%--                                        <p class="stock-qty">Available<span>(Instock)</span></p></div>--%>
                                    <div class="product-radio">
                                        <ul class="product-now">

                                        </ul>
                                    </div>
                                    <p class="pp-descp">${promo.shortDescription}</p>
                                    <div class="product-group-dt">
                                        <ul>
                                            <li>
                                                <div class="main-price color-discount">Cena pakietu<span>${promo.price}</span>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="gty-wish-share">
                                            <li>
                                                <div class="qty-product">
                                                    <div class="quantity buttons_added"><input type="button" value="-" class="minus minus-btn">

                                                        <a hidden><form:input path="promo" value="${promo.id}"/></a>
                                                        <form:input type="number" step="1" name="quantity" value="1" class="input-text qty text" path="quantity"/>
                                                        <input type="button" value="+" class="plus plus-btn">
                                                    </div>
                                                </div>
                                            </li>
                                            <button disabled class="order-btn hover-btn">Za ten zakup otrzymasz ${promo.points} punktów</button>

                                        <%--                                            <li><span class="like-icon save-icon" title="wishlist"></span></li>--%>
                                        </ul>
                                        <ul class="ordr-crt-share">
                                            <li>
                                                <button class="add-cart-btn hover-btn"><i
                                                        class="uil uil-shopping-cart-alt"></i>Dodaj do koszyka</button>
                                            </li>
                                            <li>
<%--                                                <button class="order-btn hover-btn">Za ten zakup otrzymasz ${promo.points}</button>--%>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="pdpt-bg">
                        <div class="pdpt-title"><h4>Produkty z pakietu</h4></div>
                        <c:forEach var="products" items="${promo.product_item}">
                        <div class="pdpt-body scrollstyle_4">

                            <div class="cart-item border_radius"><a href="/app/product/show/${products.id}"
                                                                    class="cart-product-img"><img
                                    src="${pageContext.request.contextPath}/images/product/img-6.jpg" alt="">
<%--                                <div class="offer-badge">4% OFF</div>--%>
                            </a>
                                <div class="cart-text"><h4>${products.name}</h4>
<%--                                    xdiv class="cart-radio">--%>

<%--                                    </div>--%>
<%--                                    <div class="qty-group">--%>
<%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
<%--                                                                                   class="minus minus-btn"><input--%>
<%--                                                type="number" step="1" name="quantity" value="1"--%>
<%--                                                class="input-text qty text"><input type="button" value="+"--%>
<%--                                                                                   class="plus plus-btn"></div>--%>
<%--                                        <div class="cart-item-price">$12 <span>$15</span></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                    </div>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="pdpt-bg">
                        <div class="pdpt-title"><h4>Opis pakietu</h4></div>
                        <div class="pdpt-body scrollstyle_4">
                            <div class="pdct-dts-1">
                                <div class="pdct-dt-step"><h4>Szczegóły</h4>
                                    <p>${promo.description}

                                        Lorem ipsum dolor sit amet,consectetur adipiscing elit. Pellentesque posuere nunc
                                        in condimentum maximus. Integer interdum sem sollicitudin,porttitor felis
                                        in,mollis quam. Nunc gravida erat eu arcu interdum eleifend. Cras tortor
                                        velit,dignissim sit amet hendrerit sed,ultricies eget est. Donec eget urna sed
                                        metus dignissim cursus.</p></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Featured Products Start -->
   <!-- Featured Products End --></div>

</form:form>

</form:form>
<%@include file="/WEB-INF/views/footerLoginUser.jsp"%>
