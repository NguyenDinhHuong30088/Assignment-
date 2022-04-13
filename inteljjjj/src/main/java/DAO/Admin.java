/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Category;
import DTO.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Admin {
      public static ArrayList<Product> getAllProductAdmin() {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblproduct");
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
                p.setDes(rs.getString("Description"));
                p.setStatus(rs.getInt("status"));
                list.add(p);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }
       public static void addProduct(Product product) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblproduct values (0,?,?,?,?,?,?,?,?,?)");
             st.setString(1, product.getProductName());
              st.setString(2, product.getImage());
              st.setFloat(3, product.getPrice());
              st.setString(4,product.getDes());
              st.setInt(5, product.getQuantity());
              st.setInt(6, product.getCategoryID());
              st.setString(7, product.getImportDate());
              st.setString(8,product.getUsingDate());
              st.setInt(9, 1);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi add" + e);
        }
    }
  public static void updateProduct(Product product) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblproduct set productName=?,image=?,price=?,Description=?,quantity=?,categoryID=?,usingDate=? where productID = ?");
             st.setString(1, product.getProductName());
              st.setString(2, product.getImage());
              st.setFloat(3, product.getPrice());
            st.setString(4,product.getDes());
              st.setInt(5, product.getQuantity());
              st.setInt(6, product.getCategoryID());
              st.setString(7,product.getUsingDate());
              st.setInt(8,product.getProductID());
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi update product :" + e);
        }
    }
   public static void DeleteProduct(int id,int status) {
        try {
            if(status == 1){
                 Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblproduct set status=? where productID = ?");
            st.setInt(1, 0);
            st.setInt(2, id);
            st.executeUpdate();
            conn.close();
            }else if(status == 0){
                 Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblproduct set status=? where productID = ?");
            st.setInt(1, 1);
            st.setInt(2, id);
            st.executeUpdate();
            conn.close();
            }
           
        } catch (SQLException e) {
            System.out.println("loi delete product :" + e);
        }
    }
   public static void addCate(Category category) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblcategory values (0,?)");
           st.setString(1, category.getCategoryName());
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi add cate" + e);
        }
    }
   public static void updateCate(int id,String Name){
         try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblcategory set categoryName=? where categoryID = ?");
           st.setString(1,Name);
           st.setInt(2,id);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi update cate" + e);
        }
   }
     public static void DeleteCate(int id) {
        try {
             Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("delete from tblcategory  where categoryID = ?");
           st.setInt(1,id);
            st.executeUpdate();
            conn.close();
           
        } catch (SQLException e) {
            System.out.println("loi delete cate :" + e);
        }
    }
   
}
