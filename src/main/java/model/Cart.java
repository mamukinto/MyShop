package model;

import model.exceptions.ShopException;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartProduct> products;

    public Cart() {
       products = new ArrayList<>();
    }

    public Cart(List<CartProduct> products) {
        this.products = products;
    }

    public List<CartProduct> getProducts() {
        return products;
    }

    public void setProducts(List<CartProduct> products) {
        this.products = products;
    }

    public String addProduct(Product product) {
        for (CartProduct cartProduct : products) {
            if (cartProduct.getProduct().getId() == product.getId()) {
                cartProduct.addCount();
                return "already";
            }
        }

        products.add(new CartProduct(product));
        System.out.println(products.toString());
        return "success";
    }

    public void incrementQuantity(int productId) throws ShopException {
        boolean flag = true;
        for (CartProduct cartProduct : products) {
            if (cartProduct.getProduct().getId() == productId) {
                cartProduct.addCount();
                flag = false;
            }
        }
        if (flag) {
            throw new ShopException("Can not find product with id - " + productId);
        }
    }

    public void decrementQuantity(int productId) throws ShopException {
        boolean flag = true;
        CartProduct product = new CartProduct();
        for (CartProduct cartProduct : products) {
            if (cartProduct.getProduct().getId() == productId) {
                cartProduct.subtractCount();
                product = cartProduct;
                flag = false;
            }
        }
        if (product.count == 0) {
            products.remove(product);
        }
        if (flag) {
            throw new ShopException("Can not find product with id - " + productId);
        }
    }
}
