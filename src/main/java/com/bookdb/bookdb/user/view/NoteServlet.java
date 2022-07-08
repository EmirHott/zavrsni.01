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
            List<Note> notes = noteServiceLocal.findAll();
            request.setAttribute("notelist", notes);
            String privilegeName = Session.USER.getFromSession(request).getPrivilegeId().getPrivilegeName();

            if(privilegeName.equalsIgnoreCase("admin")){
                RequestDispatcher toView = request.getRequestDispatcher(Paths.ADMINNOTE);
                toView.forward(request,response);
            }
            else {
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
