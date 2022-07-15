<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>

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






<div class="row row-cols-6 row-cols-sm-6 g-4" style="margin: 10px">
    <div class="col">
        <div class="card h-100">
            <img src="https://i.ibb.co/YhRGBPg/notes.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Notes</h5>
                <p class="card-text">Make ur own notes, edit them freely, define status and remove them.</p>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100">
            <img src="https://i.ibb.co/tXrzmY2/genres.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Books </h5>
                <p class="card-text">Find more information about your favorite books, and more.</p>
            </div>
        </div>
    </div>
</div>





<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
