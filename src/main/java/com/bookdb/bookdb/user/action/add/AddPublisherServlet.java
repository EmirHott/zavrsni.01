package com.bookdb.bookdb.user.action.add;

import com.bookdb.bookdb.ejb.books.publisher.entity.Publisher;
import com.bookdb.bookdb.ejb.books.publisher.service.PublisherServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddPublisherServlet", value = "/AddPublisherServlet")
public class AddPublisherServlet extends HttpServlet {

    @Inject
    private PublisherServiceLocal publisherServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response){

        try{
            Publisher publisherToAdd = new Publisher();
            publisherToAdd.setPublisherName(request.getParameter("publishername"));
            publisherServiceLocal.create(publisherToAdd);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("ADD PUBLISHER SERVLET").log(Level.INFO,e.getMessage());
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
