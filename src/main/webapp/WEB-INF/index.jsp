<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>House Hunter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="container" style="font-weight: 600; width: 700px" >
<h1 style="color: #9901fe; margin: 20px 0px; font-size: 50px" class="text-center text-primary">Welcome House Hunter</h1>

<div class="d-flex align-content-center justify-content-evenly" style="margin-top: 30px">
    <div style="width: 600px; font-weight: 600">
        <h2>Register</h2>
        <form:form action="/register" method="post" modelAttribute="newUser">
            <div style="margin-top: 10px">
                <form:label path="userName">Name: </form:label>
                <form:input path="userName" style="margin-left: 67px"/>
                <div><form:errors path="userName" class="text-danger"/></div>
            </div>

            <div style="margin-top: 10px">
                <form:label path="email">Email: </form:label>
                <form:input path="email" style="margin-left: 72px"/>
                <div><form:errors path="email" class="text-danger"/></div>
            </div>

            <div style="margin-top: 10px">
                <form:label path="password">Password: </form:label>
                <form:input type="password" path="password" style="margin-left: 45px"/>
                <div><form:errors path="password" class="text-danger"/></div>
            </div>

            <div style="margin-top: 10px">
                <form:label path="confirm">Confirm PW: </form:label>
                <form:input path="confirm" type="password" style="margin-left: 25px"/>
                <div><form:errors path="confirm" class="text-danger"/></div>
            </div>

            <div style="margin-top: 50px; margin-left: 220px"><button style="box-shadow: 3px 3px black; border: 2px solid black; font-size: 18px; font-weight: 600; color: black; padding: 0px 5px" class="btn">Register</button></div>
        </form:form>
    </div>

    <div style="width: 600px; font-weight: 600">
        <form:form action="/login" method="post" modelAttribute="newLogin">
            <div><h2>Log in</h2></div>
            <div style="margin-top: 10px">
                <form:label path="email">Email: </form:label>
                <form:input path="email" style="margin-left: 67px"/>
                <div><form:errors path="email" class="text-danger"/></div>
            </div>

            <div style="margin-top: 10px">
                <form:label path="password">Password: </form:label>
                <form:input type="password" path="password" style="margin-left: 40px"/>
                <div><form:errors path="password" class="text-danger"/></div>
            </div>

            <div style="margin-top: 50px; margin-left: 235px"><button style="box-shadow: 3px 3px black; border: 2px solid black; font-size: 18px; font-weight: 600; color: black; padding: 0px 5px" class="btn">Login</button></div>
        </form:form>
    </div>
</div>
</body>
</html>