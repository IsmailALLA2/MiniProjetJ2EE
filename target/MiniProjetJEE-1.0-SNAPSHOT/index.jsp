<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.miniprojet.dao.MatchsDao" %>
<%@ page import="com.miniprojet.beans.Matchs" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>

<%
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Soccer &mdash; Website </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icomoon@1.0.0/style.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.3/css/bootstrap.min.css"
          integrity="sha512-oc9+XSs1H243/FRN9Rw62Fn8EtxjEYWHXRvjS43YtueEewbS6ObfXcJNyohjHqVKFPoXXUxwc+q1K7Dee6vv9g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/themes/base/jquery-ui.min.css"
          integrity="sha512-ELV+xyi8IhEApPS/pSj66+Jiw+sOT1Mqkzlh8ExXihe4zfqbWkxPRi8wptXIO9g73FSlhmquFlUOuMSoXz5IRw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
          integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css"
          integrity="sha512-H9jrZiiopUdsLpg94A333EfumgUBpO9MdbxStdeITo+KEIMaNfHNvwyjjDJb+ERPaRS6DpyRlKbvPUasNItRyw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
          integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css"
          integrity="sha512-1cK78a1o+ht2JcaW6g8OXYwqpev9+6GqOkz9xmBN9iUUhIndKtxwILGWYOSibOKjLsEdjyjZvYDq/cZwNeak0w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        <%@include file="css/style.css" %>
    </style>


</head>

<body>

<%!
    MatchsDao md = new MatchsDao();
