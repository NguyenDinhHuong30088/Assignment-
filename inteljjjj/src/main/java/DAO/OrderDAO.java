/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author crrtt
 */
public class OrderDAO {

    public static ArrayList<Order> getAllOrder() {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblorders");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("orderID"));
                o.setUserID(rs.getInt("userID"));
                o.setOrderDate(rs.getString("orderDate"));
                o.setTotal(rs.getFloat("total"));
                o.setStatus(rs.getInt("status"));
                list.add(o);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public static int getOrderIDByUserID(int userID) {
        int orderID = 0;
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select orderID from tblorders where userID = ? and status = 1");
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                orderID = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return orderID;
    }

    public static void addNewOrder(int userID) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblorders values (0,?,?,?,?)");
            st.setInt(1, userID);
            st.setString(2, "0");
            st.setFloat(3, 0);
            st.setInt(4, 1);
            st.execute();
            conn.close();
        } catch (Exception e) {
            System.out.println("loi add order " + e);
        }
    }

    public static void checkOut(int orderID, float totalPrice) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblorders set status = 2, total = ? where orderID = ?");
            st.setFloat(1, totalPrice);
            st.setInt(2, orderID);
            st.execute();
            conn.close();
        } catch (Exception e) {
        }
    }

}
