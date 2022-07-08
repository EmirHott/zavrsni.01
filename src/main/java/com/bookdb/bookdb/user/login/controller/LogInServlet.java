package com.bookdb.bookdb.user.login.controller;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.service.UserServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import com.bookdb.bookdb.user.login.model.LogInModel;
import com.bookdb.bookdb.user.session.Session;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LogInServlet", value = "/LogInServlet")
public class LogInServlet extends HttpServlet {

    @Inject
    UserServiceLocal userServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            LogInModel logInModel = new LogInModel();
            logInModel.setUsername(request.getParameter("username"));
            logInModel.setPassword(request.getParameter("password"));
            User user = userServiceLocal.login(logInModel);

            if (user != null) {
                Session.USER.addToSession(user, request);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.TOVIEW);
                requestDispatcher.forward(request,response);
            }else{
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.TOLOGIN);
                requestDispatcher.forward(request,response);
            }

        } catch (ServletException | IOException e) {
            Logger.getLogger("LOGIN SESSION").log(Level.INFO, e.getMessage());
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
