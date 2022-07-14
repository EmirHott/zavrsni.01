package com.bookdb.bookdb.user.action.edit;

import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import com.bookdb.bookdb.ejb.user.notes.service.NoteServiceLocal;
import com.bookdb.bookdb.ejb.user.notes.status.entity.Status;
import com.bookdb.bookdb.ejb.user.notes.status.service.StatusServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import com.bookdb.bookdb.user.session.Session;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EditNoteServlet", value = "/EditNoteServlet")
public class EditNoteServlet extends HttpServlet {

    @Inject
    NoteServiceLocal noteServiceLocal;
    @Inject
    BookServiceLocal bookServiceLocal;
    @Inject
    StatusServiceLocal statusServiceLocal;


    private void processRequest (HttpServletRequest request, HttpServletResponse response){
        Integer noteId = Integer.parseInt(request.getParameter("noteid"));
        String privilegeName = Session.USER.getFromSession(request).getPrivilegeId().getPrivilegeName();
        try{
            if(privilegeName.equalsIgnoreCase("admin")) {
                Note noteToChange = noteServiceLocal.find(noteId);
                noteToChange.setNoteText(request.getParameter("notetext"));
                noteServiceLocal.edit(noteToChange);
            }else {
                Integer bookId = Integer.parseInt(request.getParameter("books"));
                Book bookForNote = bookServiceLocal.find(bookId);

                Integer statusId = Integer.parseInt(request.getParameter("statusradio"));
                Status statusForNote = statusServiceLocal.find(statusId);


                Note noteToChange = noteServiceLocal.find(noteId);
                noteToChange.setNoteTitle(request.getParameter("notetitle"));
                noteToChange.setNoteText(request.getParameter("notetext"));
                noteToChange.setBookId(bookForNote);
                noteToChange.setStatusId(statusForNote);
                noteServiceLocal.edit(noteToChange);
            }

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.NOTESERVLET);
            requestDispatcher.forward(request,response);
        }catch (ServletException | IOException e){
            Logger.getLogger("EDIT NOTE SERVLET").log(Level.INFO,e.getMessage());

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request,response);
    }
}
