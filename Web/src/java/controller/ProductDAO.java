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
import model.Category;
import model.Product;

/**
 *
 * @author HP
 */
public class ProductDAO extends DBContext{
    public void themPro(Product p){
        String sql = "insert into product(category_id,title,price,discount,thumbnail,description,created_at,updated_at,"
                + "deleted,symbol,pin,ram,rom,CPU,KTmanHinh,cameraTruoc,cameraSau) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,p.getCategory_id().getId());
            ps.setString(2,p.getTitle());
            ps.setInt(3,p.getPrice());
            ps.setInt(4, p.getDiscount());
            ps.setString(5,p.getThumbnail());
            ps.setString(6,p.getDescription());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(7, df.format(new Date())); 
            ps.setString(8, df.format(new Date())); 
            ps.setInt(9, p.getDeleted());
            ps.setString(10,p.getSymbol());
            ps.setInt(11, p.getPin());
            ps.setInt(12, p.getRam());
            ps.setInt(13, p.getRom());
            ps.setString(14,p.getCPU());
            ps.setString(15, p.getKTmanHinh());
            ps.setString(16,p.getCameraTruoc());
            ps.setString(17, p.getCameraSau());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public ArrayList<Product> layTatCa(){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from product where deleted=0";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product t = new Product();
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau")); 
                list.add(t);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Product layTheoId(int id){
        Product t = new Product();
        String sql = "select * from product where deleted=0 and id="+id;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return t;
    }
    
    public ArrayList<Product> layTheoMucGia(int gia){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from product where deleted=0 and discount<="+gia;
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product t = new Product();
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau")); 
                list.add(t);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Product> layTheoHang(String symbol){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from product where deleted=0 and symbol ='"+symbol+"'";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product t = new Product();
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau")); 
                list.add(t);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Product layTheoTen(String title){
        Product t = new Product();
        String sql = "select * from product where deleted=0 and title='"+title+"'";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau"));
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return t;
    }
    
    public void update(Product p){
        String sql = "update product set category_id=?,title=?,price=?,discount=?,thumbnail=?,description=?,updated_at=?,"
                + "deleted=?,symbol=?,pin=?,ram=?,rom=?,CPU=?,KTmanHinh=?,cameraTruoc=?,cameraSau=? where id=?";
        try{    
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,p.getCategory_id().getId());
            ps.setString(2,p.getTitle());
            ps.setInt(3,p.getPrice());
            ps.setInt(4, p.getDiscount());
            ps.setString(5,p.getThumbnail());
            ps.setString(6,p.getDescription());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(7, df.format(new Date())); 
            ps.setInt(8, p.getDeleted());
            ps.setString(9,p.getSymbol());
            ps.setInt(10, p.getPin());
            ps.setInt(11, p.getRam());
            ps.setInt(12, p.getRom());
            ps.setString(13,p.getCPU());
            ps.setString(14, p.getKTmanHinh());
            ps.setString(15,p.getCameraTruoc());
            ps.setString(16, p.getCameraSau());
            ps.setInt(17, p.getId()); 
            ps.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void update1(Product p){
        String sql = "update product set category_id=?,title=?,price=?,discount=?,description=?,updated_at=?,"
                + "deleted=?,symbol=?,pin=?,ram=?,rom=?,CPU=?,KTmanHinh=?,cameraTruoc=?,cameraSau=? where id=?";
        try{    
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,p.getCategory_id().getId());
            ps.setString(2,p.getTitle());
            ps.setInt(3,p.getPrice());
            ps.setInt(4, p.getDiscount());
            ps.setString(5,p.getDescription());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ps.setString(6, df.format(new Date())); 
            ps.setInt(7, p.getDeleted());
            ps.setString(8,p.getSymbol());
            ps.setInt(9, p.getPin());
            ps.setInt(10, p.getRam());
            ps.setInt(11, p.getRom());
            ps.setString(12,p.getCPU());
            ps.setString(13, p.getKTmanHinh());
            ps.setString(14,p.getCameraTruoc());
            ps.setString(15, p.getCameraSau());
            ps.setInt(16, p.getId()); 
            ps.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public void delete(int id){
        
        String sql="update product set deleted=1 where id=?";
        try{
            
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,id);
            st.executeUpdate();
             
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public ArrayList<Product> layTheoLoai(Category b){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from product where deleted=0 and category_id ="+b.getId()+" order by product.updated_at desc limit 0,4";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product t = new Product();
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau")); 
                list.add(t);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Product> laySPMoi(){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from product where deleted=0 order by updated_at desc limit 0,4";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product t = new Product();
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau")); 
                list.add(t);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Product> layTheoYeuCau(String thuonghieu,String gia,String sapxep){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select product.*, category.name as category_name from product "
                + "left join category on product.category_id = category.id where deleted=0";
            String sqlGia = "";
            String sqlName = "";
            String sqlKmai = "";
            //boolean x = false;
            if (gia != null && gia != ""){ 
                if(gia.trim().equals("duoi2trieu")){
                    sqlGia = "discount < 2000000";
                }
                if(gia.trim().equals("tu2den4trieu")){
                    sqlGia = "discount >= 2000000 and discount < 4000000";
                }
                if(gia.trim().equals("tu4den7trieu")){
                    sqlGia = "discount >= 4000000 and discount < 7000000";
                }
                if(gia.trim().equals("tu7den13trieu")){
                    sqlGia = "discount >= 7000000 and discount < 13000000";
                }
                if(gia.trim().equals("tren13trieu")){
                    sqlGia = "discount >= 13000000";
                }
            }else{
                sqlGia = null;
            }

            if(thuonghieu!=null && thuonghieu != ""){
                sqlName= "symbol like '%"+ thuonghieu +"%'";
            }else{
                sqlName = null;
            }

            if(sqlGia!=null){
                sql = sql.concat(" and ");
                sql = sql.concat(sqlGia);
                //x = true;
            }

            if(sqlName != null){
//                if(x == false){
//                    sql = sql.concat(" where ");
//                    sql = sql.concat(sqlName);
//                    x = true;
                //}else{
                    sql = sql.concat(" and ");
                    sql = sql.concat(sqlName);
                //}
            }
        
        if(sapxep != null && sapxep != ""){
            if(sapxep.trim().equals("giatangdan")){
                sql = sql.concat(" order by discount ASC");
            }
           if(sapxep.trim().equals("giagiamdan")){
                sql = sql.concat(" order by discount DESC");
            }
        }
        sql = sql.trim();
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product t = new Product();
                CategoryDAO c = new CategoryDAO();
                t.setId(rs.getInt("id"));
                t.setCategory_id(c.layTheoId(rs.getInt("category_id")));
                t.setTitle(rs.getString("title"));
                t.setPrice(rs.getInt("price"));
                t.setDiscount(rs.getInt("discount"));
                t.setThumbnail(rs.getString("thumbnail"));
                t.setDescription(rs.getString("description"));
                t.setCreated_at(rs.getString("created_at"));
                t.setUpdated_at(rs.getString("updated_at"));
                t.setDeleted(rs.getInt("deleted"));
                t.setSymbol(rs.getString("symbol"));
                t.setPin(rs.getInt("pin"));
                t.setRam(rs.getInt("ram"));
                t.setRom(rs.getInt("rom"));
                t.setCPU(rs.getString("CPU"));
                t.setKTmanHinh(rs.getString("KTmanHinh"));
                t.setCameraTruoc(rs.getString("cameraTruoc"));
                t.setCameraSau(rs.getString("cameraSau")); 
                list.add(t);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}
