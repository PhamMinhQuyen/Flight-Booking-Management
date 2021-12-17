<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar-container">
    <div class="sidemenu-container navbar-collapse collapse fixed-menu">
        <div id="remove-scroll">
            <ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                <li class="sidebar-toggler-wrapper hide">
                    <div class="sidebar-toggler">
                        <span></span>
                    </div>
                </li>
                <li class="sidebar-user-panel">
                    <div class="user-panel">
                        <div class="row">
                            <div class="sidebar-userpic">
                                <img src="<c:url value="/resources-management/assets/img/dp.jpg" />" class="img-responsive" alt=""> </div>
                        </div>
                        <div class="profile-usertitle">
                            <div class="sidebar-userpic-name">Pham Minh Quyen</div>
                            <div class="profile-usertitle-job"> Manager </div>
                        </div>
                        <div class="sidebar-userpic-btn">
                            <a class="tooltips" href="user_profile.html" data-placement="top" data-original-title="Profile">
                                <i class="material-icons">person_outline</i>
                            </a>
                            <a class="tooltips" href="email_inbox.html" data-placement="top" data-original-title="Mail">
                                <i class="material-icons">mail_outline</i>
                            </a>
                            <a class="tooltips" href="chat.html" data-placement="top" data-original-title="Chat">
                                <i class="material-icons">chat</i>
                            </a>
                            <a class="tooltips" href="login.html" data-placement="top" data-original-title="Logout">
                                <i class="material-icons">input</i>
                            </a>
                        </div>
                    </div>
                </li>
                <li class="menu-heading">
                    <span>----------------------</span>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/manager/home" />" class="nav-link nav-toggle">
                       <i class="material-icons">home</i>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">flight_land</i>
                        <span class="title">Aircrafts</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/manager/add-aircrafts" />"  class="nav-link ">
                                <span class="title">Add Aircrafts</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/manager/aircrafts" />"  class="nav-link ">
                                <span class="title">List Aircrafts</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">account_balance</i>
                        <span class="title">Airport</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/manager/add-airports" />"  class="nav-link ">
                                <span class="title">Add Airport</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/manager/airportses" />" class="nav-link ">
                                <span class="title">List Airports</span>
                            </a>
                        </li>                     
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">flight_takeoff</i>
                        <span class="title">Flight</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/manager/add-flights" />"class="nav-link ">
                                <span class="title">Add Flight</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/manager/flightses" />" class="nav-link ">
                                <span class="title">List Flights</span>
                            </a>
                        </li>                  
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">flight</i>
                        <span class="title">Flight Routes</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item"> 
                            <a href="<c:url value="/manager/add-flight-routes" />"class="nav-link ">
                                <span class="title">Add Flight Routes</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/manager/flight-routes" />" class="nav-link ">
                                <span class="title">List Flight Routes</span>
                            </a>
                        </li>                  
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">event</i>
                        <span class="title">Promotion</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/manager/add-promotion" />" class="nav-link ">
                                <span class="title">Add Promotion</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/manager/promotions" />" class="nav-link ">
                                <span class="title">List Promotions</span>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">local_taxi</i>
                        <span class="title">Service</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/manager/add-service" />" class="nav-link ">
                                <span class="title">Add Service</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/manager/services" />" class="nav-link ">
                                <span class="title">List Service</span>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">group</i>
                        <span class="title">Booking</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/manager/bookings" />"class="nav-link ">
                                <span class="title">List Booking</span> 
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">email</i>
                        <span class="title">Email</span>
                        <span class="arrow"></span>
                        <span class="label label-rouded label-menu label-danger">new</span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="email_inbox.html" class="nav-link ">
                                <span class="title">Inbox</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="email_view.html" class="nav-link ">
                                <span class="title">View Mail</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="email_compose.html" class="nav-link ">
                                <span class="title">Compose Mail</span>
                            </a>
                        </li>
                    </ul>
                </li>
                
                
        </div>              
    </div>
</div>