<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookDB</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="navbar.jsp"></jsp:include>



<div>
<img src="https://i.ibb.co/qmcWdG7/staticc.png" class="img-fluid" alt="..." style="margin-bottom: 20px">
</div>








<div class="container-fluid p-0 overflow-hidden" style="margin-bottom: 20px">
    <div class="row g-0">
        <div  class="col-lg-6 order-lg-2 " style="min-height: 45vh; background-size: cover; background-position: center; background-image: url('https://images.gr-assets.com/misc/1650914513-1650914513_goodreads_misc.png');">

        </div>
        <div class="col-lg-6 order-lg-1 my-auto px-5 py-5">
            <div class="lc-block">
                <div editable="rich">
                    <h1>Find your favorite Books.</h1>
                    <p class="lead">Trying to find good books to read during your commute or planning out your summer reading early? There is nothing more daunting than going to a bookstore without a shopping list. So, make sure that your next read is going to be a good one.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-0">
        <div  class="col-lg-6" style="min-height: 45vh; background-size: cover;background-position: center; background-image: url('https://images.gr-assets.com/misc/1650914538-1650914538_goodreads_misc.png');">
        </div>
        <div class="col-lg-6 my-auto px-5 py-5">
            <div class="lc-block">
                <div editable="rich">
                    <h1>Make your own Notes.</h1>
                    <p class="lead">Simple and easy to use note feature. Create notes tied to a book, set status and text. Your note can be edited or remove. To use it JOIN US!</p>
                </div>
            </div>

        </div>
    </div>
</div>






<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
