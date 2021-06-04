<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@ include file="/WEB-INF/views/headerLoginUser.jsp" %>

<!-- Body Start -->
<div class="wrapper"><!-- Offers Start -->
    <div class="main-banner-slider">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel offers-banner owl-theme">

                        <c:forEach var="promoList" items="${promoList}">
                            <div class="item">
                                <div class="offer-item">
                                    <div class="offer-item-img">
                                        <div class="gambo-overlay"></div>
                                        <img src="/images/banners/offer-1.jpg" alt=""></div>
                                    <div class="offer-text-dt">
                                        <div class="offer-top-text-banner"><p></p>
                                            <div class="top-text-1">${promoList.name}</div>
                                            <span></span></div>
                                        <a href="/app/promo/show/${promoList.id}" class="Offer-shop-btn hover-btn">Zobacz</a></div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div><!-- Offers End --><!-- Categories Start -->
    <div class="section145">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-title-tt">
                        <div class="main-title-left"><span></span>
                            <h2>Kategorie</h2></div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel cate-slider owl-theme">
                        <c:forEach var="cetegoryList" items="${categoryList}">

                            <div class="item"><a href="#" class="category-item">
                                <div class="cate-img"><img src="images/category/icon-1.svg" alt=""></div>
                                <h4>${cetegoryList.name}</h4></a></div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div><!-- Categories End --><!-- Featured Products Start -->
    <div class="section145">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-title-tt">
                        <div class="main-title-left"><span></span>
                            <h2>Produkty</h2></div>
                        <a href="/app/product/list" class="see-more-btn">Zobacz wszystkie</a></div>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel featured-slider owl-theme">
                        <c:forEach var="productList" items="${productList}">
                        <div class="item">
                            <div class="product-item"><a href="/app/product/show/${productList.id}" class="product-img"><img
                                    src="/images/product/img-2.jpg" alt="">
<%--                                <div class="product-absolute-options"><span class="offer-badge-1">2% off</span><span--%>
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

                    </div>
                        </c:forEach>
                </div>
            </div>
        </div>
    </div><!-- Featured Products End --><!-- Best Values Offers Start -->
    <%--    <div class="section145">--%>
    <%--        <div class="container">--%>
    <%--            <div class="row">--%>
    <%--                <div class="col-md-12">--%>
    <%--                    <div class="main-title-tt">--%>
    <%--                        <div class="main-title-left"><span>Offers</span>--%>
    <%--                            <h2>Best Values</h2></div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--                <div class="col-lg-4 col-md-6"><a href="#" class="best-offer-item"><img--%>
    <%--                        src="images/best-offers/offer-1.jpg" alt=""></a></div>--%>
    <%--                <div class="col-lg-4 col-md-6"><a href="#" class="best-offer-item"><img--%>
    <%--                        src="images/best-offers/offer-2.jpg" alt=""></a></div>--%>
    <%--                <div class="col-lg-4 col-md-6"><a href="#" class="best-offer-item offr-none"><img--%>
    <%--                        src="images/best-offers/offer-3.jpg" alt="">--%>
    <%--                    <div class="cmtk_dt">--%>
    <%--                        <div class="product_countdown-timer offer-counter-text" data-countdown="2021/01/06"></div>--%>
    <%--                    </div>--%>
    <%--                </a></div>--%>
    <%--                <div class="col-md-12"><a href="#" class="code-offer-item"><img src="images/best-offers/offer-4.jpg"--%>
    <%--                                                                                alt=""></a></div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div><!-- Best Values Offers End --><!-- Vegetables and Fruits Start -->--%>
    <%--    <div class="section145">--%>
    <%--        <div class="container">--%>
    <%--            <div class="row">--%>
    <%--                <div class="col-md-12">--%>
    <%--                    <div class="main-title-tt">--%>
    <%--                        <div class="main-title-left"><span>For You</span>--%>
    <%--                            <h2>Fresh Vegetables & Fruits</h2></div>--%>
    <%--                        <a href="#" class="see-more-btn">See All</a></div>--%>
    <%--                </div>--%>
    <%--                <div class="col-md-12">--%>
    <%--                    <div class="owl-carousel featured-slider owl-theme">--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-11.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">6% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$12 <span>$15</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-12.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">2% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$10 <span>$13</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-13.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">5% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$5 <span>$8</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-1.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">3% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$15 <span>$20</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-5.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">2% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$9 <span>$10</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-6.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">2% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$7 <span>$8</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-14.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">1% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$6.95 <span>$7</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-3.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">3% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$8 <span>$10</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div><!-- Vegetables and Fruits Products End --><!-- New Products Start -->--%>
    <%--    <div class="section145">--%>
    <%--        <div class="container">--%>
    <%--            <div class="row">--%>
    <%--                <div class="col-md-12">--%>
    <%--                    <div class="main-title-tt">--%>
    <%--                        <div class="main-title-left"><span>For You</span>--%>
    <%--                            <h2>Added New Products</h2></div>--%>
    <%--                        <a href="#" class="see-more-btn">See All</a></div>--%>
    <%--                </div>--%>
    <%--                <div class="col-md-12">--%>
    <%--                    <div class="owl-carousel featured-slider owl-theme">--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-10.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$12 <span>$15</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-9.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$10</div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-15.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">5% off</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$5</div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-11.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$15 <span>$16</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-14.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$9</div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-2.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$7</div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-5.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$6.95</div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="item">--%>
    <%--                            <div class="product-item"><a href="single_product_view.html" class="product-img"><img--%>
    <%--                                    src="images/product/img-6.jpg" alt="">--%>
    <%--                                <div class="product-absolute-options"><span class="offer-badge-1">New</span><span--%>
    <%--                                        class="like-icon" title="wishlist"></span></div>--%>
    <%--                            </a>--%>
    <%--                                <div class="product-text-dt"><p>Available<span>(In Stock)</span></p><h4>Product Title--%>
    <%--                                    Here</h4>--%>
    <%--                                    <div class="product-price">$8 <span>8.75</span></div>--%>
    <%--                                    <div class="qty-cart">--%>
    <%--                                        <div class="quantity buttons_added"><input type="button" value="-"--%>
    <%--                                                                                   class="minus minus-btn"><input--%>
    <%--                                                type="number" step="1" name="quantity" value="1"--%>
    <%--                                                class="input-text qty text"><input type="button" value="+"--%>
    <%--                                                                                   class="plus plus-btn"></div>--%>
    <%--                                        <span class="cart-icon"><i class="uil uil-shopping-cart-alt"></i></span></div>--%>
    <%--                                </div>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div><!-- New Products End -->--%>
</div>
<!-- Body End --><!-- Footer Start -->

<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>
