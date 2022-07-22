package com.bookdb.bookdb.user.action.add;

import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
import com.bookdb.bookdb.ejb.user.entity.User;
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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddNoteServlet", value = "/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {

    @Inject
    private NoteServiceLocal noteServiceLocal;
    @Inject
    private BookServiceLocal bookServiceLocal;
    @Inject
    private StatusServiceLocal statusServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response){
        User userInSession = Session.USER.getFromSession(request);

        Integer bookId = Integer.parseInt(request.getParameter("books"));
        Book bookForNote = bookServiceLocal.find(bookId);

        Integer statusId = Integer.parseInt(request.getParameter("statusradio"));
        Status statusForNote = statusServiceLocal.find(statusId);


        try{
            Note noteToAdd = new Note();
            noteToAdd.setUserId(userInSession);
            noteToAdd.setBookId(bookForNote);
            noteToAdd.setNoteTitle(request.getParameter("notetitle"));
            noteToAdd.setNoteText(request.getParameter("notetext"));
            noteToAdd.setStatusId(statusForNote);
            noteServiceLocal.create(noteToAdd);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.NOTESERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("ADD NOTE SERVLET").log(Level.INFO,e.getMessage());
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
