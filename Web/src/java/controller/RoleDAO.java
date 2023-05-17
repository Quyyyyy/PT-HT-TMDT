/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Role;

/**
 *
 * @author HP
 */
public class RoleDAO extends DBContext{
    public Role layTheoId(int id){
        Role r = new Role();
        String sql = "select * from role where id=" + id;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                r.setId(rs.getInt("id")); 
                r.setName(rs.getString("name")); 
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return r;
    }
    
    public ArrayList<Role> layTatCa(){
        ArrayList<Role> list = new ArrayList<>();
        String sql = "select * from role";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Role r = new Role();
                r.setId(rs.getInt("id")); 
                r.setName(rs.getString("name")); 
                list.add(r);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}
