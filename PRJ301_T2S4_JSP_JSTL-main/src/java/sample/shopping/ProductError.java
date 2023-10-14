/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author ACER
 */
public class ProductError {
    private String id;
    private String name;
    private String price;
    private String desciption;
    private String image;
    private String quantity;
    
    public ProductError() {
        this.id = "";
        this.name = "";
        this.price = "";
        this.desciption = "";
        this.image = "";
        this.quantity = "";
    }

    public ProductError(String id, String name, String price, String desciption, String image, String quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.desciption = desciption;
        this.image = image;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    
    
    
    
}
