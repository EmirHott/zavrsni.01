package com.bookdb.bookdb.user.action.add;

import com.bookdb.bookdb.ejb.books.genre.entity.Genre;
import com.bookdb.bookdb.ejb.books.genre.service.GenreServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddGenreServlet", value = "/AddGenreServlet")
public class AddGenreServlet extends HttpServlet {

    @Inject
    private GenreServiceLocal genreServiceLocal;

    private void processRequest (HttpServletRequest request, HttpServletResponse response){

        try{
            Genre genreToAdd = new Genre();
            genreToAdd.setGenreName(request.getParameter("genrename"));
            genreServiceLocal.create(genreToAdd);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);


        }catch (ServletException | IOException e){
            Logger.getLogger("ADD GENRE SERVLET").log(Level.INFO,e.getMessage());
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
