<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Table of all users</title>
</head>
<body style="background-color: darkseagreen">
<h3 align="center">All Users:</h3>
<hr color="blue"/>
<br>
<br>
<div align="center">
    <c:url value="/findUsers" var="find"/>
    <a href="<c:out value="${find}"/> ">FIND USER</a>
</div>
<br>
<br>
<table border="1" align="center">
    <tr>
        <th width="50">ID</th>
        <th width="250">NAME</th>
        <th width="50">AGE</th>
        <th width="50">ADMIN</th>
        <th width="150">CREATE DATE</th>
        <th width="100">ACTION</th>
    </tr>
    <c:forEach items="${users}" var="user" varStatus="status">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.age}</td>
            <td>
                <c:if test="${user.getIsAdmin()}">yes</c:if>
                <c:if test="${!user.getIsAdmin()}">no</c:if>
            </td>
            <td>${user.getCreateDateString()}</td>
            <td>
                <c:url value="/EditUser" var="edit">
                    <c:param name="id" value="${user.id}"/>
                    <c:param name="page" value="${page}"/>
                </c:url>
                <a href="<c:out value="${edit}"/>">Edit</a>
                <c:url value="/DeleteUser" var="delete">
                    <c:param name="id" value="${user.id}"/>
                    <c:param name="page" value="${page}"/>
                </c:url>
                <a href="<c:out value="${delete}"/>">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>

<div align="center">
    <c:url value="/" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}"/>">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index} </span>
            </c:when>
            <c:otherwise>
                <c:url value="/" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href="<c:out value="${url}" />">${i.index} </a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href="<c:out value="${next}"/>">Next</a>
    </c:if>
</div>
</div>
<br>
<div align="center">
    <a href="${pageContext.servletContext.contextPath}/CreateUser">ADD USER</a>
</div>
</body>
</html>
