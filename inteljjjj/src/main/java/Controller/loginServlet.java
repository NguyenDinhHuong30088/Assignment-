/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import DTO.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author crrtt
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
           response.setContentType("text/html;charset=UTF-8");
        String userID = request.getParameter("Email");
        String password = request.getParameter("password").trim();
        HttpSession session = request.getSession();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        User user = new User();
        try{
              user  = DAO.UserDAO.login(userID, password);
        }catch(Exception e){
            
        }
        System.out.println(user);
        if (user != null) {
            if(user.getRoleID() == 2){
             String data = "login_success|id:" + user.getUserID() + "|time:" + dtf.format(now);
            Controller.Log.writeFile(data);
            session.removeAttribute("loginError");
            session.setAttribute("currentUserID", user.getUserID());
            session.setAttribute("email", user.getMail());
            response.sendRedirect("./home.jsp");
            }else{
             String data = "login_success|id:" + user.getUserID() + "|time:" + dtf.format(now) + " Admin";
            Controller.Log.writeFile(data);
            session.removeAttribute("loginError");
            session.setAttribute("currentUserID", user.getUserID());
            response.sendRedirect("./AdminPage.jsp");
        }
           
        } else {
            String data = "login_failed|id:" + userID + "|time:" + dtf.format(now);
            Controller.Log.writeFile(data);
            session.setAttribute("loginError", "UserID or password is incorrect");
            response.sendRedirect("./login.jsp");
        }
        processRequest(request, response);
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
