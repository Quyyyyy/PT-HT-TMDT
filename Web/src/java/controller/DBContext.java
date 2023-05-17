/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class DBContext {
    protected Connection conn = null;

    public DBContext() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/webdt";
            String user = "minhquy";
            String pass = "12345678";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, user, pass);
        }
        catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex);
        }
       
    }
    public static void main(String[] args) {
        
    }
}
