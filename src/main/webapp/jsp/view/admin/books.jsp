<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %>
<%@ page import="java.util.List" %><%--
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
            List<Book> lista = (List<Book>) request.getAttribute("booklist");

            for(Book book : lista){
        %>
        <tbody>

        <tr>
            <td><%=book.getBookId()%></td>
            <td><%=book.getBookImgId().getImgPath()%></td>
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

</body>
</html>
