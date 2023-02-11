<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>House Hunter Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="container" style="width: 700px; font-weight: 600; color: black">
<div class="d-flex align-content-center">
    <h1 style="margin-right: 20px; margin-top: 10px">Welcome, ${user.userName}</h1>
    <div style="margin-top: 20px"><a href="/logout">log out</a></div>
</div>
<div>
    <table class="table table-striped" style="border: 2px solid black">
        <thead style="background: #cccccc;  border-bottom: 2px solid black;">
        <tr>
            <th>Address</th>
            <th>Listed on</th>
            <th>Added by</th>
            <th>Price</th>
        </tr>
        </thead>
        <c:forEach var="listing" items="${listings}">
            <tr>
                <td><a href="/listing/${listing.id}"><c:out value="${listing.address}"/></a></td>
                <td><c:out value="${listing.createdAt}"/></td>
                <td><c:out value="${listing.creator.userName}"/></td>
                <td><c:out value="${listing.price}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div style="margin-top: 30px">
    <form action="/listing/new">
        <button style="box-shadow: 3px 3px black; border: 2px solid black; font-weight: 600; color: black; padding: 0px 5px" class="btn">Add Listing</button>
    </form>

</div>

</body>
</html>