package com.bookdb.bookdb.user.view;


import com.bookdb.bookdb.ejb.user.notes.entity.Note;
import com.bookdb.bookdb.ejb.user.notes.service.NoteServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import com.bookdb.bookdb.user.session.Session;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "NoteServlet", value = "/NoteServlet")
public class NoteServlet extends HttpServlet {
    @Inject
    NoteServiceLocal noteServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {

            String privilegeName = Session.USER.getFromSession(request).getPrivilegeId().getPrivilegeName();

            if(privilegeName.equalsIgnoreCase("admin")){

                List<Note> allNotes = noteServiceLocal.findAll();
                request.setAttribute("notelist", allNotes);

                if (request.getParameter("findnote") == null){

                    Note note = noteServiceLocal.find(1);
                    request.setAttribute("findednote", note);
                } else {
                    Integer noteId = Integer.parseInt(request.getParameter("findnote"));
                    Note note = noteServiceLocal.find(noteId);
                    request.setAttribute("findednote",note);
                }

                RequestDispatcher toView = request.getRequestDispatcher(Paths.ADMINNOTE);
                toView.forward(request,response);
            }
            else {

                List <Note> notes = (List<Note>) noteServiceLocal.findByUserId(Session.USER.getFromSession(request).getUserId());
                request.setAttribute("notelist", notes);

                RequestDispatcher toView = request.getRequestDispatcher(Paths.USERNOTE);
                toView.forward(request, response);
            }
        } catch (ServletException | IOException e) {
            Logger.getLogger("NOTES SERVLET").log(Level.INFO, e.getMessage());

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
