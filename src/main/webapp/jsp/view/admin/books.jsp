<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.books.genre.entity.Genre" %>
<%@ page import="com.bookdb.bookdb.ejb.books.author.entity.Author" %>
<%@ page import="com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg" %>
<%@ page import="com.bookdb.bookdb.ejb.books.publisher.entity.Publisher" %>

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

<div style="margin: 20px">

<h4>Find Book by Title :</h4>
<form class="d-flex w-50 p-3 bg-light " method="post" action="BookServlet">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findbook">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
</div>

<%

    Book book = (Book) request.getAttribute("findedbook");
%>
<div style="margin: 20px">
    <form class="p-3 bg-light" method="post" action="">

        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label" >Book Id</label>
            <div class="col-sm-2">
                <input name="bookid" type="text" class="form-control" value="<%= book != null ? book.getBookId():""%>" readonly>
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label" >Book Title</label>
            <div class="col-sm-2">
                <input name="booktitle" type="text" class="form-control" value="<%= book != null ?book.getBookTitle():""%>">
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Book Page number</label>
            <div class="col-sm-2">
                <input name="bookpages" type="text" class="form-control" value="<%= book != null ?book.getBookPages(): ""%>">
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Book Rating</label>
            <div class="col-sm-2">
                <input name="bookrating" type="text" class="form-control" value="<%= book != null ?book.getBookRating(): ""%>">
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Book Publication Date</label>
            <div class="col-sm-2">
                <input name="bookdate" type="text" class="form-control" value="<%= book != null ?book.getBookPublicationDate(): ""%>">
            </div>
        </div>

        <label  class="col-sm-2 col-form-label">Genre</label>
            <%
                List<Genre> genres = (List<Genre>) request.getAttribute("genrelist");
                for(Genre genre : genres){
            %>
        <div class="form-check form-check-inline row mb-3">
            <div class="col-sm-2">
            <input name="bookgenreid" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="<%=genre.getGenreId()%>">
            <label name="bookgenrename" class="form-check-label" for="inlineCheckbox1"><%=genre.getGenreName()%></label>
            </div>
        </div>
        <%}%>


        <%
            List<Publisher> publishers = (List<Publisher>) request.getAttribute("publisherlist");
        %>
        <div class="input-group mb-3" style="margin-top: 10px">
            <label class="input-group-text" >Publishers</label>
            <select name="bookpublisherid" class="form-select w-50" >
                <option  selected>Choose...</option>
                <%
                    for(Publisher publisher : publishers){
                %>
                <option  value=<%=publisher.getPublisherId()%>><%=publisher.getPublisherName()%></option>
                <%}%>
            </select>
            </div>



        <%
            List<BookImg> bookImgs = (List<BookImg>) request.getAttribute("bookimglist");
        %>
        <div class="input-group mb-3" style="margin-top: 10px">
            <label class="input-group-text" for="inputGroupSelect01">Book Image</label>
            <select name="bookimgid" class="form-select w-50" id="inputGroupSelect01">
                <option selected>Choose...</option>
                <%
                    for(BookImg bookImg : bookImgs){
                %>
                <option  value=<%=bookImg.getBookImgId()%>><%=bookImg.getBookImgName()%></option>
                <%}%>
            </select>
        </div>


        <%
            List<Author> authors = (List<Author>) request.getAttribute("authorlist");
        %>
        <div class="input-group mb-3" style="margin-top: 10px">
            <label class="input-group-text" for="inputGroupSelect02">Authors</label>
            <select name="bookauthorid" class="form-select w-50" id="inputGroupSelect02">
                <option selected>Choose...</option>
                <%
                    for(Author author : authors){
                %>
                <option value=<%=author.getAuthorId()%>><%=author.getAuthorName()%> <%=author.getAuthorSurname()%></option>
                <%}%>
            </select>
        </div>
            <div class="input-group" style="margin-top: 10px">
                <span class="input-group-text">Note content</span>
                <textarea name="bookinfo" class="form-control" aria-label="With textarea"><%=book != null? book.getBookInfo():""%></textarea>
            </div>



        <button  type="submit" class="btn btn-primary" onclick="form.action = 'AddBookServlet';">Add</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditBookServlet';">Edit</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveBookServlet';">Remove</button>
    </form>
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
<form class="d-flex p-3 bg-light w-50" method="post" action="BookServlet">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findgenre">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
</div>
<%
    Genre genre = (Genre) request.getAttribute("findedgenre");
%>

<div style="margin: 20px">
    <form class="p-3 bg-light" method="post" action="">
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




<h4 style="text-align: center; font-family: sans-serif, bold; margin-top: 20px;" > Authors in Database:</h4>
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
    <form class="d-flex p-3 bg-light w-50" method="post" action="BookServlet">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findauthor">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<%
    Author author = (Author) request.getAttribute("findedauthor");
%>

<div style="margin: 20px">
    <form class="p-3 bg-light" method="post" action="">
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
        <form class="d-flex p-3 bg-light w-50" method="post" action="BookServlet">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findbookimg">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
    <%
        BookImg bookImg = (BookImg) request.getAttribute("findedbookimg");
    %>

    <div style="margin: 20px">
        <form class="p-3 bg-light" method="post" action="">
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
    <form class="d-flex p-3 bg-light w-50" method="post" action="BookServlet">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findpublisher">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<%
    Publisher publisher = (Publisher) request.getAttribute("findedpublisher");
%>

<div style="margin: 20px">
    <form class="p-3 bg-light" method="post" action="">
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
