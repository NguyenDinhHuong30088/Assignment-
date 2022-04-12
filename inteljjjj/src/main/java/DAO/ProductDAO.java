/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author crrtt
 */
public class ProductDAO {

    public static ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblProduct where status = 1 and quantity > 0");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setImportDate(rs.getString("importDate"));
                p.setUsingDate(rs.getString("usingDate"));
                p.setStatus(rs.getInt("status"));
                list.add(p);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public static Product getProductByID(int productID) {
        Product p = new Product();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblProduct where productID = ? and status=1");
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setImportDate(rs.getString("importDate"));
                p.setUsingDate(rs.getString("usingDate"));
            }
            conn.close();
        } catch (SQLException e) {
        }
        return p;
    }

    public static void insertProduct(Product product) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement stmt = conn.prepareStatement("Insert into  tblProduct values(?,?,?,?,?,?,?,?)");
        } catch (Exception e) {

        }
    }

    public static void updateQuantity(int ID, int quantity) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblProduct set quantity=? where productID = ?");
            st.setInt(1, quantity);
            st.setInt(2, ID);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi update product :" + e);
        }
    }
}
