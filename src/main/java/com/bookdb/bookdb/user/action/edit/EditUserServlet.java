package com.bookdb.bookdb.user.action.edit;

import com.bookdb.bookdb.ejb.user.entity.User;
import com.bookdb.bookdb.ejb.user.privilege.entity.Privilege;
import com.bookdb.bookdb.ejb.user.privilege.service.PrivilegeServiceLocal;
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

@WebServlet(name = "EditUserServlet", value = "/EditUserServlet")
public class EditUserServlet extends HttpServlet {

    @Inject
    private UserServiceLocal userServiceLocal;
    @Inject
    private PrivilegeServiceLocal privilegeServiceLocal;

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        Integer privilegeId = Integer.parseInt(request.getParameter("privilegeradio"));
        Integer userId = Integer.parseInt(request.getParameter("userid"));

        try {
            User editedUser = userServiceLocal.find(userId);
            Privilege privilege = privilegeServiceLocal.find(privilegeId);

            editedUser.setUsername(request.getParameter("username"));
            editedUser.setUserEmail(request.getParameter("email"));
            editedUser.setPrivilegeId(privilege);
            userServiceLocal.edit(editedUser);




            RequestDispatcher requestDispatcher = request.getRequestDispatcher(Paths.USERSERVLET);
            requestDispatcher.forward(request, response);

        } catch (ServletException | IOException e) {
            Logger.getLogger("EDIT SERVLET").log(Level.INFO, e.getMessage());

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
