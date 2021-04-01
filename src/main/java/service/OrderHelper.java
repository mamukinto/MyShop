package service;

import model.Cart;

public class OrderHelper {
    public static String[] formatProducts(Cart cart) {
        StringBuilder sbIds = new StringBuilder();
        StringBuilder sbQuantities = new StringBuilder();
        cart.getProducts().forEach(cartProduct -> {
            sbIds.append(cartProduct.getProduct().getId() + ",");
            sbQuantities.append(cartProduct.getCount());
        });
        String[] result = {sbIds.toString(),sbQuantities.toString()};
        return result;
    }
}
