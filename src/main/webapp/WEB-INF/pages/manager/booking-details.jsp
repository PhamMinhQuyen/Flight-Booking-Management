
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/manager/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li><a class="parent-item" href="<c:url value="/manager/bookings"/>">Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li class="active">Booking Detail</li>
                            </ol>
                        </div>
                    </div>

                    <div class="row" style="margin-left: 200px">
                        <div class="col-sm-10">
                            <div class="card card-box">
                                <div class="card-head" style="text-align: center">
                                    <header>Ticket Booking Information</header>
                                    <button id = "panel-button6" 
                                            class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                            data-upgraded = ",MaterialButton">
                                        <i class = "material-icons">more_vert</i>
                                    </button>
                                    <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                        data-mdl-for = "panel-button6">
                                        <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                        <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                        <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                    </ul>
                                </div>
                                <div class="card-body " id="bar-parent6">
                                    <form action="${pageContext.request.contextPath}/manager/booking/result/${booking.id}" method="post">
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Name:</label>
                                            <div class="col-4">
                                                <span class="help-block">${booking.fullName}</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Address:</label>
                                            <div class="col-4">
                                                <span class="help-block">${booking.address}</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Phone Number:</label>
                                            <div class="col-4">
                                                <span class="help-block">${booking.phoneNumber}</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Birth Date:</label>
                                            <div class="col-4">
                                                <span class="help-block">
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${booking.birthDate}" />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Gender:</label>
                                            <div class="col-4">
                                                <span class="help-block">${booking.gender}</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Email:</label>
                                            <div class="col-4">
                                                <span class="help-block">${booking.email}</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Booking Date:</label>
                                            <div class="col-4">
                                                <span class="help-block">
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${booking.bookingDate}" />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Booking Number:</label>
                                            <div class="col-4">
                                                <span class="help-block">${booking.bookingNumber}</span>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 control-label" style="margin-left: 150px">Status:</label>

                                            <div>
                                                <c:if test="${enums!=null}">
                                                    <select name="status" class="form-control" style="height: 30px">
                                                        <c:forEach var="statusBooking" items="${enums}">
                                                            <c:if test="${statusBooking.value=='CHECK_IN'}">
                                                                <option value="${statusBooking.key}" selected>${statusBooking.value}</option>
                                                            </c:if>
                                                            <c:if test="${statusBooking.value!='CHECK_IN'}">
                                                                <option value="${statusBooking.key}">${statusBooking.value}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </c:if>
                                                <c:if test="${enums==null}">
                                                    <c:if test="${booking.bookingStatus=='CANCEL'|| booking.bookingStatus=='COMPLETED'}">
                                                        <input disabled class="form-control" value="${booking.bookingStatus}" style="width: 150px;"/>
                                                    </c:if>

                                                    <c:if test="${booking.bookingStatus!='CANCEL' && booking.bookingStatus!='COMPLETED'}">
                                                        <select name="status" class="form-control" style="height: 30px"> 
                                                            <option></option>
                                                            <c:forEach var="status" items="${status}">
                                                                <c:if test="${status==booking.bookingStatus}">
                                                                    <option ${status} selected>${status}</option>
                                                                </c:if>
                                                                <c:if test="${status!=booking.bookingStatus}">
                                                                    <option ${status}>${status}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                </c:if>

                                            </div>
                                            <c:if test="${booking.bookingStatus!='CANCEL' && booking.bookingStatus!='COMPLETED'}">
                                                <button type="submit" style="margin-left: 120px" >Update</button>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <c:if test="${direction=='OneTrip'}">        
                        <div id="loadService" class="row">
                            <c:forEach var="bookingDetail" items="${bookingDetails}" varStatus="loop">
                                <div class="col-md-6 col-sm-6">
                                    <div class="card card-box">
                                        <div class="card-head">
                                            <header>Ticket information</header> <br>
                                            <header>Passenger Information: ${loop.count}</header>
                                            <button id = "panel-button6" 
                                                    class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                                    data-upgraded = ",MaterialButton">
                                                <i class = "material-icons">more_vert</i>
                                            </button>
                                            <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                                data-mdl-for = "panel-button6">
                                                <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                            </ul>
                                        </div>
                                        <div class="card-body " id="bar-parent6"> 
                                            <form>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Name:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.fullName}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Flight Routes:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">From ${bookingDetail.flight.flightRoute.departure.city.name} To ${bookingDetail.flight.flightRoute.destination.city.name}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Depart Date:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">
                                                            <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bookingDetail.flight.depart}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Arrival Date:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">
                                                            <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bookingDetail.flight.arrival}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Address:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.address}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Phone Number:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.phoneNumber}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Email:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.email}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Birth Date:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${bookingDetail.passenger.birthDate}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Gender:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.gender}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">CMND:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.idenCode}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Operations:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.flight.operation.name}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Aircraft Number:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.flight.aircraft.number}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Seats:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.seat.number}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Sercice:</label>
                                                    <div class="col-sm-8">
                                                        <c:forEach var="service" items="${bookingDetail.serviceBookings}">
                                                            <span class="help-block">${service.service.name} (${service.quantity})</span>
                                                        </c:forEach>
                                                        <c:if test="${booking.bookingStatus=='BOOKED'}">
                                                            <a href="#" data-toggle="modal" data-target="#myModal${bookingDetail.id}" >Add Servie</a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- bengin modal-->
                                <div class="modal fade" id="myModal${bookingDetail.id}" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content" style="margin-top: 200px">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Add Service</h4>
                                            </div>
                                            <div class="modal-body">
                                                <label class="visually-hidden" for="inline-form-name">Name</label>
                                                <label class="visually-hidden" for="inline-form-name" style="margin-left: 130px">Price</label>
                                                <label class="visually-hidden" for="inline-form-name" style="margin-left: 130px">Quantity</label>
                                                <c:forEach var="service" items="${services}">
                                                    <form class="row row-cols-lg-auto g-3">
                                                        <div class="col">
                                                            <label>${service.name}</label>
                                                        </div>
                                                        <div class="col">
                                                            <fmt:formatNumber type="number" pattern="###,###,### VND" value="${service.price}"/>
                                                        </div>
                                                        <div class="col">
                                                            <input onchange="test(${service.id}, this.value)" type="number" class="form-control" id="inline-form-website" min="0" value="0"
                                                                   >
                                                        </div>
                                                    </form>
                                                </c:forEach>
                                                <label >Tổng tiền: </label>
                                                <label id="amount-price" style="margin-left: 100px">
                                                </label>
                                                <div class="col">
                                                    <button onclick="addService(${bookingDetail.id},${bookingDetail.booking.id})"  class="btn btn-primary" id="click-service" data-dismiss="modal">Submit</button>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                                <!-- end modal-->
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${direction=='TwoTrip'}">
                        <div id="loadService" class="row">
                            <c:forEach var="bookingDetail" items="${bookingDetails}" varStatus="loop">
                                <div class="col-md-6 col-sm-6">
                                    <div class="card card-box">
                                        <div class="card-head">
                                            <!--                                            count:1-->
                                            <c:if test="${loop.count <= bookingDetails.size()/2}"> 
                                                <header>One-way Ticket Information</header><br>
                                                <header>Passenger Information: ${loop.count}</header>
                                                </c:if>
                                                <c:if test="${loop.count>bookingDetails.size()/2}">
                                                <header>Return Ticket Information</header><br>
                                                <header>Passenger Information: <fmt:formatNumber value="${loop.count-bookingDetails.size()/2}"></fmt:formatNumber></header>
                                                </c:if>
                                            <button id = "panel-button6" 
                                                    class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                                    data-upgraded = ",MaterialButton">
                                                <i class = "material-icons">more_vert</i>
                                            </button>
                                            <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                                data-mdl-for = "panel-button6">
                                                <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                                <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                            </ul>
                                        </div>
                                        <div class="card-body " id="bar-parent6">
                                            <form>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Name:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.fullName}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Flight Routes:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">From ${bookingDetail.flight.flightRoute.departure.city.name} To ${bookingDetail.flight.flightRoute.destination.city.name}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Depart Date:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">
                                                            <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bookingDetail.flight.depart}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Arrival Date:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">
                                                            <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bookingDetail.flight.arrival}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Address:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.address}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Phone Number:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.phoneNumber}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Email:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.email}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Birth Date:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${bookingDetail.passenger.birthDate}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Gender:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.gender}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">CMND:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.passenger.idenCode}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Operations:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.flight.operation.name}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Aircraft Number:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.flight.aircraft.number}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Seats:</label>
                                                    <div class="col-sm-8">
                                                        <span class="help-block">${bookingDetail.seat.number}</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 control-label">Sercice:</label>
                                                    <div class="col-sm-8">
                                                        <c:forEach var="service" items="${bookingDetail.serviceBookings}">
                                                            <span class="help-block">${service.service.name}    (${service.quantity})</span>
                                                        </c:forEach>
                                                        <c:if test="${booking.bookingStatus=='BOOKED'}">
                                                            <a href="#" data-toggle="modal" data-target="#myModal${bookingDetail.id}" >Add Servie</a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- bengin modal-->
                                <div class="modal fade" id="myModal${bookingDetail.id}" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content" style="margin-top: 200px">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Add Service</h4>
                                            </div>
                                            <div class="modal-body">
                                                <label class="visually-hidden" for="inline-form-name">Name</label>
                                                <label class="visually-hidden" for="inline-form-name" style="margin-left: 130px">Price</label>
                                                <label class="visually-hidden" for="inline-form-name" style="margin-left: 130px">Quantity</label>
                                                <c:forEach var="service" items="${services}">
                                                    <form class="row row-cols-lg-auto g-3">
                                                        <div class="col">
                                                            <label>${service.name}</label>
                                                        </div>
                                                        <div class="col">
                                                            <fmt:formatNumber type="number" pattern="###,### VND" value="${service.price}"/>
                                                        </div>
                                                        <div class="col">
                                                            <input onchange="test1(${service.id}, this.value,${loop.index})" type="number" class="form-control" id="inline-form-website" min="0" value="0"
                                                                   >
                                                        </div>
                                                    </form>
                                                </c:forEach>
                                                <label >Tổng tiền: </label>
                                                <label class="amount-price-two" style="margin-left: 100px">
                                                </label>
                                                <div class="col">
                                                    <button onclick="addService(${bookingDetail.id},${bookingDetail.booking.id})"  class="btn btn-primary" id="click-service" data-dismiss="modal">Submit</button>
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                </div>
                                <!-- end modal-->
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>
            <jsp:include page="../include/management/footer.jsp"/>
        </div>
        <jsp:include page="../include/management/js-page.jsp"/>
        <script>
            function test(serviceId, quantity) {
                $.ajax({
                    url: '/PR38_JV44_Flight_Booking/api-change-price',
                    type: 'get',
                    data: {
                        serviceId: serviceId,
                        quantity: quantity
                    },
                    success: function (value) { // nhận đc dữ liệu của trang load-flight-routes.jsp
                        console.log(value)
                        if(${direction=='TwoTrip'}) {
                            $('#amount-price-two').text(value);
                             console.log('-----------------------------------------------------')
                        } else {
                             $('#amount-price').text(value);
                        }
                       


                    }
                });
            }
            
            
             function test1(serviceId, quantity,index) {
                $.ajax({
                    url: '/PR38_JV44_Flight_Booking/api-change-price',
                    type: 'get',
                    data: {
                        serviceId: serviceId,
                        quantity: quantity
                    },
                    success: function (value) { // nhận đc dữ liệu của trang load-flight-routes.jsp
                        console.log(value)
                     
                           var testContent = document.querySelectorAll('.amount-price-two');
//                            $('.amount-price-two')[index].text(value);
                            testContent[index].innerText=value;
                             console.log('-----------------------------------------------------')
                       
                       


                    }
                });
            }


            function addService(bookingDetailId, bookingId) {
                $.ajax({
                    url: '/PR38_JV44_Flight_Booking/api-load-service',
                    type: 'get',
                    data: {
                        bookingDetailId: bookingDetailId,
                        bookingId: bookingId

                    },
                    success: function (value) { // nhận đc dữ liệu của trang load-flight-routes.jsp
                        console.log('------------------------------------------')
                        console.log(value)
                        $('#loadService').html(value);
                    }
                });
            }
        </script>

    </body>

</html>

