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
public class Comment {
    private String productid;
    private String userid;
    private String comment;
    private String commentid;
    private String pic;
    private String name;

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getComment() {
        return comment;
    }
    public String getCommentHTML() {
        return comment.replace("\n","<br>");
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    @Override
    public String toString() {
        return "Comment{" + "productid=" + productid + ", userid=" + userid + ", comment=" + comment + '}';
    }
    
    public static int insertComment(String productid, String userid,String comment,String pic,String name) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(commentID) AS LastMemberID FROM COMMENT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }
            PreparedStatement ps = con.prepareStatement("INSERT INTO COMMENT VALUES (?,?,?,?,?,?)");
            ps.setString(1, productid);
            ps.setString(2, userid);
            ps.setString(3, comment);
            ps.setInt(4, newMemberID);
            ps.setString(5, pic);
            ps.setString(6 , name);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<Comment> find(String str) {
        String sqlCmd = "SELECT * FROM COMMENT WHERE product_id like ? OR User_id like ?";
        Connection con = ConnectionAgent.getConnection();
        Comment c = null;
        List<Comment> cs = new ArrayList<Comment>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ps.setString(2,str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Comment();
                rToO(c, rs);
                cs.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    
    private static void rToO(Comment c, ResultSet rs) {
        try {
            c.setProductid(rs.getString("product_id"));
            c.setUserid(rs.getString("user_id"));
            c.setComment(rs.getString("comment"));
            c.setCommentid(rs.getString("commentid"));
            c.setPic(rs.getString("pic"));
            c.setName(rs.getString("name"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static int deleteComment(String commentid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM Comment WHERE COMMENTID=?");
            ps.setString(1, commentid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
     public static Comment findById(String id) {
        String sqlCmd = "SELECT * FROM Comment WHERE commentID = ?";
        Connection con = ConnectionAgent.getConnection();
        Comment c = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Comment();
                rToO(c, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
     public static int upToDate(String productid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE PRODUCT SET nowday = current_timestamp WHERE PRODUCT_ID=?");
            ps.setString(1, productid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
     public static int editComment(String comment ,String commentid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE comment SET comment = ? WHERE COMMENTID=?");
            ps.setString(1, comment);
            ps.setString(2, commentid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Comment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
}
