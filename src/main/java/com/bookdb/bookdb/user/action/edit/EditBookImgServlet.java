package com.bookdb.bookdb.user.action.edit;

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

@WebServlet(name = "EditBookImgServlet", value = "/EditBookImgServlet")
public class EditBookImgServlet extends HttpServlet {

    @Inject
    private BookImgServiceLocal bookImgServiceLocal;



    private void processRequest (HttpServletRequest request, HttpServletResponse response){

        Integer bookImgIdToEdit = Integer.parseInt(request.getParameter("bookimgid"));

        try{
            BookImg bookImgToEdit = bookImgServiceLocal.find(bookImgIdToEdit);
            bookImgToEdit.setBookImgName(request.getParameter("bookimgname"));
            bookImgToEdit.setImgPath(request.getParameter("bookimgurl"));
            bookImgServiceLocal.edit(bookImgToEdit);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("EDIT BOOKIMG SERVLET").log(Level.INFO,e.getMessage());
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
