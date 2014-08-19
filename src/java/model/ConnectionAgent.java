/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;

/**
 *
 * @author INT303
 */
public class ConnectionAgent {
    private static final String DRIVER ="org.apache.derby.jdbc.ClientDriver";
    private static final String URL ="jdbc:derby://localhost:1527/GoToSell";
    private static final String USERNAME ="SellDB";
    private static final String PASSWORD ="app";
    
    public static Connection getConnection(){
        try {      
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ConnectionAgent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(ConnectionAgent.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return null;
    }
}
