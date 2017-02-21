<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit User:</title>
</head>
<body style="background-color: darkseagreen">
<h3 align="center">Edit User :</h3>
<hr color="blue">
<br>
<br>

<div align="center">
    <a href="${pageContext.servletContext.contextPath}/">ALL USERS</a>
</div>
<br>
<br>

<div align="center">
    <form name="myForm" action="${pageContext.servletContext.contextPath}/SaveUser" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <input type="hidden" name="page" value="${page}">
        <table>
            <tr>
                <td align="right">NAME USER</td>
                <td><input type="text" name="name" value="${user.name}"></td>
            </tr>
            <tr>
                <td align="right">USER AGE</td>
                <td><input type="text" name="age" value="${user.age}"></td>
            </tr>
            <tr>
                <td align="right">USER IS ADMIN</td>
                <td>
                    <select required size="1" name="isAdmin">
                        <option value="${true}">Yes</option>
                        <option value="${false}">No</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" align="center" value="Submit" onclick="return checkUserForm()"></td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    function checkUserForm() {

        var name = document.forms["myForm"].name.value;
        var age = document.forms["myForm"].age.value;

        if (name.length == 0) {
            alert('Пожалуйста укажите имя пользователя');
            return false;
        }

        if (age <= 0 || age > 110 || /[^[0-9]/.test(age)) {
            alert('Неверное возраст пользователя');
            return false;
        }
        return true;

    }
    ;
</script>

</body>
</html>