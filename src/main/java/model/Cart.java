package model;

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
}
