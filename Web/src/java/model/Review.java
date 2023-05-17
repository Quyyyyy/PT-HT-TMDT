/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class Review implements Comparable<Review>{
    private int id;
    private Users id_user;
    private Product id_product;
    private int star;
    private String content;
    private String created_at;
    private int deleted;

    public Review() {
    }

    public Review(int id, Users id_user, Product id_product, int star, String content, String created_at, int deleted) {
        this.id = id;
        this.id_user = id_user;
        this.id_product = id_product;
        this.star = star;
        this.content = content;
        this.created_at = created_at;
        this.deleted = deleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users getId_user() {
        return id_user;
    }

    public void setId_user(Users id_user) {
        this.id_user = id_user;
    }

    public Product getId_product() {
        return id_product;
    }

    public void setId_product(Product id_product) {
        this.id_product = id_product;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @Override
    public int compareTo(Review o) {
        StringBuilder str1 = new StringBuilder(this.created_at);
        StringBuilder str2 = new StringBuilder(o.created_at);
        
        return str2.reverse().toString().compareTo(str1.reverse().toString());
    }
    
    
}
