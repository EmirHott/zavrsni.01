package com.bookdb.bookdb.user.action.remove;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.service.UserServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RemoveUserServlet", value = "/RemoveUserServlet")
public class RemoveUserServlet extends HttpServlet {

    @Inject
    UserServiceLocal userServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response){

        Integer userId = Integer.parseInt(request.getParameter("userid"));

        try{
            User removeUser = userServiceLocal.find(userId);
            userServiceLocal.remove(removeUser);


            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.USERSERVLET);
            requestDispatcher.forward(request, response);


        }catch (ServletException | IOException e){
            Logger.getLogger("REMOVE USER SERVLET").log(Level.INFO,e.getMessage());

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
