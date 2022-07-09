<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
</head>
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="usernav.jsp"></jsp:include>

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
                <p class="card-text">Book rating : <%=book.getBookRating()%></p>
            </div>
        </div>
    </div>
<%}%>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
