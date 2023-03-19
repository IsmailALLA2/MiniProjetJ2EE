<%@ page import="java.util.ArrayList" %>
<%@ page import="com.miniprojet.beans.Ticket" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        <%@include file="css/reservation.css" %>
    </style>
</head>
<body>
<%!
    Ticket regularTicket;
    Ticket premiumTicket;
    Ticket vipTicket;
%>

<%
    ArrayList<Ticket> tickets = (ArrayList<Ticket>) session.getAttribute("tickets");
    Iterator<Ticket> it_tickets = tickets.iterator();
    while (it_tickets.hasNext()) {
        Ticket t = it_tickets.next();
        switch (t.getType()) {
            case "reqular":
                regularTicket = t;
                break;
            case "premium":
                premiumTicket = t;
                break;
            case "vip":
                vipTicket = t;
                break;
        }

    }

%>


<div class="booking-form-w3layouts">
    <form action="/Reservation" method="post">
        <h3 class="sub-heading-agileits">Personal Details</h3>
        <div class="main-flex-w3ls-sectns">
            <div class="field-agileinfo-spc form-w3-agile-text1">
                <input type="text" name="name" placeholder="Full Name" required>
            </div>
            <div class="field-agileinfo-spc form-w3-agile-text2">
                <input type="text" name="phone" placeholder="Phone Number" required>
            </div>
        </div>
        <div class="field-agileinfo-spc form-w3-agile-text">
            <input type="email" name="email" placeholder="Email" required="">
        </div>
        <h2 class="sub-heading-agileits">Booking Details</h2>
        <div class="main-flex-w3ls-sectns">
            <div class="field-agileinfo-spc form-w3-agile-text1">

            </div>
            <div class="field-agileinfo-spc form-w3-agile-text2">

            </div>
        </div>
        <div class="main-flex-w3ls-sectns">
            <div class="field-agileinfo-spc form-w3-agile-text1">

            </div>
            <%--  <div class="field-agileinfo-spc form-w3-agile-text2">
                  <select class="form-control">
              </div>--%>
        </div>
        <div class="main-flex-w3ls-sectns">
            <div class="field-agileinfo-spc form-w3-agile-text1">

            </div>
            <div class="field-agileinfo-spc form-w3-agile-text2">

            </div>
        </div>

        <div class="triple-wthree">
            <div class="field-agileinfo-spc form-w3-agile-text11">
                <select name="age" class="form-control">
                    <option value="">Adult(12+ Yrs)</option>
                    <option value="1">18</option>
                    <option value="2">19</option>
                    <option value="3">20</option>
                    <option value="5">21+</option>
                </select>
            </div>
            <div class="field-agileinfo-spc form-w3-agile-text22">


            </div>
            <div class="field-agileinfo-spc form-w3-agile-text33">

            </div>
        </div>
        <div class="radio-section">
            <h6>Select your Seat</h6>
            <ul class="radio-buttons-w3-agileits">
                <%
                    if (regularTicket != null && regularTicket.getQte() >0  ) {%>
                <li>
                    <input value="regular" type="radio" id="a-option" name="type">
                    <label for="a-option">Regular Ticket</label>
                    <div class="check"></div>
                </li>
                <%}
                    if (premiumTicket != null  && premiumTicket.getQte() >0){
                %>
                <li>
                    <input value="premium" type="radio" id="b-option" name="type">
                    <label for="b-option">Premium Ticket </label>
                    <div class="check">
                        <div class="inside"></div>
                    </div>
                </li>
                <%
                    }
                    if (vipTicket != null && vipTicket.getQte()>0){
                %>
                <li>
                    <input value="vip" type="radio" id="c-option" name="type">
                    <label for="a-option">VIP Ticket</label>
                    <div class="check"></div>
                </li>
                <%}%>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="main-flex-w3ls-sectns">
            <div class="field-agileinfo-spc form-w3-agile-text1">

            </div>
            <div class="field-agileinfo-spc form-w3-agile-text2">

            </div>
        </div>
        <div class="field-agileinfo-spc form-w3-agile-text">
            <textarea name="details" placeholder="Any Message..."></textarea>
        </div>

        <div class="clear"></div>
        <input type="submit" value="Reserve">
        <input type="reset" value="Clear Form">
        <div class="clear"></div>
    </form>
</div>

</body>
</html>