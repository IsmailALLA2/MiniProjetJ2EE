package com.miniprojet.servlets.auth;

import com.miniprojet.beans.Users;
import com.miniprojet.dao.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;


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
            response.sendRedirect("/admin/home.jsp");
        }else {
            session.setAttribute("errorMessage","Wrong email or password ");
            response.sendRedirect("/loginPage.jsp");
        }


    }
}
