package service;

import model.exceptions.ShopException;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    public static Connection getConnection() throws ShopException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "password");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
