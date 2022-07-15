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



    <div style="margin: 20px">

        <h4>Find note by id :</h4>
        <form class="d-flex p-3 bg-light w-50" method="post" action="NoteServlet">
            <input class="form-control me-2" type="number" placeholder="Search" aria-label="Search" name="findnote">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>

    <%
        Note note = (Note) request.getAttribute("findednote");
    %>
    <div style="margin: 20px">
        <form class="p-3 bg-light" method="post" action="">
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">Note Id</label>
                <div class="col-sm-2">
                    <input name="noteid" type="text" class="form-control" value="<%= note != null ?note.getNoteId():""%>" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-2">
                    <input name="username" type="text" class="form-control" value="<%= note != null ?note.getUserId().getUsername(): ""%>" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label  class="col-sm-2 col-form-label">Book Title</label>
                <div class="col-sm-2">
                    <input name="booktitle" type="text" class="form-control" value="<%=note != null? note.getBookId().getBookTitle():""%>" readonly>
                </div>
            </div>
            <fieldset class="row mb-3">

                <legend class="col-form-label col-sm-2 pt-0">Status</legend>

                <div class="col-sm-2">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="statusradio"  value="<%=note != null? note.getStatusId():""%>" checked readonly>
                        <label class="form-check-label" > <%=note != null? note.getStatusId().getStatus(): ""%> </label>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-text">Note content</span>
                    <textarea name="notetext" class="form-control" aria-label="With textarea"><%=note != null? note.getNoteText():""%></textarea>
                </div>

            </fieldset>

            <button  type="submit" class="btn btn-primary" onclick="form.action = 'EditNoteServlet';">Edit</button>
            <button  type="submit" class="btn btn-primary" onclick="form.action = 'RemoveNoteServlet';">Remove</button>
        </form>
    </div>

</div>
</body>
</html>
