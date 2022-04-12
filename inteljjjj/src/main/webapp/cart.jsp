<%-- 
    Document   : home
    Created on : Mar 7, 2022, 1:34:28 PM
    Author     : crrtt
--%>

<%@page import="DTO.OrderDetail"%>
<%@page import="DTO.Order"%>
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
                                        <%                                            if (currentUser.getUserID() == 0) {
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
                                <li><a href="./home.jsp">Home</a></li>
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

        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <%
                                        for (OrderDetail detail : cartDetail) {
                                            Product p = DAO.ProductDAO.getProductByID(detail.getProductID());

                                    %>
                                <form action="updateCartServlet" method="POST">
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img src="<%= p.getImage()%>" alt="" style="width: 100px; height: 100px">
                                            <h5><%= p.getProductName()%></h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                            $<%= p.getPrice()%>
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">

                                                <div class="pro-qty">

                                                    <input type="text" name="quantity" value="<%= detail.getQuantity()%>">
                                                </div>
                                        </td>
                                        <td class="shoping__cart__total">
                                            $<%= p.getPrice() * detail.getQuantity()%>
                                            <%
                                                totalPrice += p.getPrice() * detail.getQuantity();
                                            %>
                                        </td>
                                        <td class="shoping__cart__item__close">
                                            <a href="./deleteFromCartServlet?detailID=<%= detail.getDetailID()%>"><span class="icon_close"></span></a>
                                        </td>
                                        <td class="shoping__cart__item__close">
                                            <input style="display: none" type="text" name="detailID" value="<%= detail.getDetailID()%>">
                                            <button type="submit" class="btn icon_check" style="padding-bottom: 13px"></button>
                                        </td>
                                    </tr>
                                </form>
                                <%

                                    }
                                %>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a style="display: none" href="" class="primary-btn cart-btn">UPDATE QUANTITY</a>
                            <a href="./clearCartServlet?orderID=<%= cartID%>" class="primary-btn cart-btn cart-btn-right">CLEAR CART</a>
                        </div>
                    </div>
                    <div class="col-lg-6">

                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <li>Subtotal <span>$<%= totalPrice%></span></li>
                                <li>Total <span>$<%= totalPrice%></span></li>
                            </ul>
                            <a href="./checkOutServlet?orderID=<%= cartID%>&totalPrice=<%= totalPrice%>" class="primary-btn">CHECK OUT</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


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
