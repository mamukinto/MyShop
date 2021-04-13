package service;

import model.User;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public List<User> getUsers() throws ShopException {
        List<User> users = new ArrayList<User>();

        try {
            Connection connection = ConnectionProvider.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users");
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String number = resultSet.getString("number");
                String password = resultSet.getString("password");
                User user = new User(name,email,number,password);
                users.add(user);
            }
            connection.close();
        } catch (SQLException throwables) {
            throw new ShopException(throwables.getMessage());
        }

        return users;
    }

    public void updateUser(String name,String number,String password,String email) throws ShopException {

        try {
            Connection  connection = ConnectionProvider.getConnection();
            Statement statement = connection.createStatement();
            if (password != null) {
                statement.executeUpdate("update users set name = '" + name + "', number = '" + number +"', password = '" + password + "' where email='" + email + "'");
            } else {
                statement.executeUpdate("update users set name = '" + name + "', number = '" + number +"' where email='" + email + "'");
            }
           connection.close();
        } catch (ShopException | SQLException e) {
            throw new ShopException(e.getMessage());
        }

    }

    public void addUser(String name,String email,String mobileNumber,String password) throws ShopException, SQLException {
        Connection c = ConnectionProvider.getConnection();
        PreparedStatement ps = c.prepareStatement("insert into users values(?,?,?,?)");
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,mobileNumber);
        ps.setString(4,password);
        ps.executeUpdate();
        c.close();
    }
}
