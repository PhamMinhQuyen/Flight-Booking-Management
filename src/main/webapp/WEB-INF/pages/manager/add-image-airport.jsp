<%-- 
    Document   : add-aircrafts
    Created on : Oct 31, 2021, 8:35:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Aircrafts Page</title>
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
                                <li><a class="parent-item" href="<c:url value="/manager/aircrafts"/>">Aircrafts</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <c:if test="${action == 'add'}">
                                    <li class="active">Add Aircrafts</li>
                                    </c:if>
                                    <c:if test="${action == 'update'}">
                                    <li class="active">Edit Aircrafts</li>
                                    </c:if>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <div class="card-head">
                                    <c:if test="${action == 'add'}">
                                        <header>Add Aircrafts</header>
                                        </c:if>
                                        <c:if test="${action == 'update'}">
                                        <header>Edit Aircrafts</header>
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



                                <mvc:form id="aircrafts-form"  action="${pageContext.request.contextPath}/manager/load-imgage-airport/${imageEntity.airport.id}"  method="post" modelAttribute="imageEntity"
                                          enctype="multipart/form-data" >
                                 
                                        <div class="card-body row">
                                        
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label for="name">Upload Airport Photos:</label>
                                                    <input class="form-control form-upload" type = "file"  name="files" multiple ">
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
                <jsp:include page="../include/management/footer.jsp"/>
            </div>
           
           
            <jsp:include page="../include/management/js-page.jsp"/>
            <script src="<c:url value="/resources-management/assets/js/pages/material_select/getmdl-select.js"/>" ></script>
            <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/moment-with-locales.min.js" />"></script>
            <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js" />"></script>
            <script  src="<c:url value="/resources-management/assets/plugins/material-datetimepicker/datetimepicker.js" />"></script>

            <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js" />"></script>
            <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js" />"></script>




    </body>

</html>
