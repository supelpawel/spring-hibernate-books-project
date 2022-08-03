<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>The book List</title>
</head>
<body>
<h1>The book list</h1>
<table border="1">
    <thead>
    <th>isbn</th>
    <th>title</th>
    <th>author</th>
    <th>publisher</th>
    <th>type</th>
    <th>actions</th>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="book">
        <tr>
            <td><c:out value="${book.isbn}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.publisher}"/></td>
            <td><c:out value="${book.type}"/></td>
            <td>
                <a href="<c:out value="/books/edit/${book.id}"/>">Edit</a>
                <a href="<c:out value="/books/delete/${book.id}"/>">Delete</a>
                <a href="<c:out value="/books/show/${book.id}"/>">Show details</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<a href="/books/add">Add a new book</a>
</body>
</html>

