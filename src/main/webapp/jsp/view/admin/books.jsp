<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.books.genre.entity.Genre" %>
<%@ page import="com.bookdb.bookdb.ejb.books.author.entity.Author" %>
<%@ page import="com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg" %>
<%@ page import="com.bookdb.bookdb.ejb.books.publisher.entity.Publisher" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>

<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Books preview:</h4>
<div  class="table-responsive-md" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Image URL</th>
            <th scope="col">Title</th>
            <th scope="col">Author</th>
            <th scope="col">Genre</th>
            <th scope="col">Rating</th>
            <th scope="col">Page number</th>
            <th scope="col">Publication Date</th>
            <th scope="col">Publisher</th>
            <th scope="col">Info</th>
        </tr>
        </thead>
        <%
            List<Book> bookList = (List<Book>) request.getAttribute("booklist");

            for(Book book : bookList){
        %>
        <tbody>

        <tr>
            <td><%=book.getBookId()%></td>
            <td><img style="height: 20%; width: 20%;" src="<%=book.getBookImgId().getImgPath()%>"></td>
            <td><%=book.getBookTitle()%></td>
            <td><%=book.getAuthorList()%></td>
            <td><%=book.getGenreList()%></td>
            <td><%=book.getBookRating()%></td>
            <td><%=book.getBookPages()%></td>
            <td><%=book.getBookPublicationDate()%></td>
            <td><%=book.getPublisherId().getPublisherName()%></td>
            <td><%=book.getBookInfo()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Genres in Database:</h4>
<div  class="table-responsive-md" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Genre</th>
        </thead>
        <%
            List<Genre> genreList = (List<Genre>) request.getAttribute("genrelist");

            for( Genre genre : genreList ){
        %>
        <tbody>
        <tr>
            <td><%=genre.getGenreId()%></td>
            <td><%=genre.getGenreName()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Genres in Database:</h4>
<div  class="table-responsive-md" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Surname</th>
        </thead>
        <%
            List<Author> authorList = (List<Author>) request.getAttribute("authorlist");

            for( Author author : authorList ){
        %>
        <tbody>
        <tr>
            <td><%=author.getAuthorId()%></td>
            <td><%=author.getAuthorName()%></td>
            <td><%=author.getAuthorSurname()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Book Images in Database:</h4>
<div  class="table-responsive-md" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Image URL</th>
        </thead>
        <%
            List<BookImg> bookImgList  = (List<BookImg>) request.getAttribute("bookimglist");

            for( BookImg bookImg : bookImgList ){
        %>
        <tbody>
        <tr>
            <td><%=bookImg.getBookImgId()%></td>
            <td><%=bookImg.getImgPath()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Publishers in Database:</h4>
<div  class="table-responsive-md" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
        </thead>
        <%
            List<Publisher> publisherList = (List<Publisher>) request.getAttribute("publisherlist");

            for( Publisher publisher : publisherList ){
        %>
        <tbody>
        <tr>
            <td><%=publisher.getPublisherId()%></td>
            <td><%=publisher.getPublisherName()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>





</body>
</html>
