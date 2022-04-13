/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    public static ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblusers");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserID(rs.getInt("userID"));
                u.setFullName(rs.getString("fullName"));
                u.setPassword(rs.getString("password"));
                u.setRoleID(rs.getInt("roleID"));
                u.setAddress(rs.getString("address"));
                u.setBirthday(rs.getString("birthday"));
                u.setPhone(rs.getString("phone"));
                u.setMail(rs.getString("mail"));
                u.setStatus(rs.getInt("status"));
                list.add(u);
            }
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi get User :" + e);
        }
        return list;
    }

    public static User login(String Email, String password) {
       User user = new User();
        ArrayList<User> users = getAllUser();
        for (User u : users) {
            if (u.getMail().trim().equals(Email)  && u.getPassword().trim().equals(password)) {
               user = u;
               return user;
            }
        }
        return null;
    }

    public static User getUserByID(int userID) {
        ArrayList<User> users = getAllUser();
        for (User u : users) {
            if (u.getUserID() == userID) {
                return u;
            }
        }
        return null;
    }

    public static void addNewUser(User u) {
        try {
            Connection conn = DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblusers values (0,?,?,?,?,?,?,?,?)");
            st.setString(1, u.getFullName());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRoleID());
            st.setString(4, u.getAddress());
            st.setString(5, u.getBirthday());
            st.setString(6, u.getPhone());
            st.setString(7, u.getMail());
            st.setInt(8, u.getStatus());
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
