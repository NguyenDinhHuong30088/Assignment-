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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "checkOutServlet", urlPatterns = {"/checkOutServlet"})
public class checkOutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet checkOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkOutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));
        ArrayList<OrderDetail> details = DAO.OrderDetailDAO.getOrderDetailByOrderID(orderID);
        int quantity = 0;
        boolean check = false;
        for (OrderDetail orderDetail : details) {
            Product products = DAO.ProductDAO.getProductByID(orderDetail.getProductID());
            if (orderDetail.getProductID() == products.getProductID()) {
                quantity = products.getQuantity() - orderDetail.getQuantity();
                if (quantity < 0) {
                    check = true;
                    break;
                } else {
                    DAO.ProductDAO.updateQuantity(products.getProductID(), quantity);
                }

            }

        }
        if (check) {
              response.sendRedirect("./cart.jsp");
              processRequest(request, response);
        } else {
            DAO.OrderDAO.checkOut(orderID, totalPrice);
            HttpSession session = request.getSession();
           // sendmail.SendMail.sendmail(session.getAttribute("email").toString());
            response.sendRedirect("./cart.jsp");
            processRequest(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
