package com.bookdb.bookdb.user.view;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.service.UserServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "UsersServlet", value = "/UsersServlet")
public class UserServlet extends HttpServlet {
    @Inject
    UserServiceLocal userServiceLocal;


    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<User> users = userServiceLocal.findAll();
            request.setAttribute("lista", users);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.USERS);
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            Logger.getLogger("USER SERVLET").log(Level.INFO, e.getMessage());

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
