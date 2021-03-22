package service;

import model.Product;
import model.exceptions.ShopException;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public class ProductHelper {
    public static Product getProductById(int id) throws ShopException {
        AtomicReference<Product> product = new AtomicReference<>(new Product());

        ProductDAO productDAO = new ProductDAO();
        productDAO.getProducts().forEach(product1 -> {
            if (product1.getId() == id) {
                product.set(product1);
            }
        });

        return product.get();
    }

    public static int getMaxId() throws ShopException {
        int id = 0;
        List<Product> products = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        products = productDAO.getProducts();
        if (products.size() != 0) {
            for (Product product : products) {
                if (product.getId() > id) {
                    id = product.getId();
                }
            }
        }
        return id;
    }

}
