<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BooKDB</title>
</head>
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="usernav.jsp"></jsp:include>


<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active " data-bs-interval="10000">
            <img src="https://i.ibb.co/vk8bNjq/qoute1.jpg" class="d-block w-100 " alt="..." >
        </div>
        <div class="carousel-item" data-bs-interval="10000">
            <img src="https://i.ibb.co/FVznf4k/qoute2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="10000">
            <img src="https://i.ibb.co/NFXtty5/qoute3.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
</div>

<h2 style="text-align: center; font-family: Arial; margin-bottom: 20px; margin-top: 40px;">Our recommendation:</h2>

<div class="row row-cols-1 row-cols-md-4 g-4" style="margin: 10px">

    <%
        List<Book> bookList = (List<Book>) request.getAttribute("booklist");
        for (Book book : bookList ) {
    %>
    <div class="col-md-3 text-center">
        <div class="card h-100 ">
            <img src="<%=book.getBookImgId().getImgPath()%>" class="card-img-top img-fluid mx-auto d-block " alt="..." style="height: 50%; width: 50%;padding-top: 50px;">
            <div class="card-body">
                <h5 class="card-title"><%=book.getBookTitle()%></h5>
                <p class="card-text"><%=book.getAuthorList()%></p>
                <p class="card-text">Book Info : <%=book.getBookInfo()%></p>
            </div>
        </div>
    </div>
    <%}%>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
