/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import DAO.MobileDAO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Acer
 */
public class Cart {

    private Map<String, Mobile> cart;

    public Cart() {
    }

    public Cart(Map<String, Mobile> cart) {
        this.cart = cart;
    }

    public Map<String, Mobile> getCart() {
        return cart;
    }

    public void setCart(Map<String, Mobile> cart) {
        this.cart = cart;
    }
    
    public boolean updatedCart(){
        getCart();
       return true;     
    }

    public boolean add(Mobile mobile) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(mobile.getMobileId())) {
                int currentQuantity = this.cart.get(mobile.getMobileId()).getQuantity();
                mobile.setQuantity(currentQuantity + mobile.getQuantity());
                int currentCartAmount = this.cart.get(mobile.getMobileId()).getCartAmount();
                mobile.setCartAmount(currentCartAmount + mobile.getCartAmount());
            }
            this.cart.put(mobile.getMobileId(), mobile);
            check = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return check;
    }

    public boolean remove(Mobile mobile) {
        boolean check = false;
        String mobileId = mobile.getMobileId();
        String description = mobile.getDescription();
        Double price = mobile.getPrice();
        String mobileName = mobile.getMobileName();
        int yearOfProduction = mobile.getYearOfProduction();
        int quantity = mobile.getQuantity();
        Boolean notSale = mobile.getNotSale();
        int cartAmount = mobile.getCartAmount();
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(mobileId)) {
                    this.cart.remove(mobileId);
                    check = true;
                    MobileDAO mobiledao = new MobileDAO();
                    mobiledao.updateQuantityFromCart(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, cartAmount);
                }
            }

        } catch (Exception ex) {

        }
        return check;
    }

    public boolean change(Mobile mobile, int oldCartAmount) {
        boolean check = false;
        String mobileId = mobile.getMobileId();
        String description = mobile.getDescription();
        Double price = mobile.getPrice();
        String mobileName = mobile.getMobileName();
        int yearOfProduction = mobile.getYearOfProduction();
        int quantity = mobile.getQuantity();
        Boolean notSale = mobile.getNotSale();
        int cartAmount = mobile.getCartAmount();
        int cartDif = cartAmount - oldCartAmount;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(mobileId)) {
                    this.cart.replace(mobileId, new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity - cartDif, notSale, cartAmount));
                    check = true;
                    MobileDAO mobiledao = new MobileDAO();
                    mobiledao.updateQuantityFromCart(mobileId, description, price, mobileName, yearOfProduction, quantity - cartDif, notSale, cartAmount);
                }
            }

        } catch (Exception ex) {

        }
        return check;
    }
    
    
}
