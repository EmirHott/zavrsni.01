package com.bookdb.bookdb.user.action.edit;

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

@WebServlet(name = "EditPublisherServlet", value = "/EditPublisherServlet")
public class EditPublisherServlet extends HttpServlet {

    @Inject
    private PublisherServiceLocal publisherServiceLocal;

    private void processRequest (HttpServletRequest request, HttpServletResponse response){

        Integer publisherIdToEdit = Integer.parseInt(request.getParameter("publisherid"));

        try{
            Publisher publisherToEdit = publisherServiceLocal.find(publisherIdToEdit);
            publisherToEdit.setPublisherName(request.getParameter("publishername"));
            publisherServiceLocal.edit(publisherToEdit);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.BOOKSERVLET);
            requestDispatcher.forward(request,response);

        }catch (ServletException | IOException e){
            Logger.getLogger("EDIT PUBLISHER SERVLET").log(Level.INFO,e.getMessage());
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
