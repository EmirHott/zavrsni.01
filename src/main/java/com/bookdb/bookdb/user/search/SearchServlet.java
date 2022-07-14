package com.bookdb.bookdb.user.search;

import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {

    @Inject
    BookServiceLocal bookServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {

        try {
             List <Book> books = (List<Book>) bookServiceLocal.findByContainsInTitle(request.getParameter("search"));

            if(books.isEmpty()){
                request.setAttribute("message", String.format("Unable to find book:'%s'", request.getParameter("search")));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.TOVIEW);
                requestDispatcher.forward(request, response);
            }else {
                request.setAttribute("findedbook", books);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.SEARCHVIEW);
                requestDispatcher.forward(request, response);
            }

        } catch (ServletException | IOException e) {
            Logger.getLogger("SEARCH SERVLET").log(Level.INFO, e.getMessage());

        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
