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
public class PrivateM {
    private String sender;
    private String receiver;
    private String pm;
    private String time;
    private String pm_id;
    

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPm() {
        return pm;
    }
    public String getPmHTML() {
        return pm.replace("\n","<br>");
    }

    public void setPm(String pm) {
        this.pm = pm;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPm_id() {
        return pm_id;
    }

    public void setPm_id(String pm_id) {
        this.pm_id = pm_id;
    }

    
    @Override
    public String toString() {
        return "PrivateM{" + "sender=" + sender + ", receiver=" + receiver + ", pm=" + pm + ", time=" + time + '}';
    }
    
    public static int insertPM(String sender, String receiver,String pm,String time) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(pm_ID) AS LastMemberID FROM PM");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO PM VALUES (?,?,?,?,current_timestamp)");
            ps.setString(1, sender);
            ps.setString(2, receiver);
            ps.setString(3, pm);
            ps.setInt(4, newMemberID);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<PrivateM> find(String str) {
        String sqlCmd = "SELECT * FROM PM WHERE Receiver like ?";
        Connection con = ConnectionAgent.getConnection();
        PrivateM c = null;
        List<PrivateM> cs = new ArrayList<PrivateM>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new PrivateM();
                rToO(c, rs);
                cs.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<PrivateM> find1(String str) {
        String sqlCmd = "SELECT * FROM PM WHERE pm_id = ?";
        Connection con = ConnectionAgent.getConnection();
        PrivateM c = null;
        List<PrivateM> cs = new ArrayList<PrivateM>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new PrivateM();
                rToO(c, rs);
                cs.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<PrivateM> findSent(String str) {
        String sqlCmd = "SELECT * FROM PM WHERE Sender like ? and not receiver like 'admin'";
        Connection con = ConnectionAgent.getConnection();
        PrivateM c = null;
        List<PrivateM> cs = new ArrayList<PrivateM>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new PrivateM();
                rToO(c, rs);
                cs.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    private static void rToO(PrivateM c, ResultSet rs) {
        try {
            c.setSender(rs.getString("sender"));
            c.setReceiver(rs.getString("receiver"));
            c.setPm(rs.getString("pm"));
            c.setTime(rs.getString("time"));
            c.setPm_id(rs.getString("pm_id"));
            
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static int deletePm(String pmid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM PM WHERE PM_ID=?");
            ps.setString(1, pmid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
     public static PrivateM findById(String id) {
        String sqlCmd = "SELECT * FROM PM WHERE PM_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        PrivateM c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new PrivateM();
                rToO(c, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
     public static PrivateM findById1(String id) {
        String sqlCmd = "SELECT * FROM PM WHERE pm_id like ?";
        Connection con = ConnectionAgent.getConnection();
        PrivateM c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new PrivateM();
                rToO(c, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
     public static int findCount(String str) {
        String sqlCmd = "SELECT count(*) FROM PM WHERE receiver like ? ";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<PrivateM> cs = new ArrayList<PrivateM>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str +"%");
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(PrivateM.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
