package com.bookdb.bookdb.user.action.add;

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

@WebServlet(name = "AddAuthorServlet", value = "/AddAuthorServlet")
public class AddAuthorServlet extends HttpServlet {

    @Inject
    AuthorServiceLocal authorServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response){

        try{
            Author authorToAdd = new Author();
            authorToAdd.setAuthorName(request.getParameter("authorname"));
            authorToAdd.setAuthorSurname(request.getParameter("authorsurname"));
            authorServiceLocal.create(authorToAdd);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("ADD AUTHOR SERVLET").log(Level.INFO,e.getMessage());
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
