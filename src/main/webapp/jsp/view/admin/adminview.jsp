<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>
<%@ page import="com.bookdb.bookdb.ejb.user.entity.User" %>
<%@ page import="com.bookdb.bookdb.ejb.user.notes.entity.Note" %>
<%@ page import="com.bookdb.bookdb.ejb.books.author.entity.Author" %>
<%@ page import="com.bookdb.bookdb.ejb.books.genre.entity.Genre" %>
<%@ page import="com.bookdb.bookdb.ejb.books.publisher.entity.Publisher" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>

<%
    Book book = (Book) request.getAttribute("lastbook");
    User user = (User) request.getAttribute("lastuser");
    Author author = (Author) request.getAttribute("lastauthor");
    Genre genre = (Genre) request.getAttribute("lastgenre");
    Publisher publisher = (Publisher) request.getAttribute("lastpublisher");

%>

<div class="row row-cols-1 row-cols-md-3 g-4" style="margin: 10px">
    <div class="col text-center">
        <div class="card h-100">
            <img src="https://i.ibb.co/GMB1Sty/bookk.png" class="card-img-top img-fluid mx-auto d-block" alt="book-img" style="width: 40%; height: 40%; padding-top: ">
            <div class="card-body">
                <h5 class="card-title">Books in database :</h5>
                <p class="card-text"><%=book.getBookId()%></p>
            </div>
        </div>
    </div>
    <div class="col text-center">
        <div class="card h-100">
            <img src="https://i.ibb.co/gDJbX9q/users.png" class="card-img-top img-fluid mx-auto d-block" alt="user-img" style="width: 40%; height: 40%;">
            <div class="card-body">
                <h5 class="card-title">Registered users :</h5>
                <p class="card-text"><%=user.getUserId()%></p>
            </div>
        </div>
    </div>
    <div class="col text-center">
        <div class="card h-100">
            <img src="https://i.ibb.co/61FY0Lg/pero.png" class="card-img-top img-fluid mx-auto d-block" alt="author-img" style="width: 40%; height: 40%;">
            <div class="card-body">
                <h5 class="card-title">Authors in database :</h5>
                <p class="card-text"><%=author.getAuthorId()%></p>
            </div>
        </div>
    </div>
<div class="col text-center">
    <div class="card h-100">
        <img src="" class="card-img-top img-fluid mx-auto d-block" alt="book-img" style="width: 40%; height: 40%;">
        <div class="card-body">
            <h5 class="card-title">Notes in database :</h5>
            <p class="card-text"></p>
        </div>
    </div>
</div>
<div class="col text-center">
    <div class="card h-100">
        <img src="https://i.ibb.co/tXrzmY2/genres.jpg" class="card-img-top img-fluid mx-auto d-block" alt="genres-img" style="width: 50%; height: 50%;">
        <div class="card-body">
            <h5 class="card-title">Genres in database :</h5>
            <p class="card-text"><%=genre.getGenreId()%></p>
        </div>
    </div>
</div>
<div class="col text-center">
    <div class="card h-100">
        <img src="https://i.ibb.co/PTkt1Ff/publishers.jpg" class="card-img-top img-fluid mx-auto d-block" alt="publishers-img" style="width: 50%; height: 50%;">
        <div class="card-body">
            <h5 class="card-title">Publishers in database :</h5>
            <p class="card-text"><%=publisher.getPublisherId()%></p>
        </div>
    </div>
</div>
</div>

</body>
</html>
