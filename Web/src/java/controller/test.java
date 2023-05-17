/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Category;
import model.Product;
import model.Review;
import model.Role;
import model.Users;

/**
 *
 * @author HP
 */
public class test {
    public static void main(String[] args) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(df.format(new Date())); 
        System.out.println(new Date());
        //UsersDAO d = new UsersDAO();
        Role r = new Role(2,"user");
//        Users p = new Users(0,"Trương Văn Tân","tantv@gmail.com","0000000000","Hà Đông","12345678890",r,df.format(new Date()),df.format(new Date()),0);
//        d.themUser(p); 
        //Users u = d.ktemail("tantv@gmail.com");
        Category c = new Category(2,"nổi bật");
        Product t = new Product(1,c ,"Huawei-mate-20-pro-green",6500000,6100000,"img/products/huawei-mate-20-pro-green-600x600.jpg",
                "hãng: Huawei","2023-03-30 01:25:24", "2023-05-14 12:37:33", 0,"Huawei", 4200, 8, 128, "Hisilicon Kirin 980", "6.39'", "24", "48");
//        ProductDAO b = new ProductDAO();
//        b.themPro(t); 
//         OrdersDAO o = new OrdersDAO();
//         o.update(1, 2);
//        FeedbackDAO f = new FeedbackDAO();
//        //f.update(1); 
//        System.out.println(f.layTatCa());
//        CategoryDAO c = new CategoryDAO();
//        System.out.println(c.layTheoTen("trả góp")); 
        ProductDAO d = new ProductDAO();
        //ArrayList<Product> l = d.layTheoLoai(c.layTheoTen("trả góp")); 
//        ArrayList<Product> l = d.layTheoYeuCau("","","giagiamdan");
//        for(Product i:l){
//            System.out.println(i);
//        }
        //System.out.println();
        Users u = new Users(1,"Trương Văn Tân","tantv@gmail.com","012345678","Hà Đông","12345678890",r,"2023-05-12 14:55:50","2023-05-13 11:07:07",0);
        ReviewDAO k = new ReviewDAO();
        Review h = new Review(0,u,t,3,"sp dùng tốt",df.format(new Date()),0);
        k.themReview(h); 
    }
}
