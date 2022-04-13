/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import DTO.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;
import javax.servlet.ServletException;
import static javax.servlet.SessionTrackingMode.URL;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String birthDay = request.getParameter("birthDay");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        HttpSession session = request.getSession();
        String authkey = "3763646c3058373530393938";
        String mobiles = phone;
        Random rand = new Random();
        int otp = rand.nextInt(900000) + 100000;
        session.setAttribute("otp", otp);
        String senderId = "rajOTP";
        String message = "Your OTP is " + otp;
        System.out.println("####OTP" + otp + ":::MOB:::" + mobiles);
//define route
        String route = "4";
//Prepare Url
        URLConnection myURLConnection = null;
        URL myURL = null;
        BufferedReader reader = null;
//encoding message 
        String encoded_message = URLEncoder.encode(message);
//Send SMS API
        String mainUrl = "http://api.msg91.com/api/sendhttp.php?";
//Prepare parameter string 
        StringBuilder sbPostData= new StringBuilder(mainUrl);
            sbPostData.append("authkey="+authkey);
            sbPostData.append("&mobiles="+mobiles);
            sbPostData.append("&message="+encoded_message);
            sbPostData.append("&route="+route);
            sbPostData.append("&sender="+senderId);
//final string
        mainUrl = sbPostData.toString();
        System.out.println("####URL" + mainUrl);
        try {
//prepare connection
          //prepare connection
                myURL = new URL(mainUrl);
                myURLConnection = myURL.openConnection();
                myURLConnection.connect();
                reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
                //reading response
                String response1;
                while ((response1 = reader.readLine()) != null)
                //print response
                System.out.println(response);

                //finally close connection
                reader.close();
        }catch(Exception e){
            System.out.println("loi : " + e);
        }
            User u = new User();
            u.setFullName(fullName);
            u.setPassword(password);
            u.setRoleID(2);
            u.setAddress(address);
            u.setBirthday(birthDay);
            u.setPhone(phone);
            u.setMail(mail);
            u.setStatus(1);
            DAO.UserDAO.addNewUser(u);
            response.sendRedirect("./login.jsp");
            processRequest(request, response);
        }

        @Override
        public String getServletInfo
        
        
            () {
        return "Short description";
        }// </editor-fold>

    }
