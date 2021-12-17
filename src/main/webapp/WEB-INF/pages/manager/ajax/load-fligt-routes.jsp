<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>



<c:forEach var="destination" items="${getAirpotrts}">
    <option value="${destination.key}" >${destination.value}</option> 
</c:forEach>
    