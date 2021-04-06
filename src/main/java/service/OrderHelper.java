package service;

import model.*;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderHelper {
    public static String[] formatProducts(Cart cart) {
        StringBuilder sbIds = new StringBuilder();
        StringBuilder sbQuantities = new StringBuilder();
        cart.getProducts().forEach(cartProduct -> {
            sbIds.append(cartProduct.getProduct().getId() + ",");
            sbQuantities.append(cartProduct.getCount() + ",");
        });
        String[] result = {sbIds.toString(), sbQuantities.toString()};
        return result;
    }

    public static Order parseOrder(int id, String productIDS, String quantities, String userEmail, String formattedDate, String status) throws ShopException, SQLException {
        List<CartProduct> cartProducts = new ArrayList<>();
        String[] idsArray = productIDS.split(",");
        String[] quantitiesArray = quantities.split(",");

        for (int i = 0; i < idsArray.length; i++) {
            CartProduct cartProduct = new CartProduct();
            cartProduct.setProduct(ProductHelper.getProductById(Integer.parseInt(idsArray[i])));
            cartProduct.setCount(Integer.parseInt(quantitiesArray[i]));
            cartProducts.add(cartProduct);
        }


        Order order = null;

        if (cartProducts.size() > 1) {
            order = new MultipleOrder();
        } else {
            order = new SingleOrder();
        }
        order.setId(id);
        order.setProducts(cartProducts);
        order.setUserEmail(userEmail);
        order.setFormattedDate(formattedDate);
        order.setStatus(status);
        return order;
    }

    public static int getMaxId() throws ShopException {
        int id = 0;
        List<Order> orders = new ArrayList<>();
        OrderDAO orderDAO = new OrderDAO();
        orders = orderDAO.getOrders();
        if (orders.size() != 0) {
            for (Order order : orders) {
                if (order.getId() > id) {
                    id = order.getId();
                }
            }
        }
        return id;
    }

    public static List<Order> getOrdersByEmail(String email) throws ShopException {
        List<Order> orders = new ArrayList<>();
        OrderDAO orderDAO = new OrderDAO();
        for (Order order : orderDAO.getOrders()) {
            if (order.getUserEmail().equals(email)) {
                orders.add(order);
            }
        }
        return orders;
    }

    public static List<Order> getActiveOrders() throws ShopException {
        List<Order> orders = new ArrayList<>();
        OrderDAO orderDAO = new OrderDAO();
        for (Order order : orderDAO.getOrders()) {
            if (order.getStatus().equals("processing..")) {
                orders.add(order);
            }
        }
        return orders;
    }

    public static List<Order> getDeliveredOrders() throws ShopException {
        List<Order> orders = new ArrayList<>();
        OrderDAO orderDAO = new OrderDAO();
        for (Order order : orderDAO.getOrders()) {
            if (order.getStatus().equals("delivered")) {
                orders.add(order);
            }
        }
        return orders;
    }

    public static List<Order> getCanceledOrders() throws ShopException {
        List<Order> orders = new ArrayList<>();
        OrderDAO orderDAO = new OrderDAO();
        for (Order order : orderDAO.getOrders()) {
            if (order.getStatus().equals("canceled")) {
                orders.add(order);
            }
        }
        return orders;
    }


}
