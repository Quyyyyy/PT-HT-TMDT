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
import model.Feedback;

/**
 *
 * @author HP
 */
public class FeedbackDAO extends DBContext{
    public void themFeed(Feedback fb){
        String sql = "insert into feedback(fullname,email,phone_number,subject_name,note,status,created_at,updated_at) values(?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,fb.getFullname());
            ps.setString(2,fb.getEmail());
            ps.setString(3,fb.getPhone_number());
            ps.setString(4,fb.getSubject_name());
            ps.setString(5,fb.getNote());
            ps.setInt(6,fb.getStatus());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(7,df.format(new Date()));
            ps.setString(8,df.format(new Date()));
            ps.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<Feedback> layTatCa(){
        ArrayList<Feedback> list = new ArrayList<>();
        String sql = "select * from feedback order by status asc, updated_at desc";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setFullname(rs.getString("fullname"));
                f.setEmail(rs.getString("email"));
                f.setPhone_number(rs.getString("phone_number"));
                f.setSubject_name(rs.getString("subject_name"));
                f.setNote(rs.getString("note"));
                f.setStatus(rs.getInt("status"));
                f.setCreated_at(rs.getString("created_at"));
                f.setUpdated_at(rs.getString("updated_at"));
                list.add(f);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public void update(int id){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sql = "update feedback set status=1, updated_at ='"+df.format(new Date())+"' where id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id); 
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
}
