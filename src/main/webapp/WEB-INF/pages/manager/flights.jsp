<%-- 
    Document   : add-aircrafts
    Created on : Oct 31, 2021, 8:35:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>
        <!-- Material Design Lite CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css" />">
        <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css" />" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css"  />" />


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
                                <li><a class="parent-item" href="<c:url value="/manager/flightses"/>">Flights</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <c:if test="${action == 'add'}">
                                    <li class="active">Add Flights</li>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                    <li class="active">Edit Flights</li>
                                    </c:if>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <div class="card-head">
                                    <c:if test="${action == 'add'}">
                                        <header>Add Flights</header>
                                        </c:if>
                                        <c:if test="${action == 'update'}">
                                        <header>Edit Flights</header>
                                        </c:if>
                                    <button id = "panel-button" 
                                            class = "mdl-button mdl-js-button mdl-button--icon pull-right" 
                                            data-upgraded = ",MaterialButton">
                                        <i class = "material-icons">more_vert</i>
                                    </button>
                                    <ul class = "mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                        data-mdl-for = "panel-button">
                                        <li class = "mdl-menu__item"><i class="material-icons">assistant_photo</i>Action</li>
                                        <li class = "mdl-menu__item"><i class="material-icons">print</i>Another action</li>
                                        <li class = "mdl-menu__item"><i class="material-icons">favorite</i>Something else here</li>
                                    </ul>
                                </div> 
                                <mvc:form id="flights-form" action="${pageContext.request.contextPath}/manager/resultFlights"  method="POST" modelAttribute="flights">
                                    <c:if test="${action == 'update'}">
                                        <input type="text" class="form-control" name="id"
                                               value="${flights.id}" hidden>
                                    </c:if>
                                    <div class="card-body row">
                                        <div class="col-lg-6 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                <label for="aircraft">Aircrafts:</label>
                                                <select name="aircraft.id" class="form-control" id="aircraft">
                                                    <option></option>
                                                    <c:forEach var="aircrafts" items="${aircraftses}">
                                                        <c:if test="${aircrafts.id==flights.aircraft.id}">
                                                            <option value="${aircrafts.id}" selected>${aircrafts.name}/${aircrafts.number}</option>
                                                        </c:if>
                                                        <c:if test="${aircrafts.id!=flights.aircraft.id}">
                                                            <option value="${aircrafts.id}">${aircrafts.name}/${aircrafts.number}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                 <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                <label for="flightRoute">Flight Routes:</label>
                                                <select name="flightRoute.id" class="form-control" id="flightRoute">
                                                    <option></option>
                                                    <c:forEach var="flightRoutes" items="${flightRouteses}">
                                                        <c:if test="${flightRoutes.id==flights.flightRoute.id}">
                                                            <option value="${flightRoutes.id}" selected>${flightRoutes.departure.city.name} - ${flightRoutes.destination.city.name}</option>
                                                        </c:if>
                                                        <c:if test="${flightRoutes.id!=flights.flightRoute.id}">
                                                            <option value="${flightRoutes.id}">${flightRoutes.departure.city.name} - ${flightRoutes.destination.city.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                    <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>       
                                     
<!--                                        <div class="col-lg-6 p-t-20">
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="depart">Promotion</label><br>
                                                 <mvc:select path="promotionIds" items="${promotions}" multiple="true" itemLabel="name" itemValue="id"/>
                                            </div>
                                        </div>-->
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="depart">Depart:</label>
                                                <fmt:formatDate value="${flights.depart}" type="both" pattern="yyyy-MM-dd'T'HH:mm" var="depart"/>
                                                <input class = "form-control" type = "datetime-local" id = "depart" name="departStr" value="${depart}" >
                                                 <span class="form-message" style="color: red"></span> 

                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="arrival">Arrival:</label>
                                                <fmt:formatDate value="${flights.arrival}" type="both" pattern="yyyy-MM-dd'T'HH:mm" var="arrival"/>
                                                <input class = "form-control" type = "datetime-local" id = "arrival" name="arrivalStr" value="${arrival}">
                                                 <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                                    <div class="col-lg-6 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                <label for="operation">Operation:</label>
                                                <select name="operation.id" class="form-control" id="operation">
                                                    <option></option>
                                                    <c:forEach var="operations" items="${operationses}">
                                                        <c:if test="${operations.id==flights.operation.id}">
                                                            <option  value="${operations.id}" selected>${operations.name}</option>
                                                        </c:if>
                                                        <c:if test="${operations.id!=flights.operation.id}">
                                                            <option  value="${operations.id}" >${operations.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                  <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        <div class="col-lg-6 p-t-20">
                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                <label for="status">Status</label>
                                                <select name="status" class="form-control" id="status">
                                                    <option></option>
                                                    <c:forEach var="status" items="${statusFlights}">
                                                        <c:if test="${status==flights.status}">
                                                            <option value="${status}" selected>${status}</option>
                                                        </c:if>
                                                        <c:if test="${status!=flights.status}">
                                                            <option value="${status}">${status}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                  <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        <div class="col-lg-12 p-t-20 text-center"> 
                                            <button type="submit"  class="btn btn-danger" >Submit</button>                                              
                                        </div>                                                                   
                                    </div>  
                                </mvc:form>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
            <jsp:include page="../include/management/footer.jsp"/>
        </div>
        <script src="${pageContext.request.contextPath}/resources-management/assets/js/validation.js"></script>

        <script>
            Validator({
                form: '#flights-form',
                rules: [
                    Validator.isAircrafts('#aircraft'), 
                    Validator.isFlightRoutes('#flightRoute'),
                    Validator.isOperation('#operation'),
                    Validator.isDepart('#depart'),
                    Validator.isArrival('#arrival'),
                    Validator.isStatus('#status'),
                ]
            });
        </script>





        <jsp:include page="../include/management/js-page.jsp"/>
        <script src="<c:url value="/resources-management/assets/js/pages/material_select/getmdl-select.js"/>" ></script>
        <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js" />"></script>
        <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js" />"></script>
        <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js" />"></script>

        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js" />"></script>
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js" />"></script>




    </body>

</html>
