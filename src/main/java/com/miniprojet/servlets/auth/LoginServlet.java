package com.miniprojet.servlets.auth;

import com.miniprojet.beans.Users;
import com.miniprojet.dao.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/Login")
public class LoginServlet extends HttpServlet {
    private UsersDao usersDao;


    @Override
    public void init(){
        usersDao = new UsersDao();
    }



    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Users user = usersDao.isUserExist(email,password);
        if(user != null){
            session.setAttribute("user",user);
            session.removeAttribute("errorMessage");
        }else {
            session.setAttribute("errorMessage","Wrong email or password ");
        }
        response.setStatus(200);
        response.sendRedirect("/test.jsp");

    }
}
