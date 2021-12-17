<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Airport Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>
        <!-- Material Design Lite CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css" />">
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css" />">
        <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css" />" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css"  />" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                                <li><a class="parent-item" href="<c:url value="/manager/flight-routes"/>">Flight Routes</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <c:if test="${action=='add'}">
                                    <li class="active">Add Flight Routes </li>
                                    </c:if>
                                    <c:if test="${action=='update'}">
                                    <li class="active">Edit Flight Routes </li>
                                    </c:if>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <div class="card-head">
                                    <c:if test="${action=='add'}">
                                        <header>Add Flight Routes</header>
                                        </c:if>
                                        <c:if test="${action=='update'}">
                                        <header>Edit Flight Routes</header>
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
                                <mvc:form id="flight-routes-form"  action="${pageContext.request.contextPath}/manager/resultFlightRoutes"  method="post" modelAttribute="flightRoutes">
                                    <c:if test="${action == 'add'}">
                                        <div class="card-body row">
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label for="departure">Departure:</label>
                                                    <select  class="form-control" name="departure.id" id="departure" >
                                                        <option></option>
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.id}">${airport.city.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label for="destination">Destination:</label>
                                                    <select name="destination.id" class="form-control" id="destination">
                                                    </select>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <label for="distance">Distance</label>
                                                    <input class = "form-control" type = "number" id = "distance" name="distance">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <label for="duration">Duration:</label>
                                                    <input class = "form-control" type = "time" id = "duration" name="durationStr">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <label for="satandarPrice">Standard Price</label>
                                                    <input class = "form-control" type = "number" id = "satandarPrice" name="satandarPrice">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${flightRoutes.id}" hidden>
                                            <div class="card-body row">
                                                <div class="col-lg-6 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <label for="departure">Departure:</label>
                                                        <select  class="form-control" name="departure.id" id="departure" >
                                                            <option></option>
                                                            <c:forEach var="airport" items="${airports}">
                                                                <c:if test="${airport.id==flightRoutes.departure.id}">
                                                                    <option value="${airport.id}" selected> ${airport.city.name}</option>
                                                                </c:if>
                                                                <c:if test="${airport.id!=flightRoutes.departure.id}">
                                                                    <option value="${airport.id}"> ${airport.city.name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 p-t-20">
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <label for="destination">Destination:</label>
                                                        <select name="destination.id" class="form-control" id="destination">
                                                            <option value="${flightRoutes.destination.id}">${flightRoutes.destination.city.name}</option>
                                                        </select>
                                                        <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <label for="distance">Distance</label>
                                                        <input class = "form-control" type = "number" id = "distance" name="distance" value="${flightRoutes.distance}">
                                                         <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <label for="duration">Duration:</label>
                                                        <input class = "form-control" type = "time" id = "duration" name="durationStr" value="${flightRoutes.duration}">
                                                         <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <label for="satandarPrice">Standard Price</label>
                                                        <input class = "form-control" type = "number" id = "satandarPrice" name="satandarPrice" value="${flightRoutes.satandarPrice}">
                                                         <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>

                                            </c:if>

                                            <div class="col-lg-12 p-t-20 text-center"> 
                                                <button type="submit"  class="btn btn-danger" >Submit</button>                                              
                                            </div>   
                                        </div>
                                    </div>
                                </mvc:form>
                            </div>
                        </div> 
                    </div>
                </div>
                <jsp:include page="../include/management/footer.jsp"/>
            </div>
            <script src="${pageContext.request.contextPath}/resources-management/assets/js/validation.js"></script>
            <script>
                // gọi hàm
                Validator({
                    form: '#flight-routes-form',
                    rules: [
                        Validator.isDeparture('#departure'),
                        Validator.isDestination('#destination'),
                        Validator.isDistance('#distance'),
                        Validator.isDistance('#duration'),
                        Validator.isDistance('#satandarPrice'),
                    ]
                })


            </script>


            <script src="<c:url value="/resources-management/assets/js/validation.js"/>" ></script>
            <!--        js_ajax-->
            <script src="<c:url value="/resources-management/assets/js/ajax.js"/>" ></script>


            <jsp:include page="../include/management/js-page.jsp"/>




            <script src="<c:url value="/resources-management/assets/js/pages/material_select/getmdl-select.js"/>" ></script>
            <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js" />"></script>
            <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js" />"></script>
            <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js" />"></script>

            <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js" />"></script>
            <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js" />"></script>
    </body>
</html>
