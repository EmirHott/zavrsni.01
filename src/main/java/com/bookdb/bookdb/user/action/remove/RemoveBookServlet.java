package com.bookdb.bookdb.user.action.remove;

import com.bookdb.bookdb.ejb.books.entity.Book;
import com.bookdb.bookdb.ejb.books.service.BookServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RemoveBookServlet", value = "/RemoveBookServlet")
public class RemoveBookServlet extends HttpServlet {

    @Inject
    private BookServiceLocal bookServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response){

            Integer bookId = Integer.parseInt(request.getParameter("bookid"));
        try{
            Book bookToRemove =bookServiceLocal.find(bookId);
            bookServiceLocal.remove(bookToRemove);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);
        }catch (ServletException | IOException e){
            Logger.getLogger("REMOVE BOOK SERVLET").log(Level.INFO,e.getMessage());
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
