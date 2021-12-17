
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion Page</title>
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
                                <li><a class="parent-item" href="<c:url value="/manager/flightses"/>">Promotion</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <c:if test="${action == 'add'}">
                                    <li class="active">Add Promotion</li>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                    <li class="active">Edit Promotion</li>
                                    </c:if>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <div class="card-head">
                                    <c:if test="${action == 'add'}">
                                        <header>Add Promotion</header>
                                        </c:if>
                                        <c:if test="${action == 'update'}">
                                        <header>Edit Promotion</header>
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
                                <mvc:form id="promotion-form" action="${pageContext.request.contextPath}/manager/resultPromotion"  method="POST" modelAttribute="promotion">
                                     <c:if test="${action == 'update'}">
                                        <input type="text" class="form-control" name="id"
                                               value="${promotion.id}" hidden>
                                    </c:if>
                                    <div class="card-body row">
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="name">Name:</label>
                                                <input class = "form-control" type = "text" id = "name" name="name" value="${promotion.name}">
                                                <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        
                                         <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="createDate">Create Date:</label>
                                                <input class = "form-control" type = "date" name="createDateStr" id="createDate" value="${promotion.createDate}">
                                                <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        
                                          <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="startDate">Start Date:</label>
                                                <input class = "form-control" type = "date" name="startDateStr" id="startDate" value="${promotion.startDate}">
                                                <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        
                                          <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="endDate">End Date:</label>
                                                <input class = "form-control" type = "date" name="endDateStr" id="endDate" value="${promotion.endDate}">
                                                <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        
                                           <div class="col-lg-6 p-t-20"> 
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label for="statusStr">Status:</label>
                                                    <select name="status" class="form-control" id="statusStr">
                                                        <option></option>
                                                        <c:forEach var="status" items="${statusPromotion}"> 
                                                            <c:if test="${status==promotion.status}">
                                                                <option value="${status}" selected>${status}</option>
                                                            </c:if>
                                                            <c:if test="${status!=promotion.status}">
                                                                 <option value="${status}">${status}</option>
                                                            </c:if>
                                                           
                                                        </c:forEach>
                                                    </select>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                        
                                        <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="discount">Discount</label>
                                                <input class = "form-control" type = "number" name="discount" value="${promotion.discount}" min="0" id="discount">
                                                <span class="form-message" style="color: red"></span> 
                                            </div>
                                        </div>
                                        
                                          <div class="col-lg-6 p-t-20"> 
                                            <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <label for="description">Description:</label>
                                                <input class = "form-control" type = "text" name="description" value="${promotion.description}" id="description">
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
                        form: '#promotion-form',
                        rules: [
                            Validator.isName('#name'), 
                            Validator.isName('#createDate'),
                            Validator.isName('#startDate'),
                            Validator.isName('#endDate'),
                            Validator.isStatus('#statusStr'),
                            Validator.isNumber('#discount'),
                            Validator.isDestination('#description'),
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
