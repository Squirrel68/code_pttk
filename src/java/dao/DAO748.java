/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class DAO748 {

    public static Connection con;

    public DAO748() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3307/pttk?user=root&password=123456&allowPublicKeyRetrieval=true&useSSL=false";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "root",
                        "123456");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
