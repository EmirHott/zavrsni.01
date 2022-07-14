package com.bookdb.bookdb.user.action.remove;

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

@WebServlet(name = "RemoveNoteServlet", value = "/RemoveNoteServlet")
public class RemoveNoteServlet extends HttpServlet {

   @Inject
   NoteServiceLocal noteServiceLocal;

   private void processRequest(HttpServletRequest request,HttpServletResponse response){

       Integer noteId = Integer.parseInt(request.getParameter("noteid"));

       try{
           Note removeNote = noteServiceLocal.find(noteId);
           noteServiceLocal.remove(removeNote);



           RequestDispatcher toView = request.getRequestDispatcher(Paths.NOTESERVLET);
           toView.forward(request,response);

       }catch (ServletException | IOException e){
           Logger.getLogger("REMOVE NOTE SERVLET").log(Level.INFO,e.getMessage());
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
