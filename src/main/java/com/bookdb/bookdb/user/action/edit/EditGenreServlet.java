package com.bookdb.bookdb.user.action.edit;

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

@WebServlet(name = "EditGenreServlet", value = "/EditGenreServlet")
public class EditGenreServlet extends HttpServlet {

    @Inject
    GenreServiceLocal genreServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response){

            Integer genreIdToEdit = Integer.parseInt(request.getParameter("genreid"));

            try{
                Genre genreToEdit = genreServiceLocal.find(genreIdToEdit);
                genreToEdit.setGenreName(request.getParameter("genrename"));
                genreServiceLocal.edit(genreToEdit);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
                requestDispatcher.forward(request,response);

            }catch (ServletException | IOException e){
                Logger.getLogger("EDIT GENRE SERVLET").log(Level.INFO,e.getMessage());

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
