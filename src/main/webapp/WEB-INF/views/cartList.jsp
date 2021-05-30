<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 28/05/2021
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100">
    <div class="bs-canvas-header side-cart-header p-3 ">
        <div class="d-inline-block  main-cart-title">Koszyk <span>()</span></div>
        <button type="button" class="bs-canvas-close close" aria-label="Close"><i class="uil uil-multiply"></i></button>
    </div>
    <div class="bs-canvas-body">
        <div class="cart-top-total">
            <%--            <div class="cart-total-dil"><h4>Targi on-line</h4><span>$34</span></div>--%>
            <%--            <div class="cart-total-dil pt-2"><h4>Delivery Charges</h4><span>$1</span></div>--%>
        </div>
        <c:forEach var="cartList" items="${cartList}">
            <div class="side-cart-items">
                <div class="cart-item">
                    <div class="cart-product-img"><img src="/images/product/img-1.jpg" alt="">
                            <%--                    <div class="offer-badge">6% OFF</div>--%>
                    </div>
                    <div class="cart-text"><h4>${cartList.promo.name}</h4>
                        <div class="cart-radio">

                        </div>
                        <div class="qty-group">
                            <div class="quantity buttons_added">
                                <input type="button" value="-" class="minus minus-btn">
                                <input type="number" step="1" name="quantity" value="${cartList.quantity}" class="input-text qty text">
                                <input type="button" value="+" class="plus plus-btn"></div>
                            <div class="cart-item-price"> </div>
                        </div>
                        <a class="cart-close-btn" href='<c:url value="/app/cart/delete/${cartList.id}"/>' onclick="return confirm('Czy chcesz usunąć wybraną pozycję?');"><i class="uil uil-multiply"></i></a>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

    <div class="bs-canvas-footer">
<%--        <div class="cart-total-dil saving-total "><h4>Kwota końcowa</h4><span>$11</span></div>--%>
        <div class="main-total-cart"><h2>Wartość:</h2><span>$35</span></div>
        <div class="checkout-cart"><a href="" class="promo-code"></a><a href="#" class="cart-checkout-btn hover-btn">Kup
        </a></div>
    </div>
</div>