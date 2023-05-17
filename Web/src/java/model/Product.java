/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import controller.ReviewDAO;

/**
 *
 * @author HP
 */
public class Product implements Comparable<Product>{
    private int id;
    private Category category_id; 
    private String title; 
    private int price;
    private int discount; 
    private String thumbnail;
    private String description; 
    private String created_at; 
    private String updated_at; 
    private int deleted ; 
    private String symbol;
    private int pin;
    private int ram; 
    private int rom; 
    private String CPU;
    private String KTmanHinh;
    private String cameraTruoc;
    private String cameraSau;

    public Product() {
    }

    public Product(int id, Category category_id, String title, int price, int discount, String thumbnail, String description, String created_at, String updated_at, int deleted, String symbol, int pin, int ram, int rom, String CPU, String KTmanHinh, String cameraTruoc, String cameraSau) {
        this.id = id;
        this.category_id = category_id;
        this.title = title;
        this.price = price;
        this.discount = discount;
        this.thumbnail = thumbnail;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.deleted = deleted;
        this.symbol = symbol;
        this.pin = pin;
        this.ram = ram;
        this.rom = rom;
        this.CPU = CPU;
        this.KTmanHinh = KTmanHinh;
        this.cameraTruoc = cameraTruoc;
        this.cameraSau = cameraSau;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Category category_id) {
        this.category_id = category_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getRom() {
        return rom;
    }

    public void setRom(int rom) {
        this.rom = rom;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getKTmanHinh() {
        return KTmanHinh;
    }

    public void setKTmanHinh(String KTmanHinh) {
        this.KTmanHinh = KTmanHinh;
    }

    public String getCameraTruoc() {
        return cameraTruoc;
    }

    public void setCameraTruoc(String cameraTruoc) {
        this.cameraTruoc = cameraTruoc;
    }

    public String getCameraSau() {
        return cameraSau;
    }

    public void setCameraSau(String cameraSau) {
        this.cameraSau = cameraSau;
    }
    
    public float trungbinhSosao(){
        ReviewDAO r = new ReviewDAO();
        return r.tinhSao(this.id);
    }
    
    public int soDanhGia(int star){
        ReviewDAO a = new ReviewDAO();
        return a.tinhSoDanhGia(this.id,star); 
    }
    
    public String toString(){
        return "Product{id=" + id + ",category_id="+category_id+", title=" + title + ",price=" + price + ", discount=" + 
                discount + ", thumbnail="+thumbnail + ", description=" + description + ", created_at="+created_at+
                ", updated_at="+updated_at+", deleted="+deleted+", symbol="+symbol+", pin=" + pin + ", ram=" + ram +
                ", rom="+rom+", CPU="+CPU+", KTmanHinh="+KTmanHinh+", cameraTruoc="+cameraTruoc+", cameraSau=" + cameraSau +"}";
    }

    @Override
    public int compareTo(Product o) {
//        StringBuilder str1 = new StringBuilder(this.created_at);
//        StringBuilder str2 = new StringBuilder(o.created_at);
//        
//        return str2.reverse().toString().compareTo(str1.reverse().toString());
        return 0;
//        StringBuilder str1 = new StringBuilder(this.created_at);
//        StringBuilder str2 = new StringBuilder(o.created_at);
//        
//        return str2.reverse().toString().compareTo(str1.reverse().toString());
    }
    
}
