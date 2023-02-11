<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="container" style="width: 700px; padding: 10px; margin-left: 30px; margin-top: 20px; color: black; font-size: 18px">
<h1 style="margin-bottom: 50px">edit Listing</h1>

<form:form action="/listing/${listing.id}/edit" method="post" modelAttribute="listing">
    <input type="hidden" name="_method" value="put">
    <div><form:errors path="address" class="text-danger"/></div>
    <div><form:errors path="price" class="text-danger"/></div>
    <div><form:errors path="createdAt" class="text-danger"/></div>
    <div style="margin-top: 10px">
        <form:label path="address">address: </form:label>
        <form:input path="address" cssStyle="margin-left: 85px"/>
    </div>

    <div style="margin-top: 10px">
        <form:label path="price">Price: </form:label>
        <form:input path="price" cssStyle="margin-left: 65px"/>
    </div>

    <div style="margin-top: 10px">
        <form:label path="createdAt">Date: </form:label>
        <form:textarea cols="22" rows="2" path="createdAt" cssStyle="border: 2px solid black; margin-left: 20px; margin-top: 5px"/>
    </div>

    <div style="margin-top: 20px; margin-left: 200px">

        <a href="/home" style="box-shadow: 3px 3px black; border: 2px solid black; font-weight: 600; color: black; padding: 0px 5px" class="btn">Cancel</a>
        <button style="box-shadow: 3px 3px black; border: 2px solid black; font-weight: 600; color: black; padding: 0px 5px; margin-left: 10px" class="btn">Submit</button>
    </div>
</form:form>
</body>
</html>