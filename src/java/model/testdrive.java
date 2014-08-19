/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class testdrive {
    public static void main(String[] args) throws Exception {
        Connection con= ConnectionAgent.getConnection();
        PreparedStatement ps=con.prepareStatement("select comment from comment");
        ResultSet rs=ps.executeQuery();
        rs.next();
        String temp=rs.getString(1).replace("\n","<br>");
        System.out.println(temp);
       
        
    }
}
