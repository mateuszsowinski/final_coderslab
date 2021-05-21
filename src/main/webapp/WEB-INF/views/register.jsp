<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 16/05/2021
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<div class="sign-inup">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5">
                <div class="sign-form">
                    <div class="sign-inner">
                        <div class="sign-logo" id="logo"><a href="index.html"><img src="images/logo.svg" alt=""></a><a
                                href="index.html"><img class="logo-inverse" src="images/dark-logo.svg" alt=""></a></div>
                        <div class="form-dt">
                            <div class="form-inpts checout-address-step">
                                <form:form method="post" modelAttribute="user">
                                    <div class="form-title"><h6>Zarejestruj</h6></div>
                                    <div class="form-group pos_rel"><form:input path="userName" id="userName"
                                                                                name="userName" type="text"
                                                                                placeholder="Nazwa użytkownika"
                                                                                class="form-control lgn_input"
                                                                                required=""/>
                                        <form:errors path="userName"/>
                                        <i class="uil uil-user-circle lgn_icon"></i></div>
                                    <div class="form-group pos_rel"><form:input path="email" id="email" name="email"
                                                                                type="email" placeholder="Adres Email"
                                                                                class="form-control lgn_input"
                                                                                required=""/><i
                                            class="uil uil-envelope lgn_icon"></i></div>
                                    <form:errors path="email"/>

                                    <div class="form-group pos_rel"><form:input path="phoneNumber" id="phone"
                                                                                name="phone" type="text"
                                                                                placeholder="Phone Number"
                                                                                class="form-control lgn_input"
                                                                                required=""/><i
                                            class="uil uil-mobile-android-alt lgn_icon"></i></div>
                                    <form:errors path="phoneNumber"/>

                                    </ul>

                                    <div class="form-group pos_rel"><form:input path="password" id="password"
                                                                                name="password"
                                                                                type="password" placeholder="Hasło"
                                                                                class="form-control lgn_input"
                                                                                required=""/><i
                                            class="uil uil-padlock lgn_icon"></i></div>
                                    <form:errors path="password"/>

                                    <button class="login-btn hover-btn" type="submit">Zarejestruj</button>
                                </form:form>
                            </div>
                            <div class="signup-link"><p>Masz konto? - <a href="/login">Zaloguj</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyright-text text-center mt-3"><i class="uil uil-copyright"></i>Copyright 2021 <b>Mateusz
                    Sowiński</b>.
                    All rights <a href="http://www.bootstrapmb.com" title="">researved</a></div>
            </div>
        </div>
    </div>
</div><!-- Javascripts -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/OwlCarousel/owl.carousel.js"></script>
<script src="vendor/semantic/semantic.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/product.thumbnail.slider.js"></script>
<script src="js/offset_overlay.js"></script>
<script src="js/night-mode.js"></script>
</body>
</html>