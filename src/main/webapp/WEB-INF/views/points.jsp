<%--
  Created by IntelliJ IDEA.
  User: mateuszsowinski
  Date: 03/06/2021
  Time: 15:31
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
                            <li class="breadcrumb-item active" aria-current="page">Panel użytkownika</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard-group">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="user-dt">
                        <div class="user-img"><img src="/images/avatar/img-5.jpg" alt="">
                            <div class="img-add"><input type="file" id="file"><label for="file"><i
                                    class="uil uil-camera-plus"></i></label></div>
                        </div>

                        <h4>${user.userName}</h4>
                        <p>${user.phoneNumber}<a href="#"><i class="uil uil-edit"></i></a></p>
                        <div class="earn-points"><img src="/images/Dollar.svg" alt="">Zebrane punkty: <span>${points}</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="left-side-tabs">
                        <div class="dashboard-left-links">
                            <a href="dashboard_overview.html" class="user-item"><i class="uil uil-apps"></i>Overview</a>
                            <a href="dashboard_my_orders.html" class="user-item"><i class="uil uil-box"></i>My Orders</a>
                            <a href="dashboard_my_rewards.html" class="user-item"><i class="uil uil-gift"></i>My Rewards</a>
                            <a href="dashboard_my_wallet.html" class="user-item active"><i class="uil uil-usd-circle icon__1"></i>Punkty</a>
                            <a href="dashboard_my_wishlist.html" class="user-item"><i class="uil uil-heart"></i>Shopping Wishlist</a>
                            <a href="dashboard_my_addresses.html" class="user-item"><i class="uil uil-location-point"></i>My Address</a>
                            <a href="sign_in.html" class="user-item"><i class="uil uil-exit"></i>Logout</a></div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="dashboard-right">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="main-title-tab"><h4><i class="uil uil-usd-circle icon__1"></i>Punkty</h4></div>
                            </div>
                            <div class="col-lg-6 col-md-12">
                                <div class="pdpt-bg">
                                    <div class="reward-body-dtt">
                                        <div class="reward-img-icon"><img src="/images/money.svg" alt=""></div>
                                        <span class="rewrd-title">Moje punkty</span><h4 class="cashbk-price">${points}</h4>
<%--                                        <span class="date-reward">Added:8 May 2020</span></div>--%>
                                </div>
                            </div>
