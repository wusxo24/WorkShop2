/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Acer
 */
public class Mobile {

    String mobileId;
    String description;
    Double price;
    String mobileName;
    int yearOfProduction;
    int quantity;
    Boolean notSale;
    int cartAmount;

    public Mobile() {
    }

    public Mobile(String mobileId, String description, Double price, String mobileName, int yearOfProduction, int quantity, Boolean notSale, int cartAmount) {
        this.mobileId = mobileId;
        this.description = description;
        this.price = price;
        this.mobileName = mobileName;
        this.yearOfProduction = yearOfProduction;
        this.quantity = quantity;
        this.notSale = notSale;
        this.cartAmount = cartAmount;
    }

    public Mobile(String mobileId, String description, Double price, String mobileName, int yearOfProduction, int quantity, Boolean notSale) {
        this.mobileId = mobileId;
        this.description = description;
        this.price = price;
        this.mobileName = mobileName;
        this.yearOfProduction = yearOfProduction;
        this.quantity = quantity;
        this.notSale = notSale;
    }

    public Mobile(String mobileId, String description, Double price, String mobileName, int yearOfProduction, int quantity) {
        this.mobileId = mobileId;
        this.description = description;
        this.price = price;
        this.mobileName = mobileName;
        this.yearOfProduction = yearOfProduction;
        this.quantity = quantity;
    }

    public Mobile(String mobileId, Double price, String mobileName, int cartAmount) {
        this.mobileId = mobileId;
        this.price = price;
        this.mobileName = mobileName;
        this.cartAmount = cartAmount;
    }

    public Mobile(String mobileId, String description, Double price, String mobileName, int CartAmount) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getMobileName() {
        return mobileName;
    }

    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Boolean getNotSale() {
        return notSale;
    }

    public void setNotSale(Boolean notSale) {
        this.notSale = notSale;
    }

    public int getCartAmount() {
        return cartAmount;
    }

    public void setCartAmount(int cartAmount) {
        this.cartAmount = cartAmount;
    }

}
