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
public class Pic {
    private String productid;
    private String pic;
    private String pic_id;

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
    public String getPic_id() {
        return pic_id;
    }

    public void setPic_id(String pic_id) {
        this.pic_id = pic_id;
    }

    
    @Override
    public String toString() {
        return "Pic{" + "productid=" + productid + ", pic=" + pic + '}';
    }
    
    public static int insertPic(String productid, String pic) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(pic_ID) AS LastMemberID FROM pic");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO PIC VALUES (?,?,?)");
            ps.setString(1, productid);
            ps.setString(2, pic);
            ps.setInt(3, newMemberID);
            

            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<Pic> find(String str) {
        String sqlCmd = "SELECT * FROM pic WHERE product_id like ?";
        Connection con = ConnectionAgent.getConnection();
        Pic p = null;
        List<Pic> cs = new ArrayList<Pic>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Pic();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Pic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    private static void rToO(Pic p, ResultSet rs) {
        try {
            p.setProductid(rs.getString("product_id"));
            p.setPic(rs.getString("url"));
            p.setPic_id(rs.getString("pic_id"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Pic.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public static int deletePic(String pic_id) {
        int row = 0;
        try {
            
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM pic WHERE pic_id=?");
            ps.setString(1, pic_id);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Pic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
}
