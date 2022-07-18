package com.bookdb.bookdb.user.logout;

import com.bookdb.bookdb.paths.Paths;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LogOutServlet", value = "/LogOutServlet")
public class LogOutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response){
       try {
           HttpSession session = request.getSession();
           response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
           response.setHeader("Pragma", "no-cache");
           response.setHeader("Expires","0");
           session.invalidate();
           RequestDispatcher toLogIn = request.getRequestDispatcher(Paths.TOLOGIN);
           toLogIn.forward(request, response);
       }catch (ServletException | IOException e){
           Logger.getLogger("LOGOUT SESSION").log(Level.INFO, e.getMessage());
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
