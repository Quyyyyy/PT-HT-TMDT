/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Order_details;

/**
 *
 * @author HP
 */
public class Order_detailsDAO extends DBContext{
    public void themOrderdetai(Order_details o){
        String sql = "insert into order_details(order_id,product_id,price,num,total_money) values(?,?,?,?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, o.getOrder_id().getId());
            ps.setInt(2, o.getProduct_id().getId());
            ps.setInt(3, o.getPrice());
            ps.setInt(4, o.getNum()); 
            ps.setInt(5, o.getTotal_money());
            ps.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }          
    }
    
    public ArrayList<Order_details> layTheoIdor(int id){
        ArrayList<Order_details> list = new ArrayList<>();
        String sql = "select * from order_details where order_id="+id;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Order_details o = new Order_details();
                o.setId(rs.getInt("id")); 
                OrdersDAO or = new OrdersDAO();
                o.setOrder_id(or.layTheoId(rs.getInt("order_id")));
                ProductDAO p = new ProductDAO();
                o.setProduct_id(p.layTheoId(rs.getInt("product_id"))); 
                o.setPrice(rs.getInt("price"));
                o.setNum(rs.getInt("num"));
                o.setTotal_money(rs.getInt("total_money")); 
                list.add(o);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}
