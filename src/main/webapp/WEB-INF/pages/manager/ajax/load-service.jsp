<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

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

                             
                                    <a href="#" data-toggle="modal" data-target="#myModal${bookingDetail.id}" >Add Servie</a>
                                

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--modal-->
        <div class="modal fade" id="myModal${bookingDetail.id}" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="margin-top: 200px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Modal Header</h4>
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
                                    <input onchange="test(${service.id}, this.value)" type="number" class="form-control" id="inline-form-website" min="0" value="0"
                                           >
                                </div>
                            </form>
                        </c:forEach>
                        <label >Tổng tiền: </label>
                        <label id="amount_price" style="margin-left: 100px">
                        </label>
                        <div class="col">
                            <button  class="btn btn-primary" id="click-service">Submit</button>
                        </div>
                    </div>  

                </div>

            </div>
        </div>

    </c:forEach>