/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package view;

import controller.CategoryDAO;
import controller.ProductDAO;
import controller.ReviewDAO;
import controller.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;
import model.Review;
import model.Users;

/**
 *
 * @author HP
 */
@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO p = new ProductDAO();
        Product sp = p.layTheoId(id);
        request.setAttribute("data", sp);
        ReviewDAO r = new ReviewDAO();
        ArrayList<Review> list = r.layTheoId(id);
        //request.setAttribute("data1", list);
        Collections.sort(list); 
        int page ,numperpage =5;
        String xpage = request.getParameter("page");
        if (xpage ==null){
            page =1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage , list.size());
        ArrayList<Review> ldg = new ArrayList<>();
        for (int i = start; i < end; i++) {
            ldg.add(list.get(i));
        }
        int num= (list.size()%numperpage==0?(list.size()/numperpage):(list.size()/numperpage+1));
        request.setAttribute("data1", ldg);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        CategoryDAO c = new CategoryDAO();
        ArrayList<Product> l = p.layTheoLoai(c.layTheoTen(sp.getCategory_id().getName())); 
        request.setAttribute("data2", l);
        request.getRequestDispatcher("detail.jsp").forward(request, response); 
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //String star_raw = "";
        String idu_raw = request.getParameter("id_u");
        String idp_raw = request.getParameter("id_p");
        String star_raw = request.getParameter("star");
        String content = request.getParameter("content");
        UsersDAO u = new UsersDAO();
        ProductDAO p = new ProductDAO();
        ReviewDAO r = new ReviewDAO();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int idu,idp,star;
        try{
            idp = Integer.parseInt(idp_raw); 
            idu = Integer.parseInt(idu_raw);
            star = Integer.parseInt(star_raw);
            Product sp = p.layTheoId(idp);
            Users a = u.layTheoId(idu);
            request.setAttribute("data", sp);
            CategoryDAO c = new CategoryDAO();
            ArrayList<Product> l = p.layTheoLoai(c.layTheoTen(sp.getCategory_id().getName())); 
            request.setAttribute("data2", l);
            
            if(star==0){ 
                //star = Integer.parseInt(star_raw);
                Review f = r.check(idu, idp);
                if(f==null){
                    Review b = new Review(0,a,sp,0,content,df.format(new Date()),0); 
                    r.themReview(b);
                }else{
                    Review b = new Review(f.getId(),a,sp,f.getStar(),content,df.format(new Date()),0); 
                    r.update(b); 
                }
            } else if(star!=0){   
                //star = Integer.parseInt(star_raw);
                Review f = r.check(idu, idp);
                if(f==null){
                    Review b = new Review(0,a,sp,star,content,df.format(new Date()),0); 
                    r.themReview(b);
                }else{
                    Review b = new Review(f.getId(),a,sp,star,content,df.format(new Date()),0); 
                    r.update(b); 
                }
            }
//            } else if(star_raw.equals(null) || star_raw.isEmpty()){ 
//                //star = Integer.parseInt(star_raw);
//                Review f = r.check(idu, idp);
//                if(f==null){
//                    Review b = new Review(0,a,sp,0,content,df.format(new Date()),0); 
//                    r.themReview(b);
//                }else{
//                    Review b = new Review(f.getId(),a,sp,f.getStar(),content,df.format(new Date()),0); 
//                    r.update(b); 
//                }
//            }
            ArrayList<Review> list = r.layTheoId(idp);
            Collections.sort(list); 
        int page ,numperpage =5;
        String xpage = request.getParameter("page");
        if (xpage ==null){
            page =1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage , list.size());
        ArrayList<Review> ldg = new ArrayList<>();
        for (int i = start; i < end; i++) {
            ldg.add(list.get(i));
        }
        int num= (list.size()%numperpage==0?(list.size()/numperpage):(list.size()/numperpage+1));
        request.setAttribute("data1", ldg);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
            //request.setAttribute("data1", list);
            //request.getRequestDispatcher("detail.jsp").forward(request, response); 
        } catch(NumberFormatException e){
            System.out.println(e);
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response); 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
