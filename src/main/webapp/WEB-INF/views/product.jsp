<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 23/05/2021
  Time: 12:38
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
                            <li class="breadcrumb-item"><a href="">Strona główna</a></li>
                            <li class="breadcrumb-item"><a href="/app/product/list">Produkty</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
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
                                    <div class="item"><img src=${product.url} alt=""></div>
                                </div>
                                <div id="sync2" class="owl-carousel owl-theme">
                                    <div class="item"><img src="/images/product/big-1.jpg" alt=""></div>
                                    <div class="item"><img src="/images/product/big-2.jpg" alt=""></div>
                                    <div class="item"><img src="/images/product/big-3.jpg" alt=""></div>
                                    <div class="item"><img src="/images/product/big-4.jpg" alt=""></div>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="product-dt-right"><h2>${product.name}</h2>
                                    <div class="no-stock"><p class="pd-no">Numer produktu:<span>${product.id}</span></p>
<%--                                        <p class="stock-qty">Available<span>(Instock)</span></p></div>--%>
                                    <div class="product-radio">
                                        <ul class="product-now">
                                        </ul>
                                    </div>
                                    <p class="pp-descp">${product.description}</p>
                                    <div class="product-group-dt">
                                        <ul>
                                            <li>
                                                <div class="main-price color-discount">Cena<span>${product.price}</span>
                                                </div>
                                            </li>

                                        </ul>
                                        <ul class="gty-wish-share">
                                            <li>
                                                <div class="qty-product">
<%--                                                    <div class="quantity buttons_added"><input type="button" value="-"--%>
<%--                                                                                               class="minus minus-btn"><input--%>
<%--                                                            type="number" step="1" name="quantity" value="1"--%>
<%--                                                            class="input-text qty text"><input type="button" value="+"--%>
<%--                                                                                               class="plus plus-btn">--%>
<%--                                                    </div>--%>
                                                </div>
                                            </li>
<%--                                            <li><span class="like-icon save-icon" title="wishlist"></span></li>--%>
                                        </ul>
                                        <ul class="ordr-crt-share">
                                            <li>
<%--                                                <button class="add-cart-btn hover-btn"><i--%>
<%--                                                        class="uil uil-shopping-cart-alt"></i>Add to Cart--%>
<%--                                                </button>--%>
                                            </li>
                                            <li>
<%--                                                <button class="order-btn hover-btn">Order Now</button>--%>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="pdp-details">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-12">
<%--                    <div class="pdpt-bg">--%>
<%--                        <div class="pdpt-title"><h4>Więcej podobnych</h4></div>--%>
<%--                        <div class="pdpt-body scrollstyle_4">--%>
<%--                            <div class="cart-item border_radius"><a href="single_product_view.html"--%>
<%--                                                                    class="cart-product-img"><img--%>
<%--                                    src="/images/product/img-6.jpg" alt="">--%>
<%--                                <div class="offer-badge">4% OFF</div>--%>
<%--                            </a>--%>
<%--                                <div class="cart-text"><h4>Product Title Here</h4>--%>
<%--                                    <div class="cart-radio">--%>
<%--                                        <ul class="kggrm-now">--%>
<%--                                            <li><input type="radio" id="k1" name="cart1"><label for="k1">0.50</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k2" name="cart1"><label for="k2">1kg</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k3" name="cart1"><label for="k3">2kg</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k4" name="cart1"><label for="k4">3kg</label>--%>
<%--                                            </li>--%>
<%--                                        </ul>--%>
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
<%--                            </div>--%>
<%--                            <div class="cart-item border_radius"><a href="single_product_view.html"--%>
<%--                                                                    class="cart-product-img"><img--%>
<%--                                    src="/images/product/img-2.jpg" alt="">--%>
<%--                                <div class="offer-badge">6% OFF</div>--%>
<%--                            </a>--%>
<%--                                <div class="cart-text"><h4>Product Title Here</h4>--%>
<%--                                    <div class="cart-radio">--%>
<%--                                        <ul class="kggrm-now">--%>
<%--                                            <li><input type="radio" id="k5" name="cart2"><label for="k5">0.50</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k6" name="cart2"><label for="k6">1kg</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k7" name="cart2"><label for="k7">2kg</label>--%>
<%--                                            </li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                    <div class="qty-group">--%>
<%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
<%--                                                                                   class="minus minus-btn"><input--%>
<%--                                                type="number" step="1" name="quantity" value="1"--%>
<%--                                                class="input-text qty text"><input type="button" value="+"--%>
<%--                                                                                   class="plus plus-btn"></div>--%>
<%--                                        <div class="cart-item-price">$24 <span>$30</span></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="cart-item border_radius"><a href="single_product_view.html"--%>
<%--                                                                    class="cart-product-img"><img--%>
<%--                                    src="/images/product/img-5.jpg" alt=""></a>--%>
<%--                                <div class="cart-text"><h4>Product Title Here</h4>--%>
<%--                                    <div class="cart-radio">--%>
<%--                                        <ul class="kggrm-now">--%>
<%--                                            <li><input type="radio" id="k8" name="cart3"><label for="k8">0.50</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k9" name="cart3"><label for="k9">1kg</label>--%>
<%--                                            </li>--%>
<%--                                            <li><input type="radio" id="k10" name="cart3"><label--%>
<%--                                                    for="k10">1.50kg</label></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                    <div class="qty-group">--%>
<%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
<%--                                                                                   class="minus minus-btn"><input--%>
<%--                                                type="number" step="1" name="quantity" value="1"--%>
<%--                                                class="input-text qty text"><input type="button" value="+"--%>
<%--                                                                                   class="plus plus-btn"></div>--%>
<%--                                        <div class="cart-item-price">$15</div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
                <div class="col-lg-8 col-md-12">
