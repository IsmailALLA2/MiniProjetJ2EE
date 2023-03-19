package com.miniprojet.servlets.users;

import com.miniprojet.beans.Users;
import com.miniprojet.dao.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UsersServlet", value = "/UsersServlet")
public class UsersServlet extends HttpServlet {
    private UsersDao ud;

    @Override
    public void init() throws ServletException {
        ud = new UsersDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String fullName = firstName + " " + lastName;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Boolean rs = ud.save(new Users(fullName,email,password));
        if (rs) {
            response.sendRedirect("/admin/home.jsp");
        } else {
            response.getWriter().print("<script>alert('Error')</script>");
        }
    }
}
