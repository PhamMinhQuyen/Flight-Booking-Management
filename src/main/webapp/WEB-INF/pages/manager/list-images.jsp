
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aircrafts Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>


        <style>
            * {
                box-sizing: border-box;
            }
            .zoom {
                padding: 10px;
                transition: transform .2s;
                height: 200px;
                margin: 0 auto;
            }
            .zoom:hover {
                -ms-transform: scale(1.5); /* IE 9 */
                -webkit-transform: scale(1.5); /* Safari 3-8 */
                transform: scale(1.5); 
            }

        </style>

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
                                <c:choose>
                                    <c:when test="${object=='service'}">
                                        <li><a class="parent-item" href="">Service</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </c:when>
                                        <c:when test="${object=='aircrafts'}">
                                        <li><a class="parent-item" href="<c:url value="/manager/aircrafts" />">Aircrafts</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </c:when>
                                        <c:when test="${object=='airport'}">
                                        <li><a class="parent-item" href="<c:url value="/manager/airportses" />">Airport</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </c:when>
                                    </c:choose>
                                </li>
                                <c:if test="${object=='service'}">
                                    <li><a class="parent-item" href="<c:url value="/manager/services" />">List Services</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </c:if> 
                                </li>
                                <li class="active">Image</li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>Image</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
<!--                                    <div class="row p-b-20">
                                        <div class="col-md-6 col-sm-6 col-6">
                                            <div class="btn-group">
                                                <c:choose>
                                                    <c:when test="${object=='service'}">
                                                        <a href="<c:url value="/manager/add-image-service/${image.service.id}"/>" id="addRow" class="btn btn-info">
                                                            Add <i class="fa fa-plus"></i>
                                                        </a>
                                                    </c:when>
                                                </c:choose>

                                            </div>
                                        </div>
                                    </div>-->
                                    <div class="table-bordered">
                                        <table class="table table-hover table-checkable order-column full-width">
                                            <thead>
                                                <tr>
                                                    <th class="center"> Image </th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead> 
                                            <tbody>
                                                <c:if test="${object=='aircrafts'}">
                                                    <c:forEach items="${imagesAircrafrs}" var="image" >
                                                        <tr class="odd gradeX">
                                                            <td class="center">
                                                                <a href="#"> <img src="<c:url value="/resources-management/assets/img/aircrafts/"/>${image.name}"  class="zoom"></a>
                                                            </td>
                                                            <td class="center">
                                                                <a href="<c:url value="/manager/add-image-aircrafts/${image.aircraft.id}"/>" class="btn btn-tbl-edit btn-xs" title="Add">
                                                                    <i class="fa fa-plus"></i>
                                                                </a>

                                                                <a href="<c:url value="/manager/delete-image-aircrafts/${image.id}"/>" class="btn btn-tbl-delete btn-xs" title="Delete">
                                                                    <i class="fa fa-trash-o "></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${object=='airport'}">
                                                    <c:forEach items="${imagesAirport}" var="image" >
                                                        <tr class="odd gradeX">
                                                            <td class="center">
                                                                <a href="#"> <img src="<c:url value="/resources-management/assets/img/airport/"/>${image.name}"  class="zoom"></a>
                                                            </td>
                                                            <td class="center">
                                                                <a href="<c:url value="/manager/add-image-airport/${image.airport.id}"/>" class="btn btn-tbl-edit btn-xs" title="Add">
                                                                    <i class="fa fa-plus"></i>
                                                                </a>
                                                                <a href="<c:url value="/manager/delete-image-airport/${image.id}"/>" class="btn btn-tbl-delete btn-xs" title="Delete">
                                                                    <i class="fa fa-trash-o "></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>      

                                                <c:if test="${object=='service'}">
                                                    <c:forEach items="${imagesService}" var="image" >
                                                        <tr class="odd gradeX">
                                                            <td class="center">
                                                                <a href="#"> <img src="<c:url value="/resources-management/assets/img/service/"/>${image.name}"  class="zoom"></a>
                                                            </td>
                                                            <td class="center">
                                                                <a href="<c:url value="/manager/add-image-service/${image.service.id}"/>" class="btn btn-tbl-edit btn-xs" title="Add">
                                                                    <i class="fa fa-plus"></i>
                                                                </a>
                                                                <a href="<c:url value="/manager/delete-image-service/${image.id}"/>" class="btn btn-tbl-delete btn-xs" title="Delete">
                                                                    <i class="fa fa-trash-o "></i>
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

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </body>

</html>
