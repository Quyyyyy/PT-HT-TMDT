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
import model.Users;



/**
 *
 * @author HP
 */
public class UsersDAO extends DBContext{
    public void themUser(Users p){
        String sql = "insert into user(fullname,email,phone_number,address,password,role_id,created_at,updated_at,deleted) values(?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getFullname());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPhone_number());
            ps.setString(4, p.getAddress());
            ps.setString(5, p.getPassword());
            ps.setInt(6, p.getRole_id().getId());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(7, df.format(new Date())); 
            ps.setString(8, df.format(new Date()));  
            ps.setInt(9, p.getDeleted());
            ps.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<Users> layTatCa(){
        ArrayList<Users> list = new ArrayList<>();
        
        String sql = "select * from user where deleted=0";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Users u = new Users();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password")); 
                RoleDAO ro = new RoleDAO();
                u.setRole_id(ro.layTheoId(rs.getInt("role_id"))); 
                u.setCreated_at(rs.getString("created_at"));
                u.setUpdated_at(rs.getString("updated_at"));
                u.setDeleted(rs.getInt("deleted")); 
                list.add(u);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Users layTheoId(int id){
        Users u = new Users();
        String sql = "select * from user where deleted=0 and id=" + id;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setPhone_number(rs.getString("phone_number"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password")); 
                RoleDAO ro = new RoleDAO();
                u.setRole_id(ro.layTheoId(rs.getInt("role_id"))); 
                u.setCreated_at(rs.getString("created_at"));
                u.setUpdated_at(rs.getString("updated_at"));
                u.setDeleted(rs.getInt("deleted")); 
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return u;
    }
    
    public Users check(String user,String pass){
        String sql = "select * from user  where email=? and password=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,user);
            st.setString(2,pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                RoleDAO ro = new RoleDAO();
                return new Users(rs.getInt("id"),rs.getString("fullname"),user, rs.getString("phone_number"),
                        rs.getString("address"),pass,ro.layTheoId(rs.getInt("role_id")),rs.getString("created_at"), rs.getString("updated_at"),rs.getInt("deleted"));
            }
        } catch(SQLException e){
            
        }
        return null;
    }
    
    public Users ktpass(String pass){
        String sql = "select * from user where password=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                RoleDAO ro = new RoleDAO();
                return new Users(rs.getInt("id"),rs.getString("fullname"),rs.getString("email"), rs.getString("phone_number"),
                        rs.getString("address"),pass,ro.layTheoId(rs.getInt("role_id")),rs.getString("created_at"), rs.getString("updated_at"),rs.getInt("deleted"));
            }
        } catch(SQLException e){
            
        }
        return null;
    }
    
    public Users ktemail(String email){
        String sql = "select * from user where email=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1,email);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                RoleDAO ro = new RoleDAO();
                return new Users(rs.getInt("id"),rs.getString("fullname"),email, rs.getString("phone_number"),
                        rs.getString("address"),rs.getString("password"),ro.layTheoId(rs.getInt("role_id")),rs.getString("created_at"), rs.getString("updated_at"),rs.getInt("deleted"));
            }
        } catch(SQLException e){
            
        }
        return null;
    }
    
    public void delete(int id){
        
        String sql="update user set deleted=1 where id=?";
        try{
            
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,id);
            st.executeUpdate();
             
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void update(Users p){
        String sql = "update user set fullname=?,email=?,phone_number=?,address=?,password=?,role_id=?,updated_at=?,deleted=? where id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getFullname());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPhone_number());
            ps.setString(4, p.getAddress());
            ps.setString(5, p.getPassword());
            ps.setInt(6, p.getRole_id().getId());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(7, df.format(new Date()));  
            ps.setInt(8, p.getDeleted());
            ps.setInt(9,p.getId());
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
}
