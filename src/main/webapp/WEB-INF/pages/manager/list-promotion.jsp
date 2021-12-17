
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion Page</title>
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
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/manager/home"/>">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li><a class="parent-item" href="">Promotion</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <li class="active">List Promotion</li>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-box">
                                <div class="card-head">
                                    <header>List Promotion</header>
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
                                                <a href="<c:url value="/manager/add-promotion"/>" id="addRow" class="btn btn-info">
                                                    Add <i class="fa fa-plus"></i>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="table-scrollable">
                                        <table class="table table-hover table-checkable order-column full-width">
                                            <thead>
                                                <tr>                                                 
                                                    <th class="center">Name</th>
                                                    <th class="center">Discount </th>
                                                    <th class="center">Start Date</th>
                                                    <th class="center">End Date</th>
                                                    <th class="center">Status</th>
                                                    <th class="center"> Action </th>
                                                </tr>
                                            </thead> 
                                            <tbody>
                                                <c:forEach items="${promotions.content}" var="promotion">
                                                    <tr class="odd gradeX">
                                                        <td class="center">${promotion.name}</td>
                                                        <td class="center" > 
                                                            <fmt:formatNumber type="number" pattern="" value="${promotion.discount}"  />
                                                        </td>
                                                        <td class="center">
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${promotion.startDate}" />
                                                        </td>
                                                        <td class="center">
                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${promotion.endDate}" />
                                                        </td>  
                                                        <td class="center">${promotion.status}</td>
                                                        <td class="center">
                                                            <a href="<c:url value="/manager/update-promotion/${promotion.id}"/>" class="btn btn-tbl-edit btn-xs" title="Edit">
                                                                <i class="fa fa-pencil"></i>
                                                            </a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <nav aria-label="Page navigation example" style="margin-left: 500px;">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/promotions?page=0">First</a></li>
                                        <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/promotions?page=${promotions.number - 1}">Previous</a></li>
                                        <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/promotions?page=${promotions.number + 1}">Next</a></li>
                                        <li class="page-item"><a class="page-link" href="/PR38_JV44_Flight_Booking/manager/promotions?page=${promotions.totalPages - 1}">Last</a></li>
                                    </ul>
                                </nav>
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

