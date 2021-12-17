
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Aircrafts Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>
        <link href="<c:url value="/resources-management/assets/css/pages/bootstrap.min.css" />"  rel="stylesheet"/>




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
                                <li><a class="parent-item" href="">Aircrafts</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li class="active">List Aircrafts</li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>List Aircrafts</header>
                                    <div class="tools">
                                        <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                        <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                    </div>
                                </div>
                                <div class="card-body ">
                                    <div class="row p-b-20">
                                        <div class="col-md-6 col-sm-6 col-6">
                                            <div class="btn-group">
                                                <a href="<c:url value="/manager/add-aircrafts"/>" id="addRow" class="btn btn-info">
                                                    Add <i class="fa fa-plus"></i>
                                                </a>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="table-bordered">
                                        <table class="table table-hover table-checkable order-column full-width">
                                            <thead>
                                                <tr>
                                                    <th class="center"> Number </th>
                                                    <th class="center"> Name </th>
                                                    <th class="center"> Image </th>
                                                    <th class="center"> Status </th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead> 
                                            <tbody>
                                                <c:forEach items="${aircraftses.content}" var="a" varStatus="loop">
                                                    <tr class="odd gradeX">
                                                        <td class="center">${a.number}</td>
                                                        <td class="center">${a.name}</td>

                                                        <td style="width: 150px" class="text-center">
                                                            <div class="span7">
                                                                <div class="thumbnail" style="width: 130px;margin-right: -50px;margin-bottom: -3px;">
                                                                    <div id="myCarousel${loop.index}" class="carousel slide cntr">
                                                                        <div class="carousel-inner">
                                                                            <c:forEach var="image" items="${a.images}" varStatus="index">
                                                                                <c:if test="${index.first}">
                                                                                    <div class="item active">
                                                                                        <a href="#"> <img src="<c:url value="/resources-management/assets/img/aircrafts/"/>${image.name}" alt="" style="width:100%"></a>
                                                                                    </div>
                                                                                </c:if>
                                                                                <c:if test="${not index.first}">
                                                                                    <div class="item">
                                                                                        <a href="#"> <img src="<c:url value="/resources-management/assets/img/aircrafts/"/>${image.name}" alt="" style="width:100%"></a>
                                                                                    </div>
                                                                                </c:if>
                                                                            </c:forEach>

                                                                        </div>
                                                                        <a style="background: white" class="left " href="#myCarousel${loop.index}" data-slide="prev">‹</a>
                                                                        <a style="background: white" class="right" href="#myCarousel${loop.index}" data-slide="next">›</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <button class="btn btn-info" onclick="location.href = '<c:url value="/manager/list-images-aircrafrs/${a.id}"/>'" style="height: 30px;">Edit</button>
                                                        </td>


                                                        <td class="center">${a.status}</td>
                                                        <td class="center">
                                                            <a href="<c:url value="/manager/update-aircrafts/${a.id}"/>" class="btn btn-tbl-edit btn-xs" title="Edit">
                                                                <i class="fa fa-pencil"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>                                               
                                            </tbody>
                                        </table>
                                        <nav aria-label="Page navigation example" style="text-align: center">
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/aircrafts?page=0">First</a></li>
                                                <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/aircrafts?page=${aircraftses.number - 1}">Previous</a></li>
                                                <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/aircrafts?page=${aircraftses.number + 1}">Next</a></li>
                                                <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/aircrafts?page=${aircraftses.totalPages - 1}">Last</a></li>
                                            </ul>
                                        </nav>
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
        <script src="<c:url value="/resources-management/assets/js/jquery.min.js/" />"></script>
        <script src="<c:url value="/resources-management/assets/js/bootstrap.min.js/" />"></script>
    </body>

</html>
