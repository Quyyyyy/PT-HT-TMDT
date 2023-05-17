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
import model.Review;

/**
 *
 * @author HP
 */
public class ReviewDAO extends DBContext{
    public void themReview(Review r){
        String sql = "insert into review(id_user,id_product,star,content,created_at,deleted) values(?,?,?,?,?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,r.getId_user().getId());
            ps.setInt(2,r.getId_product().getId());
            ps.setInt(3, r.getStar());
            ps.setString(4,r.getContent());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(5,df.format(new Date()));
            ps.setInt(6, r.getDeleted());
            ps.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<Review> layTheoId(int id){
        ArrayList<Review> list = new ArrayList<>();
        String sql = "select * from review where id_product="+id;
        try{
           PreparedStatement ps = conn.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               Review r = new Review();
               r.setId(rs.getInt("id"));
               UsersDAO u = new UsersDAO();
               r.setId_user(u.layTheoId(rs.getInt("id_user")));
               ProductDAO p = new ProductDAO();
               r.setId_product(p.layTheoId(rs.getInt("id_product")));
               r.setStar(rs.getInt("star"));
               r.setContent(rs.getString("content"));
               r.setCreated_at(rs.getString("created_at"));
               r.setDeleted(rs.getInt("deleted"));
               list.add(r);
           }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public int tinhSoDanhGia (int id,int star){  
        String sql;
        if(star ==0){ // so sao bang 0 la lay tat ca , bang 1 la lay so danh gia 1 sao
            sql = "select COUNT(id) AS count from review where id_product=" + id ;
        }else{
            sql = "select COUNT(id) AS count from review where id_product=" + id +"and star="+star;
        }
        int dem=0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){

                dem = rs.getInt("count");                     
            }            
        } catch (SQLException e) {
            System.out.println(e);
        }       
        return dem;
    }
    
    public float tinhSao(int id){  
        String sql = "select SUM(star) AS sum, COUNT(star) AS count from review where star != 0 and id_product=" + id;
        int tong =0, dem=0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                tong = rs.getInt("sum");
                dem = rs.getInt("count");                     
            }            
        } catch (SQLException e) {
            System.out.println(e);
        }       
        if(dem ==0) return 0;
        else return (float)tong/(float)dem;
    }
    
    public Review layTheoIdpIdu(int idp,int idu){
        Review r = new Review();
        String sql = "slect * from review where id_product="+idp+" and id_user="+idu;
        try{
           PreparedStatement ps = conn.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               r.setId(rs.getInt("id"));
               UsersDAO u = new UsersDAO();
               r.setId_user(u.layTheoId(rs.getInt("id_user")));
               ProductDAO p = new ProductDAO();
               r.setId_product(p.layTheoId(rs.getInt("id_product")));
               r.setStar(rs.getInt("star"));
               r.setContent(rs.getString("content"));
               r.setCreated_at(rs.getString("created_at"));
               r.setDeleted(rs.getInt("deleted"));
           }
        }catch(SQLException e){
            System.out.println(e);
        }
        return r;
    }
    
    public void update(Review r){
        String sql = "update review set content=?,star=?,created_at=? where id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,r.getContent());
            ps.setInt(2,r.getStar());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(3,df.format(new Date())); 
            ps.setInt(4,r.getId());
            ps.executeUpdate();
        } catch(SQLException e){
            System.out.println(e); 
        }
    }
    
    public Review check(int idu,int idp){
         String sql = "select * from review  where id_user=? and id_product=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,idu);
            st.setInt(2,idp); 
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                RoleDAO ro = new RoleDAO();
                UsersDAO u = new UsersDAO();
                ProductDAO p = new ProductDAO();
                return new Review(rs.getInt("id"),u.layTheoId(rs.getInt("id_user")),p.layTheoId(rs.getInt("id_product")), rs.getInt("star"),
                        rs.getString("content"),rs.getString("created_at"),rs.getInt("deleted"));
            }
        } catch(SQLException e){
            
        }
        return null;
    }
}
