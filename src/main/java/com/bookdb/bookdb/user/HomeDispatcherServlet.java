package com.bookdb.bookdb.user;

import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "HomeDispatcherServlet", value = "/HomeDispatcherServlet")
public class HomeDispatcherServlet extends HttpServlet {
    @Inject
    BookServiceLocal bookServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {

        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.HOME);
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            Logger.getLogger("HOME SERVLET").log(Level.INFO, e.getMessage());
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
