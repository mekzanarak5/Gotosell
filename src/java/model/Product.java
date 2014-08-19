/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Product {
    private String userId;
    private String name;
    private double price;
    private String des;
    private String type;
    private String phone;
    private String address;
    private String pic;
    private String firstDate;
    private String nowDay;
    private String productid;
    private String text;

    public Product() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getFirstDate() {
        return firstDate;
    }

    public void setFirstDate(String firstDate) {
        this.firstDate = firstDate;
    }

    public String getNowDay() {
        return nowDay;
    }

    public void setNowDay(String nowDay) {
        this.nowDay = nowDay;
    }

   

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    

    @Override
    public String toString() {
        return "Product{" + "name=" + name + ", price=" + price + ", des=" + des + ", type=" + type + ", phone=" + phone + ", address=" + address + ", pic=" + pic + ", firstDate=" + firstDate + ", nowDay=" + nowDay + '}';
    }

    public static int addProduct(String userId ,String name, double price, String des, String type,
            String phone,String address,String firstDate,String nowDay,String pic,String text) {
        int row = 0;
        int newMemberID = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(PRODUCT_ID) AS LastMemberID FROM PRODUCT");
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                newMemberID = rs.getInt(1) + 1;
            } else {
                newMemberID = 0;
            }

            PreparedStatement ps = con.prepareStatement("INSERT INTO PRODUCT VALUES (?,?,?,?,?,?,?,?,?,current_timestamp,?,?)");
            ps.setInt(1, newMemberID);
            ps.setString(2, userId);
            ps.setString(3, name);
            ps.setString(4, des);
            ps.setString(5, type);
            ps.setString(6, phone);
            ps.setString(7, address);
            ps.setString(8, firstDate);
            ps.setString(9, pic);
            ps.setString(10, text);
            ps.setDouble(11, price);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static int addPic(String productid ,String pic) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE PRODUCT SET PIC = ? WHERE PRODUCT_ID=?");
            ps.setString(1, pic);
            ps.setString(2, productid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static int upToDate(String productid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE PRODUCT SET nowday = current_timestamp WHERE PRODUCT_ID=?");
            ps.setString(1, productid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static int deleteProduct(String productid) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM PRODUCT WHERE PRODUCT_ID=?");
            ps.setString(1, productid);
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return row;
    }
    public static List<Product> find(String str) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE user_id like ? OR name like ? OR TYPE like ? ORDER BY NOWDAY DESC";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str);
            ps.setString(2, str + "%");
            ps.setString(3, str);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Product> findtwo(String str, String st,double p1,double p2) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE (user_id like ? OR NAME like ?) and (TYPE like ?) and (PRICE between ? and ?) ORDER BY NOWDAY DESC";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, "%"+str+"%");
            ps.setString(2, "%"+str+"%");
            ps.setString(3, st);
            ps.setDouble(4, p1);
            ps.setDouble(5, p2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Product> findtwo2(String str, String st,double p1,double p2) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE ((user_id like ? OR NAME like ?) OR (NAME like ?) OR (NAME like ?)) and (TYPE like ?) and (PRICE between ? and ?) ORDER BY NOWDAY DESC";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, "%"+str+"%");
            ps.setString(2, "%"+str+"%");
            ps.setString(3,"%"+str.toUpperCase()+"%");
            ps.setString(4,"%"+str.toLowerCase()+"%");
            ps.setString(5, st);
            ps.setDouble(6, p1);
            ps.setDouble(7, p2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Product> findPrice(double str, double st) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE PRICE between ? and ? ORDER BY NOWDAY DESC";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setDouble(1, str);
            ps.setDouble(2, st);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Product> findBy9(String str,int page) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE user_id like ? ORDER BY NOWDAY DESC offset ? rows fetch next 5 rows only";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str +"%");
            ps.setInt(2, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Product> findBy10(String str,int page) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE user_id like ? ORDER BY NOWDAY DESC offset ? rows fetch next 10 rows only";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str +"%");
            ps.setInt(2, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static List<Product> findBy15(String str,int page) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE user_id like ? ORDER BY NOWDAY DESC offset ? rows fetch next 15 rows only";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str +"%");
            ps.setInt(2, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                rToO(p, rs);
                cs.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }
    public static int findCount(String str) {
        String sqlCmd = "SELECT count(*) FROM PRODUCT WHERE user_id like ? ";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        List<Product> cs = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, str +"%");
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    private static void rToO(Product p, ResultSet rs) {
        try {
            p.setUserId(rs.getString("user_id"));
            p.setName(rs.getString("name"));
            p.setDes(rs.getString("des"));
            p.setType(rs.getString("type"));
            p.setPhone(rs.getString("phone"));
            p.setAddress(rs.getString("address"));
            p.setFirstDate(rs.getString("firstdate"));
            p.setNowDay(rs.getString("nowday"));
            p.setPic(rs.getString("pic"));
            p.setProductid(rs.getString("product_id"));
            p.setPrice(rs.getDouble("price"));
            p.setText(rs.getString("text"));
            
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    public static int lastid(){
                Connection con = ConnectionAgent.getConnection();
                int id=0;
        try {
            PreparedStatement ps1 = con.prepareStatement("SELECT MAX(PRODUCT_ID) FROM PRODUCT");
            ResultSet rs = ps1.executeQuery();
            if(rs.next()){
               id= rs.getInt(1);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    public static Product findById(String id) {
        String sqlCmd = "SELECT * FROM PRODUCT WHERE PRODUCT_ID = ?";
        Connection con = ConnectionAgent.getConnection();
        Product p = null;
        try {
            PreparedStatement ps = con.prepareStatement(sqlCmd);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Product();
                rToO(p, rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    public static int editProduct(String name,double price,String des,String type,String phone,String address,String productid,String text) {
        int row = 0;
        try {

            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE PRODUCT SET name=?,des=?,type=?,phone=?,address=?,text=?,price=?  WHERE Product_ID=?");
            ps.setString(1, name);
            ps.setString(2, des);
            ps.setString(3, type);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, text);
            ps.setDouble(7, price);
            ps.setString(8, productid);
            
            row = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(Product.class.getName()).log(Level.SEVERE, null, ex);
            row=-1;
        }
        return row;
    }
    
    public static ArrayList<Product> search(String key,int x,int y){
        ArrayList<Product>ar=new ArrayList<Product>();
        try {
            String sql="select * from product where user_id like ? ORDER BY NOWDAY DESC offset ? rows fetch next ? rows only";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,"%"+key.trim()+"%");
            ps.setInt(2,x);
            ps.setInt(3,y);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                rToO(p,rs);
                ar.add(p);
            }
        } catch (Exception e) {
        }
        return ar;
    }
    
    public static int countRow(String key){
        try {
            String sql="select count(product_id) from product where user_id like ?";
            Connection con = ConnectionAgent.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,"%"+key.trim()+"%");
            ResultSet rs=ps.executeQuery();
            if(rs.next())return rs.getInt(1);
        } catch (Exception e) {
        }
        return 0;
    }
}
