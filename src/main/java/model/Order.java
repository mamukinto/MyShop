package model;

import java.util.List;

public abstract class Order {
    private int id;
    private String userEmail;
    private String formattedDate;
    private String status;

    public Order() {

    }

    public Order(int id, String userEmail, String formattedDate) {
        this.id = id;
        this.userEmail = userEmail;
        this.formattedDate = formattedDate;
    }
    public Cart getProducts(){
        return new Cart();
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ID-"+id+" user email-"+userEmail+" date-"+formattedDate;
    }
}

