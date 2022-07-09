<%@ page import="com.bookdb.bookdb.ejb.user.notes.service.NoteServiceLocal" %>
<%@ page import="com.bookdb.bookdb.ejb.user.notes.entity.Note" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>


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

            for(Note note : notes){
        %>
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
</body>
</html>
