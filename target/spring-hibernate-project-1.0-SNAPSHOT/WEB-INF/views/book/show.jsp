<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>The book details</title>
</head>
<body>
<h1>The book details</h1>
<table border="1">
    <thead>
    <th>isbn</th>
    <th>title</th>
    <th>author</th>
    <th>publisher</th>
    <th>type</th>
    </thead>
    <tbody>
    <tr>
        <td><c:out value="${book.isbn}"/></td>
        <td><c:out value="${book.title}"/></td>
        <td><c:out value="${book.author}"/></td>
        <td><c:out value="${book.publisher}"/></td>
        <td><c:out value="${book.type}"/></td>
    </tr>
    </tbody>
</table>
<p>
    <a href="/books/all">The book list</a>
</p>
</body>
</html>

