package service.helpers;

import model.Cart;
import model.CartProduct;

public class CartHelper {
    public static double calculateSummaryPriceInCart(Cart cart) {
        double sum = 0;
        for (CartProduct product : cart.getProducts()) {
            for (int i = 0; i < product.getCount(); i++) {
                sum += product.getProduct().getPrice();
            }
        }
        return sum;
    }
}
