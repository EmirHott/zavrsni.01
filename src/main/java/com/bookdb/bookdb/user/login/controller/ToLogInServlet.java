package com.bookdb.bookdb.user.login.controller;

import com.bookdb.bookdb.paths.Paths;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ToLogInServlet", value = "/ToLogInServlet")
public class ToLogInServlet extends HttpServlet {

    private void processRequest (HttpServletRequest request, HttpServletResponse response) {
        try{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.LOGIN);
        requestDispatcher.forward(request,response);
        }catch (ServletException | IOException e){
            Logger.getLogger("TO LOGIN").log(Level.INFO, e.getMessage());
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
