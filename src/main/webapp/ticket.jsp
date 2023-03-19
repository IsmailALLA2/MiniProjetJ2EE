<%@ page import="com.miniprojet.beans.Ticket" %>
<%@ page import="com.miniprojet.beans.Reservation" %>
<%@ page import="com.miniprojet.beans.Matchs" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(session.getAttribute("ticket") == null ){
        response.sendRedirect("/");
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        body {
            background-color: slategray;
        }

        .ticket {
            font-family: sans-serif;

            background-repeat: no-repeat;
            background-position: top;
            background-size: 100%;
            background-color: #04030C;
            width: 700px;
            height: 300px;
            border-radius: 15px;
            -webkit-filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            display: block;
            margin: 10% auto auto auto;
            color: #fff;;
        }

        .date {
            margin: 15px;
            -webkit-filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
        }

        .date .day {
            font-size: 80px;
            float: left;
        }

        .date .month-and-time {
            float: left;
            margin: 15px 0 0 0;
            font-weight: bold;
        }

        .artist {
            font-size: 30px;
            margin: 10px 100px 0 40px;
            float: left;
            font-weight: bold;
            -webkit-filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
        }

        .location {
            float: left;
            margin: 230px 0 0 90px;
            margin-left: -390px;
            font-size: 30px;
            font-weight: bold;
            -webkit-filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
        }

        .location::before {
            background-size: 110px 110px;
            width: 110px;
            height: 110px;
            content: "";
            display: inline-block;
            float: left;
            position: absolute;
            left: -56px;
            bottom: 5px;
            -webkit-filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
        }

        .rip {
            border-right: 8px dotted #436ea5;
            height: 300px;
            position: absolute;
            top: 0;
            left: 530px;
        }

        .cta .buy {
            position: absolute;
            top: 135px;
            right: 15px;
            display: block;
            font-size: 12px;
            font-weight: bold;
            background-color: #436ea5;
            padding: 10px 20px;
            border-radius: 25px;
            color: #fff;
            text-decoration: none;
            -webkit-transform: rotate(-90deg);
            -ms-transform: rotate(-90deg);
            transform: rotate(-90deg);
            -webkit-filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
            filter: drop-shadow(1px 1px 3px rgba(0, 0, 0, 0.3));
        }

        .small {
            font-weight: 200;
        }

        .ticket-1 {
            background-image: url(https://www.shutterstock.com/image-illustration/blueorange-soccer-ball-blue-rotating-260nw-1765582157.jpg);
        }


    </style>

</head>
<body>
<%!
    Ticket ticket ;
    Reservation reservation;
    Matchs match;
%>


<%
    ticket = (Ticket) session.getAttribute("ticket");
    reservation = (Reservation) session.getAttribute("resDetais");
    match = (Matchs) session.getAttribute("match");

%>
<div class="ticket ticket-1">
    <div class="date">
        <span class="day"><%=new SimpleDateFormat("EEEE").format(match.getDate().getTime())%></span>
        <span class="month-and-time"><%= new SimpleDateFormat("MMM").format(match.getDate()) %> </br><span class="small"><%=new SimpleDateFormat("h a").format(match.getDate())%></span></span>
    </div>

    <div class="artist">
        <span class="name"><%=reservation.getName()%></span>
        </br>
        <span class="live small"><%=ticket.getType()%></span>
    </div>

    <div class="location">
        <span>Stadium : <%=match.getPlace()%></span>
        </br>
    </div>

    <div class="rip">
    </div>

    <div class="cta">
        <button class="buy" href="#">GRAB A TICKET</button>
    </div>

</div>
</body>
</html>
