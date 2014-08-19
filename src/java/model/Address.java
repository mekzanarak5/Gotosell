/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Address {
    private String user_id;
    private String address;
    private String address_id;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress_id() {
        return address_id;
    }

    public void setAddress_id(String address_id) {
        this.address_id = address_id;
    }

    @Override
    public String toString() {
        return "Address{" + "user_id=" + user_id + ", address=" + address + ", address_id=" + address_id + '}';
    }
    
    private static void rToO(Address a, ResultSet rs) {
        try {
            a.setAddress(rs.getString("address"));
            a.setAddress_id(rs.getString("address_id"));
            a.setUser_id(rs.getString("user_id"));
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static int addAddress(String user_id, String address) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(Address_ID) AS LastMemberID FROM address");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO address VALUES (?,?,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, user_id);
            ps.setString(3, address);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static Address findById(String id) {
        String sqlCmd = "SELECT * FROM Address WHERE Address_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        Address a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Address();
                rToO(a, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    public static List<Address> find(String str) {
        String sqlCmd = "SELECT * FROM Address WHERE user_id like ? ORDER BY Address_ID ASC";
        Connection con = ConnectionAgent.getConnection();
        Address a = null;
        List<Address> cs = new ArrayList<Address>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Address();
                rToO(a, rs);
                cs.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static int editAddress(String address,String userid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE Address SET address=?  WHERE Address_ID=?");
            ps.setString(1, address);
            ps.setString(2, userid);
      
            
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
            row=-1;
        }
        return row;
    }
    public static int deleteAddress(String address_id) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM Address WHERE Address_ID=?");
            ps.setString(1, address_id);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
}
