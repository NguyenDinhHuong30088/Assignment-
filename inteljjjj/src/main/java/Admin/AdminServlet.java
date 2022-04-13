/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import DTO.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
           response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8"); 
        String action = request.getParameter("action");
        String cast_id = request.getParameter("mid");
        if (action.equals("delete")) {
            String status = request.getParameter("status");
            DAO.Admin.DeleteProduct(Integer.parseInt(cast_id),Integer.parseInt(status));
           response.sendRedirect("AdminPage.jsp");
        } else if (action.equals("details")) {
            Product prodcut = DAO.ProductDAO.getProductByID(Integer.parseInt(cast_id));
            request.setAttribute("product", prodcut);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response); //at last line     
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8"); 
        String btn_add = request.getParameter("Add");
        String btn_update = request.getParameter("Update");
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String categoryID = request.getParameter("cate");
        String usingDate = request.getParameter("usingDate");
        String des = request.getParameter("Des");
        if (btn_add != null) {       
            Product product = new Product();
            product.setProductName(name);
            product.setImage(img);
            product.setPrice(Float.parseFloat(price));
            product.setQuantity(Integer.parseInt(quantity));
            product.setCategoryID(Integer.parseInt(categoryID));
            product.setImportDate(java.time.LocalDate.now().toString());
            product.setUsingDate(usingDate);
            product.setDes(des);
            product.setStatus(1);
            DAO.Admin.addProduct(product);
            response.sendRedirect("AdminPage.jsp");
        } else if (btn_update != null) {
             String dayimport = request.getParameter("importday");
             String id = request.getParameter("id");
            Product product = new Product();
            product.setProductName(name);
             product.setProductID(Integer.parseInt(id));
            product.setImportDate(dayimport);
            product.setImportDate(usingDate);
            product.setImage(img);
            product.setPrice(Float.parseFloat(price));
            product.setQuantity(Integer.parseInt(quantity));
            product.setCategoryID(Integer.parseInt(categoryID));
            product.setImportDate(java.time.LocalDate.now().toString());
            product.setUsingDate(usingDate);
            product.setStatus(1);
            DAO.Admin.updateProduct(product);
            response.sendRedirect("AdminPage.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
