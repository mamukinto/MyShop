package model;

import java.util.List;

public class SingleOrder  extends Order {
    private CartProduct cartProduct;

    public SingleOrder() {

    }

    @Override
    public Cart getProducts() {
        Cart cart=new Cart();
        cart.getProducts().add(cartProduct);
        return cart;
    }

    @Override
    public void setProducts(List<CartProduct> cartProducts) {
       cartProducts.add(cartProduct);
    }

    public SingleOrder(int id, String userEmail, String formattedDate, CartProduct cartProduct) {
        super(id, userEmail, formattedDate);
        this.cartProduct =cartProduct;
    }


    @Override
    public String toString() {
        return super.toString()+" "+cartProduct.toString();
    }
}
