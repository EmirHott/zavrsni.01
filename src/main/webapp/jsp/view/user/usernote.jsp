<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.user.notes.entity.Note" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 05/07/2022
  Time: 00:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="usernav.jsp"></jsp:include>



<div  class="table-responsive" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Note Id</th>
            <th scope="col">Username</th>
            <th scope="col">Book Title</th>
            <th scope="col">Note info</th>
            <th scope="col">Status</th>
        </tr>
        </thead>
            <%
    List<Note> notes = (List<Note>) request.getAttribute("notelist");
        for (Note note:notes) { %>
<tbody>
<tr>
    <td><%=note.getNoteId()%></td>
    <td><%=note.getUserId().getUsername()%></td>
    <td><%=note.getBookId().getBookTitle()%></td>
    <td><%=note.getNoteText()%></td>
    <td><%=note.getStatusId().getStatus()%></td>
</tr>
<%}%>

</tbody>
</table>
</div>
<p style="color: red; text-align: center"><%=request.getAttribute("message")==null?"":request.getAttribute("message")%></p>



<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
