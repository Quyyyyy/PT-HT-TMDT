/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Orders;

/**
 *
 * @author HP
 */
public class OrdersDAO extends DBContext{
    public void themOrd(Orders d){
        String sql = "insert into orders(user_id,fullname,email,phone_number,address,note,order_date,status,total_money) "
                + "values(?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps =conn.prepareStatement(sql);
            ps.setInt(1,d.getUser_id().getId());
            ps.setString(2,d.getFullname());
            ps.setString(3,d.getEmail());
            ps.setString(4,d.getPhone_number());
            ps.setString(5,d.getAddress());
            ps.setString(6,d.getNote());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(7, df.format(new Date()));
            ps.setInt(8, d.getStatus());
            ps.setInt(9, d.getTotal_money()); 
            ps.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<Orders> layTatCa(){
        ArrayList<Orders> list = new ArrayList<>();
        
        String sql = "select * from orders order by status asc, order_date desc";
        try{
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Orders o = new Orders();
                o.setId(rs.getInt("id"));
                UsersDAO u = new UsersDAO();
                o.setUser_id(u.layTheoId(rs.getInt("user_id")));
                o.setFullname(rs.getString("fullname"));
                o.setEmail(rs.getString("email"));
                o.setPhone_number(rs.getString("phone_number"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                o.setOrder_date(rs.getString("order_date"));
                o.setStatus(rs.getInt("status"));
                o.setTotal_money(rs.getInt("total_money"));
                list.add(o);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Orders layTheoId(int id){
        Orders o = new Orders();
        
        String sql = "select * from orders where id="+id;
        try{
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                o.setId(rs.getInt("id"));
                UsersDAO u = new UsersDAO();
                o.setUser_id(u.layTheoId(rs.getInt("user_id")));
                o.setFullname(rs.getString("fullname"));
                o.setEmail(rs.getString("email"));
                o.setPhone_number(rs.getString("phone_number"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                o.setOrder_date(rs.getString("order_date"));
                o.setStatus(rs.getInt("status"));
                o.setTotal_money(rs.getInt("total_money"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return o;
    }
    
    public Orders layTheoTime(String created){
        Orders o = new Orders();
        
        String sql = "select * from orders where order_date='"+created+"'"; 
        try{
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                o.setId(rs.getInt("id"));
                UsersDAO u = new UsersDAO();
                o.setUser_id(u.layTheoId(rs.getInt("user_id")));
                o.setFullname(rs.getString("fullname"));
                o.setEmail(rs.getString("email"));
                o.setPhone_number(rs.getString("phone_number"));
                o.setAddress(rs.getString("address"));
                o.setNote(rs.getString("note"));
                o.setOrder_date(rs.getString("order_date"));
                o.setStatus(rs.getInt("status"));
                o.setTotal_money(rs.getInt("total_money"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return o;
    }
    
    public void update(int p,int status){
        String sql = "update orders set status=? where id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,status);
            ps.setInt(2, p); 
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
}
