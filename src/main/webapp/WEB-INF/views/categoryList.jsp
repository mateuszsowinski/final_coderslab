<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 22/05/2021
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
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
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Request Product</li>
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
                    <div class="default-title"><h2>Dodawanie kategorii</h2><img src="images/line.svg" alt=""></div>
                </div>
                <div class="col-lg-6">
                    <div class="request-products">
                        <table
                                class="table table-striped table-hover table-condensed table-bordered">
                            <tr>
                                <th>Id</th>
                                <th>Nazwa</th>

                            </tr>
                            <c:forEach var="categories" items="${categories}">
                                <tr>
                                    <td>${categories.id}</td>
                                    <td>${categories.name}</td>
                                </tr>
                            </c:forEach>
                        </table>
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
                        <p></p><img src="images/line.svg" alt=""></div>
                </div>

            </div>
        </div>
    </div>
</div>
</div><!-- Body End --><!-- Footer Start -->

<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>

