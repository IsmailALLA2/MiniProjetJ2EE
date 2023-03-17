package com.miniprojet.servlets;

import com.miniprojet.beans.Users;
import com.miniprojet.dao.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UsersDao usersDao;


    @Override
    public void init(){
        usersDao = new UsersDao();
    }



    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println("okkkkkkkkk<sfnjdbqkjdbfhqjkdfbhqdfbqhjfdbqjhdfbqhfdbq");
        String password = request.getParameter("password");
        Users user = usersDao.isUserExist(email,password);
        if(user != null){
            request.setAttribute("user",user);
        }else {
            request.setAttribute("errorMessage","Wrong email or password ");
        }
        response.setStatus(200);
        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);

    }
}
