<%--
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
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="usernav.jsp"></jsp:include>



<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://st1.latestly.com/wp-content/uploads/2020/04/International-Day-of-the-Book-2020-quotes.jpg" class="d-block w-100 h-50" alt="...">
        </div>
        <div class="carousel-item">
            <img src="https://st1.latestly.com/wp-content/uploads/2020/04/Book-quotes.jpg" class="d-block w-100 h-50" alt="...">
        </div>
        <div class="carousel-item">
            <img src="https://st1.latestly.com/wp-content/uploads/2020/04/World-Book-Day-quotes-2.jpg" class="d-block w-100 h-50" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
