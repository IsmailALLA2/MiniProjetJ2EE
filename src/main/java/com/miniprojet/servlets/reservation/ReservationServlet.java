package com.miniprojet.servlets.reservation;

import com.miniprojet.beans.Matchs;
import com.miniprojet.beans.Reservation;
import com.miniprojet.beans.Ticket;
import com.miniprojet.dao.MatchsDao;
import com.miniprojet.dao.ReservationDao;
import com.miniprojet.dao.TicketDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ReservationServlet", value = "/Reservation")
public class ReservationServlet extends HttpServlet {

    private ReservationDao rsd;
    private TicketDao td;
    private MatchsDao md;


    @Override
    public void init() throws ServletException {
        rsd = new ReservationDao();
        td = new TicketDao();
        md = new MatchsDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id_match = Integer.parseInt(req.getParameter("id_match"));
        TicketDao td = new TicketDao();
        ArrayList<Ticket> tickets = td.getTicketByMatchId(id_match);
        if (tickets.size() > 0) {
            session.setAttribute("match_id",id_match);
            session.setAttribute("tickets", tickets);
            resp.sendRedirect("/ReservationPage.jsp");
        }else {
            session.removeAttribute("match_id");
            resp.sendRedirect("/");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String type = request.getParameter("type");
        String details = request.getParameter("details");
        int age = Integer.parseInt(request.getParameter("age"));
        int match_id = (int) session.getAttribute("match_id");
        Ticket ticket = td.getTicketByMatchIdAndType(match_id,type);
        Reservation reservation = new Reservation(name, phone, email, age, details, ticket.getId_ticket());
        Matchs match = md.getById(match_id);
        Boolean res = rsd.save(reservation);
        if (res) {
            session.setAttribute("ticket", ticket);
            session.setAttribute("resDetais",reservation);
            session.setAttribute("match",match);
            session.removeAttribute("errorMessage");
            response.sendRedirect("/ticket.jsp");
        } else {
            session.setAttribute("errorMessage", "Something went wrong");
            response.sendRedirect("/");
        }
    }
}
