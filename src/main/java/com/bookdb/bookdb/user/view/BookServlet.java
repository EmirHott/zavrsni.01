package com.bookdb.bookdb.user.view;


import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
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

@WebServlet(name = "BookServlet", value = "/BookServlet")
public class BookServlet extends HttpServlet {

    @Inject
    BookServiceLocal bookServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Book> books = bookServiceLocal.findAll();
            request.setAttribute("booklist", books);

            String privilegeName = Session.USER.getFromSession(request).getPrivilegeId().getPrivilegeName();

            if(privilegeName.equalsIgnoreCase("admin")){
                RequestDispatcher toView = request.getRequestDispatcher(Paths.ADMINBOOKS);
                toView.forward(request,response);
            }
            else {
                RequestDispatcher toView = request.getRequestDispatcher(Paths.USERBOOK);
                toView.forward(request, response);
            }
        } catch (ServletException | IOException e) {
            Logger.getLogger("BOOKS SERVLET").log(Level.INFO, e.getMessage());

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