<%--                    <div class="pdpt-bg">--%>
<%--                        <div class="pdpt-title"><h4>Product Details</h4></div>--%>
<%--                        <div class="pdpt-body scrollstyle_4">--%>
<%--                            <div class="pdct-dts-1">--%>
<%--                                <div class="pdct-dt-step"><h4>Description</h4>--%>
<%--                                    <p>Lorem ipsum dolor sit amet,consectetur adipiscing elit. Pellentesque posuere nunc--%>
<%--                                        in condimentum maximus. Integer interdum sem sollicitudin,porttitor felis--%>
<%--                                        in,mollis quam. Nunc gravida erat eu arcu interdum eleifend. Cras tortor--%>
<%--                                        velit,dignissim sit amet hendrerit sed,ultricies eget est. Donec eget urna sed--%>
<%--                                        metus dignissim cursus.</p></div>--%>
<%--                                <div class="pdct-dt-step"><h4>Benefits</h4>--%>
<%--                                    <div class="product_attr">Aliquam nec nulla accumsan,accumsan nisl in,rhoncus--%>
<%--                                        sapien.<br>In mollis lorem a porta congue.<br>Sed quis neque sit amet nulla--%>
<%--                                        maximus dignissim id mollis urna.<br>Cras non libero at lorem laoreet finibus--%>
<%--                                        vel et turpis.<br>Mauris maximus ligula at sem lobortis congue.<br></div>--%>
<%--                                </div>--%>
<%--                                <div class="pdct-dt-step"><h4>How to Use</h4>--%>
<%--                                    <div class="product_attr">The peeled,orange segments can be added to the daily fruit--%>
<%--                                        bowl,and its juice is a refreshing drink.--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="pdct-dt-step"><h4>Seller</h4>--%>
<%--                                    <div class="product_attr">Gambolthemes Pvt Ltd,Sks Nagar,Near Mbd--%>
<%--                                        Mall,Ludhana,141001--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="pdct-dt-step"><h4>Disclaimer</h4>--%>
<%--                                    <p>Phasellus efficitur eu ligula consequat ornare. Nam et nisl eget magna aliquam--%>
<%--                                        consectetur. Aliquam quis tristique lacus. Donec eget nibh et quam maximus--%>
<%--                                        rutrum eget ut ipsum. Nam fringilla metus id dui sollicitudin,sit amet maximus--%>
<%--                                        sapien malesuada.</p></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div><!-- Featured Products Start -->
    <div class="section145">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-title-tt">
                        <div class="main-title-left"><span>Dla Ciebie</span>
                            <h2>Podobne produkty</h2></div>
                        <a href="/app/product/list" class="see-more-btn">Zobacz wszystkie</a></div>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel featured-slider owl-theme">
                        <c:forEach var="productList" items="${productList}">
                        <div class="item">
                            <div class="product-item"><a href="/app/product/show/${productList.id}" class="product-img"><img
                                    src="/images/product/img-3.jpg" alt="">
<%--                                <div class="product-absolute-options"><span class="offer-badge-1"></span><span--%>
<%--                                        class="like-icon" title="wishlist"></span></div>--%>
                            </a>
                                <div class="product-text-dt"><p><span></span></p><h4>${productList.name}</h4>
                                    <div class="product-price">${productList.price}<span></span></div>
                                    <div class="qty-cart">
<%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
<%--                                                                                   class="minus minus-btn"><input--%>
<%--                                                type="number" step="1" name="quantity" value="1"--%>
<%--                                                class="input-text qty text"><input type="button" value="+"--%>
<%--                                                                                   class="plus plus-btn"></div>--%>
<%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Featured Products End --></div>



<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>
