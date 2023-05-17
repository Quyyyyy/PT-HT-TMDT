/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;

/**
 *
 * @author HP
 */
public class CategoryDAO extends DBContext{
    public void themCate(Category c){
        String sql = "insert into category(name) values(?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,c.getName());
            ps.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public ArrayList<Category> layTatCa(){
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                list.add(c);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Category layTheoId(int id){
        Category c = new Category();
        String sql = "select * from category where id=" + id;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return c;
    }
    
    public Category layTheoTen(String name){
        Category c = new Category();
        String sql = "select * from category where name='"+name+"'";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return c;
    }
    
    public void update(Category p){
        String sql = "update category set name=? where id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,p.getName());
            ps.setInt(2, p.getId()); 
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void delete(int id){
        String sql = "delete from category where id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,id);            
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
}
