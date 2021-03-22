package service;

import model.Product;
import model.User;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<Product> getProducts() throws ShopException {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = ConnectionProvider.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from products");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                Product product = new Product(id,name,description,price);
                products.add(product);
            }
        } catch (SQLException throwables) {
            throw new ShopException(throwables.getMessage());
        }

        return products;
    }
    public void addProduct(int id, String name, String description, double price) {
        try {
            Connection c = ConnectionProvider.getConnection();
            PreparedStatement ps = c.prepareStatement("insert into products values(?,?,?,?)");
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setDouble(4, price);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void removeProductById(int id) {
        try {
            Connection c = ConnectionProvider.getConnection();
            Statement statement = c.createStatement();
            statement.executeUpdate("DELETE FROM products WHERE id = " + id);
        } catch (ShopException | SQLException e) {
            e.printStackTrace();
        }
    }
}
