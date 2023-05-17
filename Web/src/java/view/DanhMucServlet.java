/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package view;

import controller.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author HP
 */
@WebServlet(name = "DanhMucServlet", urlPatterns = {"/category"})
public class DanhMucServlet extends HttpServlet {

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
            out.println("<title>Servlet DanhMucServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DanhMucServlet at " + request.getContextPath() + "</h1>");
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
        String thuonghieu = "";
        String sapxep = "";
        String khuyenmai = "";
        String gia = "";
        thuonghieu = request.getParameter("thuong-hieu");
        sapxep = request.getParameter("sap-xep");
        khuyenmai = request.getParameter("khuyen-mai");
        gia = request.getParameter("gia");
        ProductDAO p = new ProductDAO();
        ArrayList<Product> list = p.layTheoYeuCau(thuonghieu,gia, sapxep); 
        Collections.sort(list); 
        int page ,numperpage =8;
        String xpage = request.getParameter("page");
        if (xpage ==null){
            page =1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start, end;
         start = (page-1)*numperpage;
        end = Math.min(page*numperpage , list.size());
        ArrayList<Product> ldg = new ArrayList<>();
        for (int i = start; i < end; i++) {
            ldg.add(list.get(i));
        }
        int num= (list.size()%numperpage==0?(list.size()/numperpage):(list.size()/numperpage+1));
        request.setAttribute("data", ldg);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        //request.setAttribute("data", list);
        request.getRequestDispatcher("category.jsp").forward(request, response); 
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
        processRequest(request, response);
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
