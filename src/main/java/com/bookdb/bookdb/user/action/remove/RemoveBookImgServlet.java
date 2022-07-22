package com.bookdb.bookdb.user.action.remove;

import com.bookdb.bookdb.ejb.books.bookimg.entity.BookImg;
import com.bookdb.bookdb.ejb.books.bookimg.service.BookImgServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RemoveBookImgServlet", value = "/RemoveBookImgServlet")
public class RemoveBookImgServlet extends HttpServlet {

    @Inject
    private BookImgServiceLocal bookImgServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response){

        Integer bookImgIdToRemove = Integer.parseInt(request.getParameter("bookimgid"));

        try{
            BookImg bookImgToRemove = bookImgServiceLocal.find(bookImgIdToRemove);
            bookImgServiceLocal.remove(bookImgToRemove);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("REMOVE BOOKIMG SERVLET").log(Level.INFO,e.getMessage());
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
