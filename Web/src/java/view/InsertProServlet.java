/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package view;

import controller.CategoryDAO;
import controller.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Category;
import model.Product;

/**
 *
 * @author HP
 */
@WebServlet(name = "InsertProServlet", urlPatterns = {"/admin/product/insert"})
public class InsertProServlet extends HttpServlet {

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
            out.println("<title>Servlet InsertProServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertProServlet at " + request.getContextPath() + "</h1>");
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
        CategoryDAO c = new CategoryDAO();
        ArrayList<Category> list = c.layTatCa();
        request.setAttribute("data", list);
        request.getRequestDispatcher("insert.jsp").forward(request, response); 
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
        String title = request.getParameter("title");
        String symbol = request.getParameter("symbol");
        String pin_raw = request.getParameter("pin");
        String ram_raw = request.getParameter("ram");
        String rom_raw = request.getParameter("rom");
        String cpu = request.getParameter("CPU");
        String KTmanHinh = request.getParameter("KTmanHinh");
        String cameraTruoc = request.getParameter("cameraTruoc");
        String cameraSau = request.getParameter("cameraSau");
        String des = request.getParameter("description"); 
        String thumbnail = request.getParameter("thumbnail");
        String category_id = request.getParameter("category_id");
        String price_raw = request.getParameter("price");
        String dis_raw = request.getParameter("discount");
        try{
            int pin = Integer.parseInt(pin_raw);
            int ram = Integer.parseInt(ram_raw);
            int rom = Integer.parseInt(rom_raw);
            int price = Integer.parseInt(price_raw);
            int dis = Integer.parseInt(dis_raw);
            int cate = Integer.parseInt(category_id);
            
//            String realPath = request.getServletContext().getRealPath("/img");
//            String filename = Paths.get(thumbnail.getSubmittedFileName()).getFileName().toString();
//            if(!Files.exists(Paths.get(realPath))){
//                Files.createDirectory(Paths.get(realPath));
//            }
//            thumbnail.write(realPath+"/"+filename);
    
            String filename = "img/products/"+thumbnail;
            CategoryDAO c = new CategoryDAO();
            Category d = c.layTheoId(cate);
            ProductDAO p = new ProductDAO();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Product t = new Product(0,d,title,price,dis,filename,des,df.format(new Date()),
                    df.format(new Date()),0,symbol,pin,ram,rom,cpu,KTmanHinh,cameraTruoc,cameraSau);
            p.themPro(t);  
            response.sendRedirect("/Web/admin/product/list"); 
        } catch(NumberFormatException e){
            System.out.println(e);
        }
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
