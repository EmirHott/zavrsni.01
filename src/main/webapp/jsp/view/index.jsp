<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 04/07/2022
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">



</head>



<body  class="d-flex flex-column min-vh-100">
<jsp:include page="navbar.jsp"></jsp:include>



<div>
<img src="https://i.ibb.co/qmcWdG7/staticc.png" class="img-fluid" alt="..." style="margin-bottom: 20px">
</div>



<div class="row row-cols-1 row-cols-md-4 g-4" style="margin: 10px">
    <div class="col">
        <div class="card h-100">
            <img src="" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"></h5>
                <p class="card-text"></p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text"> is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
