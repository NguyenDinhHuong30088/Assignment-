/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author crrtt
 */
public class RoleDAO {
    
        public static ArrayList<Role> getAllRole() {
        ArrayList<Role> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblrole");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt("roleID"));
                r.setRoleName(rs.getString("roleName"));
                list.add(r);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
