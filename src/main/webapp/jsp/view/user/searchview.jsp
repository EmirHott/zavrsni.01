<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BookDB</title>
</head>
<body >
<jsp:include page="usernav.jsp"></jsp:include>




<%
    List<Book> books = (List<Book>) request.getAttribute("findedbook");
    for(Book book : books){

%>
<div class="row row-cols-1 row-cols-md-1 g-4 align-items-center" style="margin: 20px 300px 40px 300px;">
    <div class="col text-center ">
        <div class="card h-100 ">
            <img src="<%=book.getBookImgId().getImgPath()%>" class="card-img-top img-fluid mx-auto d-block " alt="..." style="width: 15%; height: 15%;padding-top: 10px ">
            <div class="card-body ">
                <h5 class="card-title">Title :</h5>
                    <p class="card-text"><%=book.getBookTitle()%></p>
                <h5 class="card-title">Author :</h5>
                    <p class="card-text"><%=book.getAuthorList()%></p>
                <h5 class="card-title">Publisher :</h5>
                    <p class="card-text"><%=book.getPublisherId().getPublisherName()%></p>
                <h5 class="card-title">Publication date :</h5>
                    <p class="card-text"><%=book.getBookPublicationDate()%></p>
                <h5 class="card-title">Genres :</h5>
                    <p class="card-text"><%=book.getGenreList()%></p>
                <h5 class="card-title">Rating :</h5>
                    <p class="card-text"><%=book.getBookRating()%></p>
                <h5 class="card-title">Number of pages :</h5>
                    <p class="card-text"><%=book.getBookPages()%></p>
                <h5 class="card-title">Info :</h5>
                    <p class="card-text"><%=book.getBookInfo()%></p>
            </div>
        </div>
    </div>
</div>
<%}%>






<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
