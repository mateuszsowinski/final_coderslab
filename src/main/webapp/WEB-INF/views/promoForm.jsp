<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/headerLoginUser.jsp" %>

<!-- Header End --><!-- Body Start -->
<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="">Strona główna</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Dodaj produkt do promocji</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="request-grid">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="default-title"><h2>Dodaj produkt do promocji</h2><img src="/images/line.svg" alt=""></div>
                </div>
                <div class="col-lg-6">
                    <div class="request-products">

                        <form:form method="post" modelAttribute="promo">
                            <div class="form-group">
                              <p hidden>  <form:input path="id" type="text" value="" /></div></p>
                            <form:input path="name" type="text" value="" placeholder="Nazwa promocji"/>
                            <form:errors path="name"/><p>
                                <form:input path="shortDescription" type="text" value="" placeholder="Krótki opis produktu"/>
                            <form:errors path="shortDescription"/><p>
                                <form:input path="description" type="text" value="" placeholder="Opis Produktu"/>
                            <form:errors path="description"/><p>

                            <c:forEach begin="1" end="5">

                            <form:select  itemValue="id" itemLabel="name" path="product_item">
                                <form:option value="" label="Wybierz"/>
                                <form:options items="${productList}" itemValue="id" itemLabel="name"/>
                                <form:errors path="product_item"/>
                            </form:select>
                            <form:input path="quantity" type="number" value="" min="0" placeholder="Ilość" />
                            <form:errors path="quantity"/><p>
                            </c:forEach>

                            <form:input path="price" type="number" min="0" placeholder="Cena"/><p>
                            <form:input path="points" type="number" min="0" placeholder="Punkty"/><p>
                            <button class="next-btn16 hover-btn mt-3 rqst-btn" type="submit">Dodaj promocje</button>

                        </form:form>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div class="life-gambo pb-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="default-title"><h2></h2>
                        <p></p><img src="/images/line.svg" alt=""></div>
                </div>

                </div>
            </div>
        </div>
    </div>
</div><!-- Body End --><!-- Footer Start -->
<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>

