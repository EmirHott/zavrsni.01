package com.bookdb.bookdb.user.signup.controller;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.service.UserServiceLocal;
import com.bookdb.bookdb.paths.Paths;
import com.bookdb.bookdb.user.signup.model.SignUpModel;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {

    @Inject
    UserServiceLocal userServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {

            SignUpModel signUpModel = new SignUpModel();
            signUpModel.setUsername(request.getParameter("username"));
            signUpModel.setEmail(request.getParameter("email"));
            signUpModel.setPassword(request.getParameter("password"));
            ModelControl modelControl = new ModelControl(userServiceLocal, signUpModel);

            if (modelControl.isValidRegistrationModel()) {
                if (modelControl.usernameOccupied()) {
                    request.setAttribute("message", String.format("Username '%s' is already in use.", signUpModel.getUsername()));
                    RequestDispatcher registerDispatcher = request.getRequestDispatcher(Paths.SIGNUP);
                    registerDispatcher.forward(request, response);

                } else {
                    User user = userServiceLocal.signUp(signUpModel);
                    if (user != null) {
                        RequestDispatcher toLogIn = request.getRequestDispatcher(Paths.TOLOGIN);
                        toLogIn.forward(request, response);
                    } else {
                        RequestDispatcher toSignUp = request.getRequestDispatcher(Paths.SIGNUP);
                        toSignUp.forward(request, response);
                    }
                }
            } else {
                request.setAttribute("message", String.format("No empty fields allowed."));
                RequestDispatcher toSignUp = request.getRequestDispatcher(Paths.SIGNUP);
                toSignUp.forward(request, response);
            }
        } catch (ServletException | IOException e) {
            Logger.getLogger("SIGN UP").log(Level.INFO, e.getMessage());
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }
}
