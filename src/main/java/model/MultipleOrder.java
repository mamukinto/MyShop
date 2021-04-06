package model;

import java.util.List;

public class MultipleOrder extends Order{
    private Cart cart;

    public MultipleOrder() {
        cart = new Cart();
    }

    @Override
    public Cart getProducts() {
        return cart;
    }

    public MultipleOrder(int id, String userEmail, String formattedDate) {
        super(id, userEmail, formattedDate);
        cart = new Cart();
    }

    @Override
    public void setProducts(List<CartProduct> cartProducts) {
        cart.setProducts(cartProducts);
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return super.toString()+" "+cart.toString();
    }
}
