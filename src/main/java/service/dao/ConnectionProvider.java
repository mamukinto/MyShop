package service.dao;

import model.exceptions.ShopException;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "password");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
