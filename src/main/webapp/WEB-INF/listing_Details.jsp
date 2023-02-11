<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="width: 600px; padding: 10px; margin-left: 30px; color: black; font-weight: 600; font-size: 20px">
<div class="d-flex align-content-center justify-content-between" style="margin-top: 20px">
    <div><h1><c:out value="${listing.address}"/></h1></div>
    <div style="margin-top: 15px; font-size: 18px"><a href="/home">Back to Dashboard</a></div>
</div>
<div class="d-flex" style="font-weight: bold; margin-top: 20px">Address: <span style="margin-left: 30px"><c:out value="${listing.address}"/></span></div>
<div style="margin-top: 20px">Date: <span style="margin-left: 20px"><c:out value="${listing.createdAt}"/></span></div>
<div style="margin-top: 20px">Price: <span style="margin-left: 20px"><c:out value="${listing.price}"/></span></div>

<div style="border-top: 2px solid black; margin-top: 20px">
    <table class="table table-striped" style="margin-top: 10px; width: 600px; border: 2px solid black">
        <thead style="background: #cccccc">
        <tr>
            <th>Name</th>
            <th>Note</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="note" items="${notes}">
            <tr>
                <td><c:out value="${note.user.userName}"/></td>
                <td><c:out value="${note.notes}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-flex">
        Leave a Note:
        <%--@elvariable id="note" type="javax"--%>
        <form:form action="/listing/${listing.id}" method="post" modelAttribute="note" cssStyle="margin-left: 20px">
            <div><form:errors path="notes" class="text-danger"/></div>
            <form:input path="notes" cssStyle="width: 100px"/>
            <button style="box-shadow: 3px 3px black; border: 2px solid black; font-weight: 600; color: black; padding: 0px 5px; margin-left: 10px" class="btn">Note!</button>
        </form:form>
    </div>
</div>
<div>
    <c:if test="${listing.creator.id==loggedInUserId}">
        <div style="margin-top: 20px">
            <form action="/listing/${listing.id}/edit">
                <button style="box-shadow: 3px 3px black; border: 2px solid black; padding: 0px 10px;font-size: 18px; font-weight: 600; color: black">edit</button>
            </form>
        </div>
    </c:if>
    <c:if test="${listing.creator.id==loggedInUserId}">
        <div style="margin-top: 20px">
            <form action="/listing/${listing.id}/delete" style="margin-top: 10px">
                <button class="btn btn-danger" style="box-shadow: 3px 3px black; border: 2px solid black; color: white; padding: 0px 8px; margin-left: 10px">Delete Listing</button>
            </form>
        </div>
    </c:if>
</div>

</body>
</html>