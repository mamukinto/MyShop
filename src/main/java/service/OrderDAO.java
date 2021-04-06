package service;

import model.Order;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public void addOrder(Order order) throws ShopException {
        String[] result = OrderHelper.formatProducts(order.getProducts());
        Connection c = ConnectionProvider.getConnection();
        try {
            PreparedStatement preparedStatement = c.prepareStatement("insert into orders values(?,?,?,?,?,?)");
            preparedStatement.setInt(1, order.getId());
            preparedStatement.setString(2, result[0]);
            preparedStatement.setString(3, result[1]);
            preparedStatement.setString(4, order.getUserEmail());
            preparedStatement.setString(5, order.getFormattedDate());
            preparedStatement.setString(6, order.getStatus());
            preparedStatement.executeUpdate();
            c.close();
        } catch (SQLException throwables) {
            throw new ShopException(throwables.getMessage());
        }

    }


    public List<Order> getOrders() throws ShopException {
        List<Order> orders = new ArrayList<>();
        Connection c = ConnectionProvider.getConnection();
        Statement statement = null;
        try {
            statement = c.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from orders");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String productIDS = resultSet.getString("productID");
                String productQuantity = resultSet.getString("productQuantity");
                String userEmail = resultSet.getString("userEmail");
                String formattedDate = resultSet.getString("formattedDate");
                String status = resultSet.getString("status");
                Order order = OrderHelper.parseOrder(id, productIDS, productQuantity, userEmail, formattedDate, status);
                orders.add(order);
            }
            c.close();
        } catch (SQLException throwables) {
            throw new ShopException(throwables.getMessage());
        }

        return orders;
    }

    public void changeOrderStatus(String status,String orderId) throws ShopException {
        Connection connection = ConnectionProvider.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            statement.executeUpdate("update orders set status = '" + status + "' where id = " + orderId);
            connection.close();
        } catch (SQLException throwables) {
            throw new ShopException(throwables.getMessage());
        }
    }
}
