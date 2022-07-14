package com.bookdb.bookdb.user.action.edit;

import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import com.bookdb.bookdb.ejb.user.notes.service.NoteServiceLocal;
import com.bookdb.bookdb.paths.Paths;
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


    private void processRequest (HttpServletRequest request, HttpServletResponse response){
        Integer noteId = Integer.parseInt(request.getParameter("noteid"));

        try{
            Note noteToChange = noteServiceLocal.find(noteId);
            noteToChange.setNoteText(request.getParameter("notetext"));
            noteServiceLocal.edit(noteToChange);


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
