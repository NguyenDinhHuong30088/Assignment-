<%-- 
    Document   : home
    Created on : Mar 7, 2022, 1:34:28 PM
    Author     : crrtt
--%>

<%@page import="DTO.OrderDetail"%>
<%@page import="DTO.User"%>
<%@page import="DTO.Product"%>
<%@page import="DTO.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Food Template">
        <meta name="keywords" content="Food, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Food</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

        <%
            ArrayList<Product> products = DAO.ProductDAO.getAllProduct();
            ArrayList<Category> categorys = DAO.CategoryDAO.getAllCategory();
            String currentUserID = "";
            try {
                currentUserID = session.getAttribute("currentUserID").toString();
            } catch (Exception e) {
            }
            User currentUser = new User();
            if (!currentUserID.isEmpty()) {
                currentUser = DAO.UserDAO.getUserByID(Integer.parseInt(currentUserID));
            }
            int cartID = DAO.OrderDAO.getOrderIDByUserID(currentUser.getUserID());
            ArrayList<OrderDetail> cartDetail = DAO.OrderDetailDAO.getOrderDetailByOrderID(cartID);
            float totalPrice = 0;
        %>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> ogani@gmail.com</li>
                                    <li>Free Shipping for all Order of $99</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__auth">
                                    <a href="./login.jsp">
                                        <% if (currentUser.getUserID() == 0) {
                                        %>
                                        <i class="fa fa-user"></i>Login
                                        <%
                                        } else {
                                        %>
                                        <i class="fa fa-user"></i><%= currentUser.getFullName()%>
                                        <a href="./logoutServlet">Logout</a>
                                        <%
                                            }
                                        %>

                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                          <a class="navbar-brand" href="home.jsp">
                            <span>
                              Food
                            </span>
                        </a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="./home.jsp">Home</a></li>
                                <li><a href="./contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <ul>
                                <li><a href="./cart.jsp"><i class="fa fa-shopping-bag"></i> <span><%= cartDetail.size()%></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>All departments</span>
                            </div>
                            <ul>
                                <%
                                    for (Category c : categorys) {

                                %>
                                <li><a href="#"><%= c.getCategoryName()%></a></li>
                                    <%                                    }
                                    %>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9">

                        <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                            <div class="hero__text">
<!--                                <span>FRUIT FRESH</span>
                                <h2>Vegetable <br />100% Organic</h2>
                                <p>Free Pickup and Delivery Available</p>
                                <a href="#" class="primary-btn">SHOP NOW</a>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Section Begin -->
        <section class="featured spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Our Product</h2>
                        </div>
                        <div class="featured__controls">
                            <ul>
                                <li class="active" data-filter="*">All</li>
                                    <%               for (Category c : categorys) {
                                    %>
                                <li data-filter=".c<%= c.getCategoryID()%>"><%= c.getCategoryName()%></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </div>
                    </div>

                    <div class="hero__search__form" style="margin: auto">
                        <form action="#">
                            <input id="search" name="search" type="text" placeholder="What do you need?">
                            <button onclick="" class="site-btn">CLEAR SEARCH</button>
                        </form>
                    </div>

                    <%
                        String search_value = request.getParameter("search");
                    %>

                </div>
                <div class="row featured__filter">

                    <%
                        if (search_value != null) {
                            for (Product p : products) {
                                if (p.getProductName().toLowerCase().contains(search_value.toLowerCase())) {
                    %>

                    <a href="./detail.jsp?productID=<%= p.getProductID()%>">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix c<%= p.getCategoryID()%>">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="<%= p.getImage()%>">
                                    <ul class="featured__item__pic__hover">
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="./detail.jsp?productID=<%= p.getProductID()%>"><%= p.getProductName()%></a></h6>
                                    <h5>$<%= p.getPrice()%></h5>
                                </div>
                            </div>
                        </div>
                    </a>

                    <%
                            }
                        }
                    } else {

                        for (Product p : products) {
                    %>

                    <a href="./detail.jsp?productID=<%= p.getProductID()%>">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix c<%= p.getCategoryID()%>">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="<%= p.getImage()%>">
                                    <ul class="featured__item__pic__hover">
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="./detail.jsp?productID=<%= p.getProductID()%>"><%= p.getProductName()%></a></h6>
                                    <h5>$<%= p.getPrice()%></h5>
                                </div>
                            </div>
                        </div>
                    </a>

                    <%
                            }
                        }
                    %>






                </div>
            </div>
        </section>
        <!-- Featured Section End -->

        <!-- Banner Begin -->
        <div class="banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <!--<img src="img/banner/banner-1.jpg" alt="">-->
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <!--<img src="img/banner/banner-2.jpg" alt="">-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner End -->



        <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                  <a class="navbar-brand" href="home.jsp">
                            <span>
                              Food
                            </span>
                        </a>
                            </div>
                            <ul>
                                <li>Address: 60-49 Road 11378 New York</li>
                                <li>Phone: +65 11.188.888</li>
                                <li>Email: hello@colorlib.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">
                            <h6>Useful Links</h6>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">About Our Shop</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                                <li><a href="#">Delivery infomation</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Who We Are</a></li>
                                <li><a href="#">Our Services</a></li>
                                <li><a href="#">Projects</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Innovation</a></li>
                                <li><a href="#">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright">
                            <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                            <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
