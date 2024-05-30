package com.example.shop;// CartManager.java
import java.util.ArrayList;
import java.util.List;

public class CartManager {
    private static CartManager instance;
    private List<Object> cartItems;

    private CartManager() {
        cartItems = new ArrayList<Object>();
    }

    public static synchronized CartManager getInstance() {
        if (instance == null) {
            instance = new CartManager();
        }
        return instance;
    }

    public void addItem(Object item) {
        cartItems.add(item);
    }

    public List<Object> getCartItems() {
        return cartItems;
    }
}
