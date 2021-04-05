package service;

import model.Order;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public void addSingleOrder(Order order) throws ShopException, SQLException {
         String[] result=OrderHelper.formatProducts(order.getProducts());
         Connection c=ConnectionProvider.getConnection();
         PreparedStatement preparedStatement=c.prepareStatement("insert into orders values(?,?,?,?,?)");
         preparedStatement.setInt(1,order.getId());
         preparedStatement.setString(2,result[0]);
         preparedStatement.setString(3,result[1]);
         preparedStatement.setString(4,order.getUserEmail());
         preparedStatement.setString(5,order.getFormattedDate());
         preparedStatement.executeUpdate();
    }


    public List<Order> getOrders() throws ShopException, SQLException {
        List<Order>orders=new ArrayList<>();
        Connection c=ConnectionProvider.getConnection();
        Statement statement=c.createStatement();
        ResultSet resultSet=statement.executeQuery("select * from orders");
        while (resultSet.next()){
            int id=resultSet.getInt("id");
            String productIDS=resultSet.getString("productID");
            String productQuantity=resultSet.getString("productQuantity");
            String userEmail=resultSet.getString("userEmail");
            String formattedDate=resultSet.getString("formattedDate");
            Order order=OrderHelper.parseOrder(id,productIDS,productQuantity,userEmail,formattedDate);
            orders.add(order);
        }
        return orders;
    }
}
