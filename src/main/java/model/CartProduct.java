package model;

public class CartProduct {
    Product product;
    int count;

    public CartProduct() {
        product = new Product();
    }

    public CartProduct(Product product) {
        this.product = product;
        this.count = 1;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void addCount() {
        this.count++;
    }

    public void subtractCount() {this.count--;}
}