%>

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>


    <header class="site-navbar py-4" role="banner">

        <div class="container">
            <div class="d-flex align-items-center">
                <div class="site-logo">
                    <a href="/">
                        <img src="assets/logo.png" alt="Logo">
                    </a>
                </div>
                <div class="ml-auto">
                    <nav class="site-navigation position-relative text-right" role="navigation">
                        <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                            <li class="active"><a href="/" class="nav-link">Home</a></li>
                            <li><a href="LoginPage.jsp" class="nav-link">Login</a></li>
                        </ul>
                    </nav>

                    <a href="#"
                       class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right text-white"><span
                            class="icon-menu h3 text-white"></span></a>
                </div>
            </div>
        </div>

    </header>

    <div class="hero overlay" style="background-image: url('assets/bg_3.jpg');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5 ml-auto">
                    <h1 class="text-white">Brazil & Mrocco </h1>
                    <p>Tickets are available in our website</p>
                    <div id="date-countdown"></div>
                    <p>
                        <a href="#" class="btn btn-primary py-3 px-4 mr-3">Book Ticket</a>
                        <a href="#" class="more light">Learn More</a>
                    </p>
                </div>
            </div>
        </div>
    </div>


    <div class="container">


        <div class="row">
            <div class="col-lg-12">

                <div class="d-flex team-vs">
                    <span class="score">4-1</span>
                    <div class="team-1 w-50">
                        <div class="team-details w-100 text-center">
                            <img src="assets/logo_1.png" alt="Image" class="img-fluid">
                            <h3>LA LEGA <span>(win)</span></h3>
                            <ul class="list-unstyled">
                                <li>Anja Landry (7)</li>
                                <li>Eadie Salinas (12)</li>
                                <li>Ashton Allen (10)</li>
                                <li>Baxter Metcalfe (5)</li>
                            </ul>
                        </div>
                    </div>
                    <div class="team-2 w-50">
                        <div class="team-details w-100 text-center">
                            <img src="assets/logo_2.png" alt="Image" class="img-fluid">
                            <h3>JUVENDU <span>(loss)</span></h3>
                            <ul class="list-unstyled">
                                <li>Macauly Green (3)</li>
                                <li>Arham Stark (8)</li>
                                <li>Stephan Murillo (9)</li>
                                <li>Ned Ritter (5)</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="latest-news">
        <div class="container">
            <div class="row">
                <div class="col-12 title-section">
                    <h2 class="heading">Latest News</h2>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-md-4">
                    <div class="post-entry">
                        <a href="#">
                            <img src="assets/img_1.jpg" alt="Image" class="img-fluid">
                        </a>
                        <div class="caption">
                            <div class="caption-inner">
                                <h3 class="mb-3">Romolu to stay at Real Nadrid?</h3>
                                <div class="author d-flex align-items-center">
                                    <div class="img mb-2 mr-3">
                                        <img src="assets/person_1.jpg" alt="">
                                    </div>
                                    <div class="text">
                                        <h4>Mellissa Allison</h4>
                                        <span>May 19, 2020 &bullet; Sports</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="post-entry">
                        <a href="#">
                            <img src="assets/img_3.jpg" alt="Image" class="img-fluid">
                        </a>
                        <div class="caption">
                            <div class="caption-inner">
                                <h3 class="mb-3">Kai Nets Double To Secure Comfortable Away Win</h3>
                                <div class="author d-flex align-items-center">
                                    <div class="img mb-2 mr-3">
                                        <img src="assets/person_1.jpg" alt="">
                                    </div>
                                    <div class="text">
                                        <h4>Mellissa Allison</h4>
                                        <span>May 19, 2020 &bullet; Sports</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="post-entry">
                        <a href="#">
                            <img src="assets/img_2.jpg" alt="Image" class="img-fluid">
                        </a>
                        <div class="caption">
                            <div class="caption-inner">
                                <h3 class="mb-3">Dogba set for Juvendu return?</h3>
                                <div class="author d-flex align-items-center">
                                    <div class="img mb-2 mr-3">
                                        <img src="assets/person_1.jpg" alt="">
                                    </div>
                                    <div class="text">
                                        <h4>Mellissa Allison</h4>
                                        <span>May 19, 2020 &bullet; Sports</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="site-section bg-dark">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="widget-next-match">
                        <div class="widget-title">
                            <h3>Next Match</h3>
                        </div>
                        <div class="widget-body mb-3">
                            <div class="widget-vs">
                                <div class="d-flex align-items-center justify-content-around justify-content-between w-100">
                                    <div class="team-1 text-center">
                                        <img src="assets/logo_1.png" alt="Image">
                                        <h3>Football League</h3>
                                    </div>
                                    <div>
                                        <span class="vs"><span>VS</span></span>
                                    </div>
                                    <div class="team-2 text-center">
                                        <img src="assets/logo_2.png" alt="Image">
                                        <h3>Soccer</h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-center widget-vs-contents mb-4">
                            <h4>World Cup League</h4>
                            <p class="mb-5">
                                <span class="d-block">December 20th, 2020</span>
                                <span class="d-block">9:30 AM GMT+0</span>
                                <strong class="text-primary">New Euro Arena</strong>
                            </p>

                            <div id="date-countdown2" class="pb-1"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">

                    <div class="widget-next-match">
                        <table class="table custom-table">
                            <thead>
                            <tr>
                                <th>P</th>
                                <th>Team</th>
                                <th>W</th>
                                <th>D</th>
                                <th>L</th>
                                <th>PTS</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td><strong class="text-white">Football League</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><strong class="text-white">Soccer</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><strong class="text-white">Juvendo</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><strong class="text-white">French Football League</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td><strong class="text-white">Legia Abante</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td><strong class="text-white">Gliwice League</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td><strong class="text-white">Cornika</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td><strong class="text-white">Gravity Smash</strong></td>
                                <td>22</td>
                                <td>3</td>
                                <td>2</td>
                                <td>140</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div> <!-- .site-section -->

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-6 title-section">
                    <h2 class="heading">Videos</h2>
                </div>
                <div class="col-6 text-right">
                    <div class="custom-nav">
                        <a href="#" class="js-custom-prev-v2"><span class="icon-keyboard_arrow_left"></span></a>
                        <span></span>
                        <a href="#" class="js-custom-next-v2"><span class="icon-keyboard_arrow_right"></span></a>
                    </div>
                </div>
            </div>


            <div class="owl-4-slider owl-carousel">
                <div class="item">
                    <div class="video-media">
                        <img src="assets/img_1.jpg" alt="Image" class="img-fluid">
                        <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center"
                           data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                            <div class="caption">
                                <h3 class="m-0">Dogba set for Juvendu return?</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <div class="video-media">
                        <img src="assets/img_2.jpg" alt="Image" class="img-fluid">
                        <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center"
                           data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                            <div class="caption">
                                <h3 class="m-0">Kai Nets Double To Secure Comfortable Away Win</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <div class="video-media">
                        <img src="assets/img_3.jpg" alt="Image" class="img-fluid">
                        <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center"
                           data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                            <div class="caption">
                                <h3 class="m-0">Romolu to stay at Real Nadrid?</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="item">
                    <div class="video-media">
                        <img src="assets/img_1.jpg" alt="Image" class="img-fluid">
                        <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center"
                           data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                            <div class="caption">
                                <h3 class="m-0">Dogba set for Juvendu return?</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <div class="video-media">
                        <img src="assets/img_2.jpg" alt="Image" class="img-fluid">
                        <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center"
                           data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                            <div class="caption">
                                <h3 class="m-0">Kai Nets Double To Secure Comfortable Away Win</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="item">
                    <div class="video-media">
                        <img src="assets/img_3.jpg" alt="Image" class="img-fluid">
                        <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center"
                           data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                            <div class="caption">
                                <h3 class="m-0">Romolu to stay at Real Nadrid?</h3>
                            </div>
                        </a>
                    </div>
                </div>

            </div>

        </div>
    </div>


    <div class="container site-section">
        <div class="row">
            <div class="col-6 title-section">
                <h2 class="heading">Book Your Ticket Here</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <%
                    Iterator<Matchs> it_matchs = md.getAll().iterator();
                    if (it_matchs.hasNext()) {
                        while (it_matchs.hasNext()) {
                            Matchs match = it_matchs.next();
                %>
                <div class="custom-media d-flex">
                    <div class="img mr-4">
                        <img src="assets/img_1.jpg" alt="Image" class="img-fluid">
                    </div>
                    <div class="text">
                        <span class="meta"><%=SimpleDateFormat.getDateInstance(SimpleDateFormat.LONG, Locale.ENGLISH).format(match.getDate())%></span>
                        <h3 class="mb-4"><a href="/Reservation?id_match=<%=match.getId_match()%>"><%=match.getTeam1()%>
                            VS <%=match.getTeam2()%>
                        </a></h3>
                        <p>Stadium : <%=match.getPlace()%>
                        </p>
                        <p><a href="/Reservation?id_match=<%=match.getId_match()%>">Book Your Ticket </a></p>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <h3>No data</h3>
                <br/>
                <%}%>
            </div>
        </div>
    </div>


    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="widget mb-3">
                        <h3>News</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">All</a></li>
                            <li><a href="#">Club News</a></li>
                            <li><a href="#">Media Center</a></li>
                            <li><a href="#">Video</a></li>
                            <li><a href="#">RSS</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="widget mb-3">
                        <h3>Tickets</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Online Ticket</a></li>
                            <li><a href="#">Payment and Prices</a></li>
                            <li><a href="#">Contact &amp; Booking</a></li>
                            <li><a href="#">Tickets</a></li>
                            <li><a href="#">Coupon</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="widget mb-3">
                        <h3>Matches</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Standings</a></li>
                            <li><a href="#">World Cup</a></li>
                            <li><a href="#">La Lega</a></li>
                            <li><a href="#">Hyper Cup</a></li>
                            <li><a href="#">World League</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="widget mb-3">
                        <h3>Social</h3>
                        <ul class="list-unstyled links">
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">Youtube</a></li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="row text-center">
                <div class="col-md-12">
                    <div class=" pt-5">
                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                            This project is made with<i class="icon-heart" aria-hidden="true"></i> by <a
                                href="https://colorlib.com" target="_blank">ESTE Students</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </footer>


</div>
<!-- .site-wrap -->
<script src="https://cdn.jsdelivr.net/npm/icomoon@1.0.0/demo-files/demo.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"
        integrity="sha512-KgffulL3mxrOsDicgQWA11O6q6oKeWcV00VxgfJw4TcM8XRQT8Df9EsrYxDf7tpVpfl3qcYD96BpyPvA4d1FDQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"
        integrity="sha512-57oZ/vW8ANMjR/KQ6Be9v/+/h6bq9/l3f0Oc7vn6qMqyhvPd1cvKBRWWpzu0QoneImqr2SkmO4MSqU+RpHom3Q=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"
        integrity="sha512-6UofPqm0QupIL0kzS/UIzekR73/luZdC6i/kXDbWnLOJoqwklBK6519iUnShaYceJ0y4FaiPtX/hRnV/X/xlUQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.3/js/bootstrap.min.js"
        integrity="sha512-8qmis31OQi6hIRgvkht0s6mCOittjMa9GMqtK9hes5iEQBQE/Ca6yGE5FsW36vyipGoWQswBj/QBm2JR086Rkw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stellar.js/0.6.2/jquery.stellar.min.js"
        integrity="sha512-PNXCBnFH9wShbV+mYnrfo0Gf3iSREgBWmYAoMIfc+Z83vVq3Nu4yxBk6j+BZ40ZIhtW3WlTQdBvW3AYLAnlgpA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.countdown/2.2.0/jquery.countdown.min.js"
        integrity="sha512-lteuRD+aUENrZPTXWFRPTBcDDxIGWe5uu0apPEn+3ZKYDwDaEErIK9rvR0QzUGmUQ55KFE2RqGTVoZsKctGMVw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
        integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"
        integrity="sha512-0QbL0ph8Tc8g5bLhfVzSqxe9GERORsKhIn1IrpxDAgUsbBGz/V7iSav2zzW325XGd1OMLdL4UiqRJj702IeqnQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"
        integrity="sha512-A7AYk1fGKX6S2SsHywmPkrnzTZHrgiVT7GcQkLGDe2ev0aWb8zejytzS8wjo7PGEXKqJOrjQ4oORtnimIRZBtw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"
        integrity="sha512-uURl+ZXMBrF4AwGaWmEetzrd+J5/8NRkWAvJx5sbPSSuOb0bZLqf+tOzniObO00BjHa/dD7gub9oCGMLPQHtQA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.sticky/1.0.4/jquery.sticky.js"
        integrity="sha512-p+GPBTyASypE++3Y4cKuBpCA8coQBL6xEDG01kmv4pPkgjKFaJlRglGpCM2OsuI14s4oE7LInjcL5eAUVZmKAQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.3.9/jquery.mb.YTPlayer.min.js"
        integrity="sha512-rVFx7vXgVV8cmgG7RsZNQ68CNBZ7GL3xTYl6GAVgl3iQiSwtuDjTeE1GESgPSCwkEn/ijFJyslZ1uzbN3smwYg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>
    <%@include file="js/main.js" %>
</script>

</body>

</html>