package model;

import java.util.List;

public abstract class Order {
    protected int id;
    protected String userEmail;
    protected String formattedDate;

    public Order() {

    }

    public Order(int id, String userEmail, String formattedDate) {
        this.id = id;
        this.userEmail = userEmail;
        this.formattedDate = formattedDate;
    }
    public Cart getProducts(){
        return null;
    }
    public void setProducts(List<CartProduct>cartProducts){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }

    @Override
    public String toString() {
        return "ID-"+id+" user email-"+userEmail+" date-"+formattedDate;
    }
}

