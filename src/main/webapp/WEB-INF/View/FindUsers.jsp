<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Find User</title>
</head>
<body style="background-color: darkseagreen">
<h3 align="center">Find User :</h3>
<hr color="blue"/>
<br>
<br>

<div align="center">
    <a href="${pageContext.servletContext.contextPath}/">ALL USERS</a>
</div>
<br>
<div align="center">
    <form action="${pageContext.servletContext.contextPath}/findUsers" method="post">
        <table>
            <tr>
                <td align="right">USER NAME</td>
                <td>
                    <input type="text" name="name">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" align="center" value="Submit">
                </td>
                <td>
                    <i style="font-size: 12px;">Enter name of user fo search</i>
                    <%--<scan style ="font-size: 12px;">Enter name of user fo search</scan>--%>
                </td>
            </tr>
        </table>
    </form>
</div>
<br>
<h4 align="center">Finded Users</h4>
<table border="1" align="center">
    <tr>
        <th width="50">ID</th>
        <th width="250">NAME</th>
        <th width="50">AGE</th>
        <th width="50">ADMIN</th>
        <th width="150">CREATE DATE</th>
        <th width="100">ACTION</th>
    </tr>
    <c:forEach items="${findUsers}" var="user" varStatus="status">
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
                    <c:param name="page" value="1"/>
                </c:url>
                <a href="<c:out value="${delete}"/>">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>


</body>
</html>