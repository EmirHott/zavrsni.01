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


<div style="margin: 20px">
<h4>Find Genre by name :</h4>
<form class="d-flex w-50" method="post" action="BookServlet">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findgenre">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
</div>
<%
    Genre genre = (Genre) request.getAttribute("findedgenre");
%>

<div style="margin: 20px">
    <form method="post" action="">
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Genre Id</label>
            <div class="col-sm-2">
                <input name="genreid" type="text" class="form-control" value="<%= genre != null ?genre.getGenreId():""%>" readonly>
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Genre Name</label>
            <div class="col-sm-2">
                <input name="genrename" type="text" class="form-control" value="<%= genre != null ?genre.getGenreName(): ""%>">
            </div>
        </div>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'AddGenreServlet';">Add</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditGenreServlet';">Edit</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveGenreServlet';">Remove</button>
    </form>
</div>




<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Authors in Database:</h4>
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

<div style="margin: 20px">
    <h4>Find Author by name :</h4>
    <form class="d-flex w-50" method="post" action="BookServlet">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findauthor">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<%
    Author author = (Author) request.getAttribute("findedauthor");
%>

<div style="margin: 20px">
    <form method="post" action="">
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Author Id</label>
            <div class="col-sm-2">
                <input name="authorid" type="text" class="form-control" value="<%= author != null ?author.getAuthorId():""%>" readonly>
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Author Name</label>
            <div class="col-sm-2">
                <input name="authorname" type="text" class="form-control" value="<%= author != null ? author.getAuthorName(): ""%>">
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Author Surname</label>
            <div class="col-sm-2">
                <input name="authorsurname" type="text" class="form-control" value="<%= author != null ? author.getAuthorSurname(): ""%>">
            </div>
        </div>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'AddAuthorServlet';">Add</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditAuthorServlet';">Edit</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveAuthorServlet';">Remove</button>
    </form>
</div>





<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" >Book Images in Database:</h4>
<div  class="table-responsive-md" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Book Image Name</th>
            <th scope="col">Image URL</th>
        </thead>
        <%
            List<BookImg> bookImgList  = (List<BookImg>) request.getAttribute("bookimglist");

            for( BookImg bookImg : bookImgList ){
        %>
        <tbody>
        <tr>
            <td><%=bookImg.getBookImgId()%></td>
            <td><%=bookImg.getBookImgName()%></td>
            <td><%=bookImg.getImgPath()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>


    <div style="margin: 20px">
        <h4>Find Image by name :</h4>
        <form class="d-flex w-50" method="post" action="BookServlet">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findbookimg">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
    <%
        BookImg bookImg = (BookImg) request.getAttribute("findedbookimg");
    %>

    <div style="margin: 20px">
        <form method="post" action="">
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">Book Image Id</label>
                <div class="col-sm-2">
                    <input name="bookimgid" type="text" class="form-control" value="<%= bookImg != null ?bookImg.getBookImgId():""%>" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">Book Image Name</label>
                <div class="col-sm-2">
                    <input name="bookimgname" type="text" class="form-control" value="<%= bookImg != null ?bookImg.getBookImgName(): ""%>">
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">Book Image URL</label>
                <div class="col-sm-6">
                    <input name="bookimgurl" type="text" class="form-control" value="<%= bookImg != null ?bookImg.getImgPath(): ""%>">
                </div>
            </div>
            <button  type="submit" class="btn btn-primary" onclick="form.action = 'AddBookImgServlet';">Add</button>
            <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditBookImgServlet';">Edit</button>
            <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveBookImgServlet';">Remove</button>
        </form>
    </div>



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


<div style="margin: 20px">
    <h4>Find Publisher by name :</h4>
    <form class="d-flex w-50" method="post" action="BookServlet">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findpublisher">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<%
    Publisher publisher = (Publisher) request.getAttribute("findedpublisher");
%>

<div style="margin: 20px">
    <form method="post" action="">
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Publisher Id</label>
            <div class="col-sm-2">
                <input name="publisherid" type="text" class="form-control" value="<%= publisher != null ?publisher.getPublisherId():""%>" readonly>
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Publisher Name</label>
            <div class="col-sm-2">
                <input name="publishername" type="text" class="form-control" value="<%= publisher != null ?publisher.getPublisherName(): ""%>">
            </div>
        </div>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'AddPublisherServlet';">Add</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditPublisherServlet';">Edit</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemovePublisherServlet';">Remove</button>
    </form>
</div>



</body>
</html>
