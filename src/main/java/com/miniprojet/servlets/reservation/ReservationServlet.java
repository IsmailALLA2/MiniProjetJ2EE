package com.miniprojet.servlets.reservation;

import com.miniprojet.beans.Reservation;
import com.miniprojet.dao.ReservationDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ReservationServlet", value = "/ReservationServlet")
public class ReservationServlet extends HttpServlet {

    private ReservationDao rsd;


    @Override
    public void init() throws ServletException {
        rsd = new ReservationDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));
        String details = request.getParameter("details");
        int ticket_id = Integer.parseInt(request.getParameter("ticket_id"));
        Reservation reservation = new Reservation(name,phone,email,age,details,ticket_id);
        Boolean res = rsd.save(reservation);
        if (res){
            session.setAttribute("ticket",ticket_id);
            session.removeAttribute("errorMessage");
        }else{
            session.setAttribute("errorMessage","Something went wrong");

        }
    }
}
