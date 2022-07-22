package com.bookdb.bookdb.user.action.remove;

import com.bookdb.bookdb.ejb.books.author.entity.Author;
import com.bookdb.bookdb.ejb.books.author.service.AuthorServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RemoveAuthorServlet", value = "/RemoveAuthorServlet")
public class RemoveAuthorServlet extends HttpServlet {

    @Inject
    private AuthorServiceLocal authorServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response){

        Integer authorIdToRemove = Integer.parseInt(request.getParameter("authorid"));

        try{
            Author authorToRemove = authorServiceLocal.find(authorIdToRemove);
            authorServiceLocal.remove(authorToRemove);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("REMOVE AUTHOR SERVLET").log(Level.INFO,e.getMessage());
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
