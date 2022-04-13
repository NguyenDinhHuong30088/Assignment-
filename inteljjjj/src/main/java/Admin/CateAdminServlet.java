/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import DTO.Category;
import DTO.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CateAdminServlet", urlPatterns = {"/CateAdminServlet"})
public class CateAdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         String action = request.getParameter("action");
        String cast_id = request.getParameter("mid");
        if (action.equals("delete")) {
          DAO.Admin.DeleteCate(Integer.parseInt(cast_id));
           response.sendRedirect("CatePages.jsp");
        } else if (action.equals("details")) {
            Category category = DAO.CategoryDAO.getCategory(Integer.parseInt(cast_id));
            request.setAttribute("cate", category);
            request.getRequestDispatcher("updatecate.jsp").forward(request, response); //at last line     
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                processRequest(request, response);
                   response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8"); 
              String btn_add = request.getParameter("Add");
              String btn_update = request.getParameter("update");
              String name = request.getParameter("name");
              if(btn_add != null){
                  Category category = new Category(0, name);
                  DAO.Admin.addCate(category);
                  response.sendRedirect("CatePages.jsp");
              }else if(btn_update != null){
                  String id = request.getParameter("id");
                  DAO.Admin.updateCate(Integer.parseInt(id), name);
                 response.sendRedirect("CatePages.jsp");
              }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
