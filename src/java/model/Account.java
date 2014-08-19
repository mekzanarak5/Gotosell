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
public class Account {

    private String userId;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String accountid;
    private String pic;

    public Account() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }
    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    
    @Override
    public String toString() {
        return "Account{" + "userId=" + userId + ", password=" + password + ", email=" + email + ", firstName=" + firstName + ", lastName=" + lastName + '}';
    }

    public static int addAccount(String userId, String password, String email, String firstname,
            String lastname,String pic) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(ACCOUNT_ID) AS LastMemberID FROM ACCOUNT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO ACCOUNT VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, userId);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, firstname);
            ps.setString(5, lastname);
            ps.setInt(6, newMemberID);
            ps.setString(7, pic);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }

    public static boolean checkEmail(String email) {
        if (email.contains(" ") == false && email.matches(".+@.+\\.[a-z]+")) {
            return true;
        } else {
            return false;
        }
    }

    public static Account findById(String id) {
        String sqlCmd = "SELECT * FROM ACCOUNT WHERE USER_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        Account a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Account();
                rToO(a, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    public static Account findById2(String id) {
        String sqlCmd = "SELECT * FROM ACCOUNT WHERE account_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        Account a = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Account();
                rToO(a, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    private static void rToO(Account a, ResultSet rs) {
        try {
            a.setUserId(rs.getString("USER_ID"));
            a.setPassword(rs.getString("PASSWORD"));
            a.setEmail(rs.getString("EMAIL"));
            a.setFirstName(rs.getString("FIRSTNAME"));
            a.setLastName(rs.getString("LASTNAME"));
            a.setAccountid(rs.getString("account_id"));
            a.setPic(rs.getString("pic"));
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public static int checkDuplicatedUser(String userId) { 
        int count = 0; 
        try { 
  
            Connection con = ConnectionAgent.getConnection(); 
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS Count FROM ACCOUNT WHERE USER_ID = ?"); 
            ps.setString(1, userId); 
            ResultSet rs = ps.executeQuery(); 
            if (rs.next()) { 
                count = rs.getInt(1); 
            } else { 
                count = 0; 
            } 
  
        } catch (SQLException ex) { 
            return 999; 
        } 
        return count; 
    } 
    public static int editProfile(String password,String email,String firstname,String lastname,String userid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE ACCOUNT SET PASSWORD=?,EMAIL=?,FIRSTNAME=?,LASTNAME=?  WHERE USER_ID=?");
            ps.setString(1, password);
            ps.setString(2, email);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setString(5, userid);
            
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row=-1;
        }
        return row;
    }
    public static int addPic(String accountid ,String pic) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            System.out.println(pic);
            PreparedStatement ps = con.prepareStatement("UPDATE ACCOUNT SET PIC = ? WHERE ACCOUNT_ID=?");
            ps.setString(1, pic);
            ps.setString(2, accountid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<Account> find(String str) {
        String sqlCmd = "SELECT * FROM ACCOUNT WHERE user_id like ? ORDER BY ACCOUNT_ID ASC";
        Connection con = ConnectionAgent.getConnection();
        Account a = null;
        List<Account> cs = new ArrayList<Account>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = new Account();
                rToO(a, rs);
                cs.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static int deleteAccount(String accountid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM ACCOUNT WHERE ACCOUNT_ID=?");
            ps.setString(1, accountid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
}
