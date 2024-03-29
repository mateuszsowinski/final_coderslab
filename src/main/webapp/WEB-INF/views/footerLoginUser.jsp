<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 20/05/2021
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<footer class="footer">
    <div class="footer-first-row">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <ul class="call-email-alt">
                        <li><a href="#" class="callemail"><i class="uil uil-dialpad-alt"></i>1800-000-000</a></li>
                        <li><a href="#" class="callemail"><i class="uil uil-envelope-alt"></i>info@gambosupermarket.com</a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="social-links-footer">
                        <ul>
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-second-row">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="second-row-item"><h4>Categories</h4>
                        <ul>
                            <li><a href="#">Fruits and Vegetables</a></li>
                            <li><a href="#">Grocery & Staples</a></li>
                            <li><a href="#">Dairy & Eggs</a></li>
                            <li><a href="#">Beverages</a></li>
                            <li><a href="#">Snacks</a></li>
                            <li><a href="#">Home Care</a></li>
                            <li><a href="#">Noodles & Sauces</a></li>
                            <li><a href="#">Personal Care</a></li>
                            <li><a href="#">Pet Care</a></li>
                            <li><a href="#">Meat & Seafood</a></li>
                            <li><a href="#">Electronics</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="second-row-item"><h4>Useful Links</h4>
                        <ul>
                            <li><a href="about_us.html">About US</a></li>
                            <li><a href="shop_grid.html">Featured Products</a></li>
                            <li><a href="offers.html">Offers</a></li>
                            <li><a href="our_blog.html">Blog</a></li>
                            <li><a href="faq.html">Faq</a></li>
                            <li><a href="career.html">Careers</a></li>
                            <li><a href="contact_us.html">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">

                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="second-row-item-app"><h4>Download App</h4>
                        <ul>
                            <li><a href="#"><img class="download-btn" src="/images/download-1.svg" alt=""></a></li>
                            <li><a href="#"><img class="download-btn" src="/images/download-2.svg" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="second-row-item-payment"><h4>Payment Method</h4>
                        <div class="footer-payments">
                            <ul id="paypal-gateway" class="financial-institutes">
                                <li class="financial-institutes__logo"><img alt="Visa" title="Visa"
                                                                            src="/images/footer-icons/pyicon-6.svg"></li>
                                <li class="financial-institutes__logo"><img alt="Visa" title="Visa"
                                                                            src="/images/footer-icons/pyicon-1.svg"></li>
                                <li class="financial-institutes__logo"><img alt="MasterCard" title="MasterCard"
                                                                            src="/images/footer-icons/pyicon-2.svg"></li>
                                <li class="financial-institutes__logo"><img alt="American Express"
                                                                            title="American Express"
                                                                            src="/images/footer-icons/pyicon-3.svg"></li>
                                <li class="financial-institutes__logo"><img alt="Discover" title="Discover"
                                                                            src="/images/footer-icons/pyicon-4.svg"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="second-row-item-payment"><h4>Newsletter</h4>
                        <div class="newsletter-input"><input id="email" name="email" type="text"
                                                             placeholder="Email Address" class="form-control input-md"
                                                             required="">
                            <button class="newsletter-btn hover-btn" type="submit"><i class="uil uil-telegram-alt"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-last-row">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer-bottom-links">
                        <ul>
                            <li><a href="about_us.html">About</a></li>
                            <li><a href="contact_us.html">Contact</a></li>
                            <li><a href="privacy_policy.html">Privacy Policy</a></li>
                            <li><a href="term_and_conditions.html">Term & Conditions</a></li>
                            <li><a href="refund_and_return_policy.html">Refund & Return Policy</a></li>
                        </ul>
                    </div>
                    <div class="copyright-text"><i class="uil uil-copyright"></i>Copyright 2020 <b>Gambolthemes</b>. All
                        rights <a href="http://www.bootstrapmb.com" title="">researved</a></div>
                </div>
            </div>
        </div>
    </div>

</footer><!-- Footer End --><!-- Javascripts -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/OwlCarousel/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/vendor/semantic/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/offset_overlay.js"></script>
<script src="${pageContext.request.contextPath}/js/night-mode.js"></script>
</body>
</html>
