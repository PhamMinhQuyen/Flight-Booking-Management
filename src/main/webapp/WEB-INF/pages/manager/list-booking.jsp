    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <div class="page-header navbar navbar-fixed-top">
                <div class="page-header-inner ">
                    <!-- logo start -->
                    <div class="page-logo">
                        <a href="<c:url value="/manager/home" />">
                            <img alt="" src="<c:url value="/resources-management/assets/img/logo.jpg" />" style="height: 30px">
                            <span class="logo-default" style="font-size: 20px">Flight Booking</span> </a>
                    </div>
                    <!-- logo end -->
                    <ul class="nav navbar-nav navbar-left in">
                        <li><a href="#" class="menu-toggler sidebar-toggler"><i class="icon-menu"></i></a></li>
                    </ul>
                    <form class="search-form-opened" action="${pageContext.request.contextPath}/manager/search" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Name..."  name="strSearch">
                            <input type="submit"  class="search-form-opened" value="Search" >
                        </div>

                    </form>
                    <!-- start mobile menu -->
                    <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                        <span></span>
                    </a>
                    <!-- end mobile menu -->
                    <!-- start header menu -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <!-- start notification dropdown -->
                            <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="badge headerBadgeColor1"> 6 </span>
                                </a>
                                <ul class="dropdown-menu animated swing">
                                    <li class="external">
                                        <h3><span class="bold">Notifications</span></h3>
                                        <span class="notification-label purple-bgcolor">New 6</span>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list small-slimscroll-style" data-handle-color="#637283">
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">just now</span>
                                                    <span class="details">
                                                        <span class="notification-icon circle deepPink-bgcolor"><i class="fa fa-check"></i></span> Congratulations!. </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">3 mins</span>
                                                    <span class="details">
                                                        <span class="notification-icon circle purple-bgcolor"><i class="fa fa-user o"></i></span>
                                                        <b>John Micle </b>is now following you. </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">7 mins</span>
                                                    <span class="details">
                                                        <span class="notification-icon circle blue-bgcolor"><i class="fa fa-comments-o"></i></span>
                                                        <b>Sneha Jogi </b>sent you a message. </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">12 mins</span>
                                                    <span class="details">
                                                        <span class="notification-icon circle pink"><i class="fa fa-heart"></i></span>
                                                        <b>Ravi Patel </b>like your photo. </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">15 mins</span>
                                                    <span class="details">
                                                        <span class="notification-icon circle yellow"><i class="fa fa-warning"></i></span> Warning! </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">10 hrs</span>
                                                    <span class="details">
                                                        <span class="notification-icon circle red"><i class="fa fa-times"></i></span> Application error. </span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="dropdown-menu-footer">
                                            <a href="javascript:void(0)"> All notifications </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- end notification dropdown -->
                            <!-- start message dropdown -->
                            <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="badge headerBadgeColor2"> 2 </span>
                                </a>
                                <ul class="dropdown-menu animated slideInDown">
                                    <li class="external">
                                        <h3><span class="bold">Messages</span></h3>
                                        <span class="notification-label cyan-bgcolor">New 2</span>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list small-slimscroll-style" data-handle-color="#637283">
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="<c:url value="/resources-management/assets/img/user/user2.jpg" />" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Sarah Smith </span>
                                                        <span class="time">Just Now </span>
                                                    </span>
                                                    <span class="message"> Jatin I found you on LinkedIn... </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="<c:url value="/resources-management/assets/img/user/user3.jpg" />" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> John Deo </span>
                                                        <span class="time">16 mins </span>
                                                    </span>
                                                    <span class="message"> Fwd: Important Notice Regarding Your Domain Name... </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="<c:url value="/resources-management/assets/img/user/user1.jpg" />" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Rajesh </span>
                                                        <span class="time">2 hrs </span>
                                                    </span>
                                                    <span class="message"> pls take a print of attachments. </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="<c:url value="/resources-management/assets/img/user/user8.jpg"/>" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Lina Smith </span>
                                                        <span class="time">40 mins </span>
                                                    </span>
                                                    <span class="message"> Apply for Ortho Surgeon </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <span class="photo">
                                                        <img src="<c:url value="/resources-management/assets/img/user/user5.jpg"/>" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Jacob Ryan </span>
                                                        <span class="time">46 mins </span>
                                                    </span>
                                                    <span class="message"> Request for leave application. </span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="dropdown-menu-footer">
                                            <a href="#"> All Messages </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- end message dropdown -->
                            <!-- start manage user dropdown -->
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <img alt="" class="img-circle " src="<c:url value="/resources-management/assets/img/dp.jpg" />" />
                                    <span class="username username-hide-on-mobile">  Quyen </span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default animated jello">
                                    <li>
                                        <a href="user_profile.html">
                                            <i class="icon-user"></i> Profile </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-settings"></i> Settings
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-directions"></i> Help
                                        </a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="lock_screen.html">
                                            <i class="icon-lock"></i> Lock
                                        </a>
                                    </li>
                                    <li>
                                        <a href="login.html">
                                            <i class="icon-logout"></i> Log Out </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- end manage user dropdown -->
                            <li class="dropdown dropdown-quick-sidebar-toggler">
                                <a id="headerSettingButton" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
                                    <i class="material-icons">settings</i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-container">
            <jsp:include page="../include/management/menu.jsp"/>
            <div class="page-content-wrapper">
                <div class="page-content">
                    <div class="page-bar" >
                        

                        <div class="page-title-breadcrumb" >                        
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/manager/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li><a class="parent-item" href="<c:url value="/manager/bookings"/>">Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li class="active">List Booking</li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>List Booking</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    <div class="row p-b-10">
                                        <div class="col-md-12 col-sm-6 col-6">
                                            <form id="search-date-form" class="form-inline" action="${pageContext.request.contextPath}/manager/searchDate" method="post">
                                                <div class="form-group">
                                                    <label for="startDate">From:</label>
                                                    <input type="date" class="form-control" id="startDate" name="startDate">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                                <div class="form-group">
                                                    <label for="endDate">To:</label>
                                                    <input type="date" class="form-control" id="endDate" name="endDate">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                                <button type="submit" class="btn btn-default">Search</button>
                                            </form>
                                        </div>
                                        <div class="col-md-12 col-sm-6 col-12">
                                            <div class="btn-group pull-right">
                                                <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li>
                                                        <a href="javascript:;">
                                                            <i class="fa fa-print"></i> Print </a>
                                                    </li>
                                                    <li>
                                                        <a href="<c:url value="/manager/export" />">
                                                            <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-scrollable">
                                        <table class="table table-hover table-checkable order-column full-width">
                                            <thead>
                                                <tr>                                                 
                                                    <th class="center">Booking Number</th>
                                                    <th class="center">Name </th>
                                                    <th class="center">Booking Date</th>
                                                    <th class="center">Amount Price</th>
                                                    <th class="center">Status</th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead> 
                                            <tbody>
                                                <c:if test="${bookings != null && fn:length(bookings) > 0}">
                                                    <c:forEach items="${bookings}" var="booking">
                                                        <tr class="odd gradeX">
                                                            <td class="center">${booking.bookingNumber}</td>
                                                            <td class="center">${booking.fullName}</td>
                                                            <td class="center">
                                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${booking.bookingDate}" />
                                                            </td>
                                                            <td class="center">
                                                                <fmt:formatNumber type="number" pattern="###,### VND" value="  ${booking.totalPrice} "/>
                                                            </td>
                                                            <td class="center">${booking.bookingStatus}</td>
                                                            <td class="center">
                                                                <a href="<c:url value="/manager/booking-detail/${booking.id}"/>" class="btn btn-success btn-xs" title="Booking Detail">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>   
                                                </c:if>
                                            </tbody>

                                        </table>
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
        
        <script src="${pageContext.request.contextPath}/resources-management/assets/js/validation.js"></script>
            <script>
                // gọi hàm
                Validator({
                    form: '#search-date-form',
                    rules: [
                        Validator.isName('#startDate'),
                        Validator.isName('#endDate'),
                    ]
                });
            </script>

    </body>

</html>

