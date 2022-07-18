<%@ page import="java.util.List" %>
<%@ page import="com.bookdb.bookdb.ejb.user.notes.entity.Note" %>
<%@ page import="com.bookdb.bookdb.ejb.user.notes.status.entity.Status" %>
<%@ page import="com.bookdb.bookdb.ejb.books.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Emir
  Date: 05/07/2022
  Time: 00:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookDB-Note</title>
</head>
<body  class="d-flex flex-column min-vh-100">
<jsp:include page="usernav.jsp"></jsp:include>



<div  class="table-responsive" style="margin: 30px">
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">Note Id</th>
            <th scope="col">Note Title</th>
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
    <td><%=note.getNoteTitle()%></td>
    <td><%=note.getBookId().getBookTitle()%></td>
    <td><%=note.getNoteText()%></td>
    <td><%=note.getStatusId().getStatus()%></td>
</tr>
<%}%>

</tbody>
</table>
</div>
<p style="color: red; text-align: center"><%=request.getAttribute("message")==null?"":request.getAttribute("message")%></p>


<div style="margin: 20px">

    <h4>Find note by Title :</h4>
    <form class="d-flex p-3 bg-light w-50" method="post" action="NoteServlet">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="findnote">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>

<%
    Note note = (Note) request.getAttribute("findednote");
%>
<div style="margin: 20px">
    <form class="p-3 bg-light" method="post" action="">

        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label" hidden>User Id</label>
            <div class="col-sm-2">
                <input name="userid" type="text" class="form-control" value="<%= note != null ?note.getUserId().getUserId():""%>" hidden>
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label" hidden>Note Id</label>
            <div class="col-sm-2">
                <input name="noteid" type="text" class="form-control" value="<%= note != null ?note.getNoteId():""%>" hidden>
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Note Title</label>
            <div class="col-sm-2">
                <input name="notetitle" type="text" class="form-control" value="<%= note != null ?note.getNoteTitle(): ""%>">
            </div>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="inputGroupSelect01">Books</label>
            <select name="books" class="form-select" id="inputGroupSelect01">
                <option selected>Choose...</option>
               <%
                   List<Book> bookList = (List<Book>) request.getAttribute("booklist");
                   for (Book book : bookList){
               %>
                <option value="<%=book.getBookId()%>"><%=book.getBookTitle()%></option>
              <%}%>
            </select>
        </div>

        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">Status</legend>
            <div class="col-sm-2">
                <%
                 List<Status> statusList = (List<Status>) request.getAttribute("statuslist");
                 for(Status status : statusList){
                %>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="statusradio"  value="<%=status != null? status.getStatusId():""%>" >
                    <label class="form-check-label" > <%=status != null? status.getStatus(): ""%> </label>
                </div>
                <%}%>
            </div>
            <div class="input-group">
                <span class="input-group-text">Note content</span>
                <textarea name="notetext" class="form-control" aria-label="With textarea"><%=note != null? note.getNoteText():""%></textarea>
            </div>

        </fieldset>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'AddNoteServlet';">Add</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditNoteServlet';">Edit</button>
        <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveNoteServlet';">Remove</button>
    </form>
</div>

</div>



<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
