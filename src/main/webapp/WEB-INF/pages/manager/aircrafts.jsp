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
        <title>Aircrafts Page</title>
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



                                <mvc:form id="aircrafts-form"  action="${pageContext.request.contextPath}/manager/result"  method="post" modelAttribute="aircrafts"
                                          enctype="multipart/form-data" >
                                    <c:if test="${action == 'add'}">
                                        <div class="card-body row">
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "name" name="name">
                                                    <label class = "mdl-textfield__label">Aircrafts Name</label>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" id = "number" name="number">
                                                    <label class = "mdl-textfield__label">Aircrafts Number</label>
                                                     <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>


                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "number" id = "roww" name="roww">
                                                    <label class = "mdl-textfield__label">Number of rows</label>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "number" id = "colum" name="colum">
                                                    <label class = "mdl-textfield__label">Number of Columns</label>
                                                     <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <input class="mdl-textfield__input" type="text" id="status" value="" readonly tabIndex="-1" name="status">
                                                    <label for="status" class="pull-right margin-0">
                                                        <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
                                                    </label>
                                                    <label for="status" class="mdl-textfield__label">Status</label>
                                                    <ul data-mdl-for="status" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                                        <c:forEach var="status" items="${statusAircrafts}">
                                                            <li class="mdl-menu__item" data-val="1">${status}</li>
                                                            </c:forEach>
                                                    </ul>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label class = "mdl-textfield__label">Upload Aircrafts Photos</label><br>
                                                    <input class="form-control form-upload" type = "file"  name="files" multiple id="image">
                                                </div>
                                            </div>
 
                                        </c:if>
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${aircrafts.id}" hidden>
                                            <div class="card-body row">

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" id = "name" name="name" value="${aircrafts.name}">
                                                        <label class = "mdl-textfield__label">Aircrafts Name</label>
                                                        <span class="form-message" style="color: red"></span>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "text" id = "number" name="number" value="${aircrafts.number}">
                                                        <label class = "mdl-textfield__label">Aircrafts Number</label>
                                                        <span class="form-message" style="color: red"></span>
                                                    </div>
                                                </div>


                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "number" id = "roww" name="roww"  value="${aircrafts.roww}">
                                                        <label class = "mdl-textfield__label">Number of rows</label>
                                                         <span class="form-message" style="color: red"></span>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <input class = "mdl-textfield__input" type = "number" id = "colum" name="colum" value="${aircrafts.colum}">
                                                        <label class = "mdl-textfield__label">Number of Columns</label>
                                                         <span class="form-message" style="color: red"></span>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">

                                                        <input class="mdl-textfield__input" type="text" id="status" value="${aircrafts.status}" readonly tabIndex="-1" name="status">
                                                        <label for="status" class="pull-right margin-0">
                                                            <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
                                                        </label>
                                                        <label for="status" class="mdl-textfield__label">Status</label>
                                                        <ul data-mdl-for="status" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                                            <c:forEach var="status" items="${statusAircrafts}">
                                                                <li class="mdl-menu__item" data-val="1" >${status}</li>
                                                                </c:forEach>
                                                        </ul>
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
                    form: '#aircrafts-form',
                    rules: [
                        Validator.isName('#name'), 
                        Validator.isNumber('#number'),
                        Validator.isRoww('#roww'),
                        Validator.isColumn('#colum'), 
                        Validator.isStatus('#status'), 
                    ]
                })


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
