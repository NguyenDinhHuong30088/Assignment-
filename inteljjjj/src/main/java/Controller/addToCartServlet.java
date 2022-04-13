/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import DTO.OrderDetail;
import DTO.Product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "addToCartServlet", urlPatterns = {"/addToCartServlet"})
public class addToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         processRequest(request, response);
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product p = DAO.ProductDAO.getProductByID(productID);
        HttpSession session = request.getSession();
        int currentUserID = -1;
        try {
            currentUserID = Integer.parseInt(session.getAttribute("currentUserID").toString());
        } catch (Exception e) {
             
        }
        int cartID = DAO.OrderDAO.getOrderIDByUserID(currentUserID);
        System.out.println(cartID);
        if (cartID == 0) {
            DAO.OrderDAO.addNewOrder(currentUserID);
            cartID = DAO.OrderDAO.getOrderIDByUserID(currentUserID);
        }
        OrderDetail detail = new OrderDetail();
        detail.setOrderID(cartID);
        detail.setPrice(p.getPrice());
        detail.setProductID(productID);
        detail.setQuantity(quantity);
        DAO.OrderDetailDAO.addOrderDetail(detail);
        response.sendRedirect("./cart.jsp");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
