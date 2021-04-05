package service;

import model.*;
import model.exceptions.ShopException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderHelper {
    public static String[] formatProducts(Cart cart) {
        StringBuilder sbIds=new StringBuilder();
        StringBuilder sbQuantities=new StringBuilder();
        cart.getProducts().forEach(cartProduct -> {
            sbIds.append(cartProduct.getProduct().getId() + ",");
            sbQuantities.append(cartProduct.getCount()+",");
        });
        String[] result = {sbIds.toString(),sbQuantities.toString()};
        return result;
    }

    public static Order parseOrder(int id,String productIDS, String quantities,String userEmail, String formattedDate) throws ShopException, SQLException {
        List<CartProduct>cartProducts=new ArrayList<>();
        String[] ids=productIDS.split(",");
        String[] Quantities=quantities.split(",");
        int[] productids=new int[ids.length];
        int[] productQuantity=new int[Quantities.length];
        for(int i=0;i<ids.length;i++){
            productids[i]=Integer.parseInt(ids[i]);
            productQuantity[i]=Integer.parseInt(Quantities[i]);
        }

        for (int k=0;k<productIDS.length();k++){
            CartProduct cartProduct=new CartProduct();
            cartProduct.setProduct(ProductHelper.getProductById(k));
            cartProduct.setCount(productQuantity[k]);
            cartProducts.add(cartProduct);
        }

        Order order=null;

        if(cartProducts.size()>1){
          order=new MultipleOrder();
          order.setId(id);
          order.setProducts(cartProducts);
          order.setUserEmail(userEmail);
          order.setFormattedDate(formattedDate);
        }else{
            order=new SingleOrder();
            order.setId(id);
            order.setProducts(cartProducts);
            order.setUserEmail(userEmail);
            order.setFormattedDate(formattedDate);
        }
        return order;
    }
}
