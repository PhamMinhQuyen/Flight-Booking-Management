<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Page</title>
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
                                <li><a class="parent-item" href="<c:url value="/manager/services"/>">Service</a>&nbsp;<i class="fa fa-angle-right"></i>
                                </li>
                                <c:if test="${action=='add'}">
                                    <li class="active">Add Service </li>
                                    </c:if>
                                    <c:if test="${action=='update'}">
                                    <li class="active">Edit Service </li>
                                    </c:if>
                            </ol>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <div class="card-head">
                                    <c:if test="${action=='add'}">
                                        <header>Add Service</header>
                                        </c:if>
                                        <c:if test="${action=='update'}">
                                        <header>Edit Service</header>
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
                                <mvc:form id="service-form" action="${pageContext.request.contextPath}/manager/service/result"  method="post" modelAttribute="service"
                                          enctype="multipart/form-data">
                                    <c:if test="${action == 'add'}">
                                        <div class="card-body row">
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <label for="name">Service Name:</label>
                                                    <input class = "form-control" type = "text" id = "name" name="name">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <label for="price">Price:</label>
                                                    <input class = "form-control" type = "number" id = "price" name="price" min="0">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <label for="description:">Description:</label>
                                                    <input class = "form-control" type = "text" id = "description" name="description:">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label for="statusStr">Status:</label>
                                                    <select name="status" class="form-control" id="statusStr">
                                                        <option></option>
                                                        <c:forEach var="status" items="${statusService}"> 
                                                            <option value="${status}">${status}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20"> 
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <label for="name">Upload Service Photos:</label>
                                                    <input class="form-control form-upload" type = "file"  name="files" multiple id="image">
                                                    <span class="form-message" style="color: red"></span> 
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${action == 'update'}">
                                            <input type="text" class="form-control" name="id"
                                                   value="${service.id}" hidden>
                                            <div class="card-body row">
                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <label for="name">Service Name:</label>
                                                        <input class = "form-control" type = "text" id = "name" name="name" value="${service.name}">
                                                        <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <label for="price">Price:</label>
                                                        <input class = "form-control" type = "number" id = "price" name="price" value="${service.price}">
                                                        <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                        <label for="description:">Description:</label>
                                                        <input class = "form-control" type = "text" id = "description" name="description" value="${service.description}">
                                                        <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 p-t-20"> 
                                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                        <label for="statusStr">Status:</label>
                                                        <select name="status" class="form-control" id="statusStr">
                                                            <option></option>
                                                            <c:forEach var="status" items="${statusService}"> 
                                                                <c:if test="${status==service.status}">
                                                                    <option value="${status}" selected>${status}</option>
                                                                </c:if>
                                                                <c:if test="${status!=service.status}">
                                                                    <option value="${status}">${status}</option>
                                                                </c:if>

                                                            </c:forEach>
                                                        </select>
                                                        <span class="form-message" style="color: red"></span> 
                                                    </div>
                                                </div>
                                            </c:if>
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
                // gọi hàm
                Validator({
                    form: '#service-form',
                    rules: [
                        Validator.isName('#name'),
                        Validator.isName('#price'),
                        Validator.isName('#description'),
                        Validator.isImage('#image'),
                        Validator.isStatus('#statusStr'),
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
