package com.miniprojet.servlets.matchs;

import com.miniprojet.beans.Matchs;
import com.miniprojet.dao.MatchsDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "MatchsServlet", value = "/MatchsServlet")
public class MatchsServlet extends HttpServlet {
    private MatchsDao md;

    @Override
    public void init() throws ServletException {
        md = new MatchsDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String team1 = request.getParameter("team1");
        String team2 = request.getParameter("team2");
        String place = request.getParameter("place");
        java.util.Date datetime;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        try {
            datetime = formatter.parse(request.getParameter("date"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Date date = new Date(datetime.getTime());
        Boolean rs = md.save(new Matchs(date, place, team1, team2));
        if (rs) {
            response.sendRedirect("/admin/home.jsp");
        } else {
            response.getWriter().print("<script>alert('Error')</script>");
        }

    }
}
