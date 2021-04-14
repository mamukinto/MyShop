package service.dao;

import model.Product;
import model.ProductImage;
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
            addProductsFromResultSet(products, resultSet);
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new ShopException(throwables.getMessage());
        }

        return assignProductsWithImages(products);
    }

    private List<Product> assignProductsWithImages(List<Product> products) throws ShopException {
        List<ProductImage> images = getImages();
        images.forEach(productImage -> {
            products.forEach(product -> {
                if (productImage.getFileName().equals(String.valueOf(product.getId()))) {
                    product.setImage(productImage);
                }
            });

        });
        return products;
    }

    public void updateProduct(int id, String name, String description, double price) throws ShopException {
        try {

            Connection connection = ConnectionProvider.getConnection();
            Statement statement = connection.createStatement();
            statement.executeUpdate("update products set name = '" + name + "', description = '" + description + "', price = '" + price + "' where id='" + id + "'");
            connection.close();
        } catch (Exception e) {
            throw new ShopException(e.getMessage());
        }
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
            c.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void removeProductById(int id) {
        try {
            Connection c = ConnectionProvider.getConnection();
            Statement statement = c.createStatement();
            statement.executeUpdate("DELETE FROM products WHERE id = " + id);
            removeImageById(id);
            c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeImageById(int id) {
        try {
            Connection c = ConnectionProvider.getConnection();
            Statement statement = c.createStatement();
            statement.executeUpdate("DELETE FROM images WHERE fileName = " + id);
            c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addImage(String base64Image, String fileName) {
        try {
            Connection c = ConnectionProvider.getConnection();
            PreparedStatement ps = c.prepareStatement("insert into images values(?,?)");
            ps.setString(1, fileName);
            ps.setString(2, base64Image);
            ps.executeUpdate();
            c.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<ProductImage> getImages() throws ShopException {
        List<ProductImage> images = new ArrayList<>();
        try {
            Connection connection = ConnectionProvider.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from images");
            while (resultSet.next()) {
                String base64 = resultSet.getString("base64Image");
                String fileName = resultSet.getString("fileName");
                images.add(new ProductImage(base64, fileName));
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ShopException(e.getMessage());

        }
        return images;
    }

    public List<Product> getProductsByKeyword(String keyword) throws ShopException {
        List<Product> products = new ArrayList<>();

        try {
            Connection connection = ConnectionProvider.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM products WHERE name like '" + keyword + "' or description like '" + keyword + "';");
            addProductsFromResultSet(products, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ShopException(e.getMessage());
        }


        return assignProductsWithImages(products);
    }

    private void addProductsFromResultSet(List<Product> products, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String description = resultSet.getString("description");
            double price = resultSet.getDouble("price");
            Product product = new Product(id, name, description, price);
            products.add(product);
        }
    }
}
