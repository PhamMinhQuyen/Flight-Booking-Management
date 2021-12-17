<%-- 
    Document   : home_manager
    Created on : Oct 28, 2021, 10:50:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <jsp:include page="../include/management/header.jsp"/>
        </div>
        <div class="page-container">
            <jsp:include page="../include/management/menu.jsp"/>
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="page-bar">
                        <div class="page-title-breadcrumb">
                            <div class=" pull-left">
                                <div class="page-title">Dashboard</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/manager/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li class="active">Dashboard</li>
                            </ol>
                        </div>
                    </div>
                    <div class="state-overview">
                        <div class="row">
                            <div class="col-xl-3 col-md-6 col-12">
                                <div class="info-box bg-blue">
                                    <span class="info-box-icon push-bottom"><i class="material-icons">style</i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Orders</span>
                                        <span class="info-box-number">450</span>
                                        <div class="progress">
                                            <div class="progress-bar width-60"></div>
                                        </div>
                                        <span class="progress-description">
                                            60% Increase in 28 Days
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-12">
                                <div class="info-box bg-orange">
                                    <span class="info-box-icon push-bottom"><i class="material-icons">card_travel</i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">New Booking</span>
                                        <span class="info-box-number">155</span>
                                        <div class="progress">
                                            <div class="progress-bar width-40"></div>
                                        </div>
                                        <span class="progress-description">
                                            40% Increase in 28 Days
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-12">
                                <div class="info-box bg-purple">
                                    <span class="info-box-icon push-bottom"><i class="material-icons">phone_in_talk</i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Inquiry</span>
                                        <span class="info-box-number">52</span>
                                        <div class="progress">
                                            <div class="progress-bar width-80"></div>
                                        </div>
                                        <span class="progress-description">
                                            80% Increase in 28 Days
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-12">
                                <div class="info-box bg-success">
                                    <span class="info-box-icon push-bottom"><i class="material-icons">monetization_on</i></span>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Total Earning</span>
                                        <span class="info-box-number">13,921</span><span>$</span>
                                        <div class="progress">
                                            <div class="progress-bar width-60"></div>
                                        </div>
                                        <span class="progress-description">
                                            60% Increase in 28 Days
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>Chart Survey</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body no-padding height-9">
                                    <div class="row text-center">
                                        <div class="col-sm-3 col-6">
                                            <h4 class="margin-0">$ 209 </h4>
                                            <p class="text-muted"> Today's Income</p>
                                        </div>
                                        <div class="col-sm-3 col-6">
                                            <h4 class="margin-0">$ 837 </h4>
                                            <p class="text-muted">This Week's Income</p>
                                        </div>
                                        <div class="col-sm-3 col-6">
                                            <h4 class="margin-0">$ 3410 </h4>
                                            <p class="text-muted">This Month's Income</p>
                                        </div>
                                        <div class="col-sm-3 col-6">
                                            <h4 class="margin-0">$ 78,000 </h4>
                                            <p class="text-muted">This Year's Income</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                       	<div id="area_line_chart" class="width-100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                                                         
            </div>
            <jsp:include page="../include/management/footer.jsp"/>
        </div>
        <jsp:include page="../include/management/js-page.jsp"/>
    </body>
</html>