<%--                            <div class="col-lg-6 col-md-12">--%>
<%--                                <div class="pdpt-bg">--%>
<%--                                    <div class="gambo-body-cash">--%>
<%--                                        <div class="reward-img-icon"><img class="rotate-img" src="/images/business.svg"--%>
<%--                                                                          alt=""></div>--%>
<%--                                        <span class="rewrd-title">Gambo Cashback Blance</span><h4 class="cashbk-price">--%>
<%--                                        $5</h4>--%>
<%--                                        <p>100% of thiscan be used for your next order.</p></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-12 col-md-12">--%>
<%--                                <div class="pdpt-bg">--%>
<%--                                    <div class="pdpt-title"><h4>Active Offers</h4></div>--%>
<%--                                    <div class="active-offers-body">--%>
<%--                                        <div class="table-responsive">--%>
<%--&lt;%&ndash;                                            <table class="table ucp-table earning__table">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <thead class="thead-s">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <th scope="col">Offers</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <th scope="col">Offer Code</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <th scope="col">Expires Date</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <th scope="col">Status</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                <tbody>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>15%</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>GAMBOCOUP15</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>31 May 2020</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td><b class="offer_active">Activated</b></td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>10%</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>GAMBOCOUP10</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>25 May 2020</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td><b class="offer_active">Activated</b></td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>25%</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>GAMBOCOUP25</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>20 May 2020</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td><b class="offer_active">Activated</b></td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>5%</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>GAMBOCOUP05</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td>15 May 2020</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                    <td><b class="offer_active">Activated</b></td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                                </tbody>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </table>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-6 col-md-12">--%>
<%--                                <div class="pdpt-bg">--%>
<%--                                    <div class="pdpt-title"><h4>Add Balance</h4></div>--%>
<%--                                    <div class="add-cash-body">--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-lg-6 col-md-12">--%>
<%--                                                <div class="form-group mt-1"><label class="control-label">Holder--%>
<%--                                                    Name*</label>--%>
<%--                                                    <div class="ui search focus">--%>
<%--                                                        <div class="ui left icon input swdh11 swdh19"><input--%>
<%--                                                                class="prompt srch_explore" type="text"--%>
<%--                                                                name="holdername" value="" id="holder[name]" required=""--%>
<%--                                                                maxlength="64" placeholder="Holder Name"></div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-6 col-md-12">--%>
<%--                                                <div class="form-group mt-1"><label class="control-label">Card--%>
<%--                                                    Number*</label>--%>
<%--                                                    <div class="ui search focus">--%>
<%--                                                        <div class="ui left icon input swdh11 swdh19"><input--%>
<%--                                                                class="prompt srch_explore" type="text"--%>
<%--                                                                name="cardnumber" value="" id="card[number]" required=""--%>
<%--                                                                maxlength="64" placeholder="Card Number"></div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-4 col-md-4">--%>
<%--                                                <div class="form-group mt-1"><label class="control-label">Expiration--%>
<%--                                                    Month*</label><select class="ui fluid search dropdown form-dropdown"--%>
<%--                                                                          name="card[expire-month]">--%>
<%--                                                    <option value="">Month</option>--%>
<%--                                                    <option value="1">January</option>--%>
<%--                                                    <option value="2">February</option>--%>
<%--                                                    <option value="3">March</option>--%>
<%--                                                    <option value="4">April</option>--%>
<%--                                                    <option value="5">May</option>--%>
<%--                                                    <option value="6">June</option>--%>
<%--                                                    <option value="7">July</option>--%>
<%--                                                    <option value="8">August</option>--%>
<%--                                                    <option value="9">September</option>--%>
<%--                                                    <option value="10">October</option>--%>
<%--                                                    <option value="11">November</option>--%>
<%--                                                    <option value="12">December</option>--%>
<%--                                                </select></div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-4 col-md-4">--%>
<%--                                                <div class="form-group mt-1"><label class="control-label">Expiration--%>
<%--                                                    Year*</label>--%>
<%--                                                    <div class="ui search focus">--%>
<%--                                                        <div class="ui left icon input swdh11 swdh19"><input--%>
<%--                                                                class="prompt srch_explore" type="text"--%>
<%--                                                                name="card[expire-year]" maxlength="4"--%>
<%--                                                                placeholder="Year"></div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-4 col-md-4">--%>
<%--                                                <div class="form-group mt-1"><label class="control-label">CVV*</label>--%>
<%--                                                    <div class="ui search focus">--%>
<%--                                                        <div class="ui left icon input swdh11 swdh19"><input--%>
<%--                                                                class="prompt srch_explore" name="card[cvc]"--%>
<%--                                                                maxlength="3" placeholder="CVV"></div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-lg-12 col-md-12">--%>
<%--                                                <div class="form-group mt-1"><label class="control-label">Add--%>
<%--                                                    Balance*</label>--%>
<%--                                                    <div class="ui search focus">--%>
<%--                                                        <div class="ui left icon input swdh11 swdh19"><input--%>
<%--                                                                class="prompt srch_explore" type="text"--%>
<%--                                                                name="addbalance" maxlength="3" placeholder="$0"></div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <a href="#" class="next-btn16 hover-btn mt-3">Add Balance</a></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-6 col-md-12">--%>
<%--                                <div class="pdpt-bg">--%>
<%--                                    <div class="pdpt-title"><h4>History</h4></div>--%>
<%--                                    <div class="history-body scrollstyle_4">--%>
<%--                                        <ul class="history-list">--%>
<%--                                            <li>--%>
<%--                                                <div class="purchase-history">--%>
<%--                                                    <div class="purchase-history-left"><h4>Purchase</h4>--%>
<%--                                                        <p>Transaction ID--%>
<%--                                                            <ins>gambo14255896</ins>--%>
<%--                                                        </p>--%>
<%--                                                        <span>6 May 2018,12.56PM</span></div>--%>
<%--                                                    <div class="purchase-history-right"><span>-$25</span><a href="#">View</a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                            <li>--%>
<%--                                                <div class="purchase-history">--%>
<%--                                                    <div class="purchase-history-left"><h4>Purchase</h4>--%>
<%--                                                        <p>Transaction ID--%>
<%--                                                            <ins>gambo14255895</ins>--%>
<%--                                                        </p>--%>
<%--                                                        <span>5 May 2018,11.16AM</span></div>--%>
<%--                                                    <div class="purchase-history-right"><span>-$21</span><a href="#">View</a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                            <li>--%>
<%--                                                <div class="purchase-history">--%>
<%--                                                    <div class="purchase-history-left"><h4>Purchase</h4>--%>
<%--                                                        <p>Transaction ID--%>
<%--                                                            <ins>gambo14255894</ins>--%>
<%--                                                        </p>--%>
<%--                                                        <span>4 May 2018,02.56PM</span></div>--%>
<%--                                                    <div class="purchase-history-right"><span>-$30</span><a href="#">View</a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                            <li>--%>
<%--                                                <div class="purchase-history">--%>
<%--                                                    <div class="purchase-history-left"><h4>Purchase</h4>--%>
<%--                                                        <p>Transaction ID--%>
<%--                                                            <ins>gambo14255893</ins>--%>
<%--                                                        </p>--%>
<%--                                                        <span>3 May 2018,5.56PM</span></div>--%>
<%--                                                    <div class="purchase-history-right"><span>-$15</span><a href="#">View</a>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/footerLoginUser.jsp" %>
