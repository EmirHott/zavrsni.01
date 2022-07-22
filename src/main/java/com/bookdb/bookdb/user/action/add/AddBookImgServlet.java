package com.bookdb.bookdb.user.action.add;

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

@WebServlet(name = "AddBookImgServlet", value = "/AddBookImgServlet")
public class AddBookImgServlet extends HttpServlet {

    @Inject
    private BookImgServiceLocal bookImgServiceLocal;

    private void processRequest (HttpServletRequest request, HttpServletResponse response){

        try{
            BookImg bookImgToAdd = new BookImg();
            bookImgToAdd.setBookImgName(request.getParameter("bookimgname"));
            bookImgToAdd.setImgPath(request.getParameter("bookimgurl"));
            bookImgServiceLocal.create(bookImgToAdd);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("ADD BOOKIMG SERVLET").log(Level.INFO,e.getMessage());

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
