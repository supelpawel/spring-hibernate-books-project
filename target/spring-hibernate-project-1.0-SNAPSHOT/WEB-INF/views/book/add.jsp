<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add a new book</title>
</head>
<body>
<h1>Add a new book</h1>
<form:form method="post"
           modelAttribute="book">

    <span>Isbn: <form:input path="isbn"/></span>
    <form:errors path="isbn"/><br/>
    <span>Title: <form:input path="title"/></span>
    <form:errors path="title"/><br/>
    <span>Author: <form:input path="author"/></span>
    <form:errors path="author"/><br/>
    <span>Publisher: <form:input path="publisher"/></span>
    <form:errors path="publisher"/><br/>
    <span>Type: <form:input path="type"/></span>
    <form:errors path="type"/><br/>
    <input type="submit" value="Send"/>
</form:form>
<p>
    <a href="/books/all">The book list</a>
</p>
</body>
</html>

