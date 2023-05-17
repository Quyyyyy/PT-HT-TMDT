/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package view;

import controller.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author HP
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
//        HttpSession session = request.getSession(true);
//        Cart cart = null;
//        Object o = session.getAttribute("cart");
//        //co rồi
//        if(o!=null){
//            cart = (Cart)o;
//        }else{
//            cart = new Cart();
//        }
//        String id_raw = request.getParameter("id");
//        String num_raw = request.getParameter("num");
//        int id,num;
//        try{
//            id = Integer.parseInt(id_raw);
//            num= Integer.parseInt(num_raw);
//            if(num==-1 && cart.getNumById(id)<=1){
//                cart.removeItem(id); 
//            }else{
//                ProductDAO pdb = new ProductDAO();
//                Product p = pdb.layTheoId(id);
//                int price = p.getPrice()*num;
//                Item t = new Item(p,num,price);
//                cart.addItems(t); 
//            }
//        } catch(NumberFormatException e){
//            
//        } 
//        List<Item> list = cart.getItems();
//        session.setAttribute("cart", cart);
//        session.setAttribute("size", list.size());
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        //co rồi
        if(o!=null){
            cart = (Cart)o;
        }else{
            cart = new Cart();
        }
        String id_raw = request.getParameter("id");
        String num_raw = request.getParameter("num");
        int num,id;
        try{
            num = Integer.parseInt(num_raw);
            id = Integer.parseInt(id_raw);
            ProductDAO pdb = new ProductDAO();
            Product p = pdb.layTheoId(id);
            int price = p.getDiscount();
            Item t = new Item(p,num,price);
            cart.addItems(t); 
        } catch(NumberFormatException e){
            num = 1;
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        //request.getRequestDispatcher("detail.jsp").forward(request, response); 
        //request.getRequestDispatcher("cart.jsp").forward(request, response);

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
//        HttpSession session = request.getSession(true);
//        Cart cart = null;
//        Object o = session.getAttribute("cart");
//        //co rồi
//        if(o!=null){
//            cart = (Cart)o;
//        }else{
//            cart = new Cart();
//        }
//        int id = Integer.parseInt(request.getParameter("id"));
//        cart.removeItem(id); 
//        List<Item> list = cart.getItems();
//        session.setAttribute("cart", cart);
//        session.setAttribute("size", list.size());
//        request.getRequestDispatcher("cart.jsp").forward(request, response);
          HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        //co rồi
        if(o!=null){
            cart = (Cart)o;
        }else{
            cart = new Cart();
        }
        String id_raw = request.getParameter("id");
        String num_raw = request.getParameter("num");
        int id,num;
        try{
            id = Integer.parseInt(id_raw);
            num= Integer.parseInt(num_raw);
            if(num==0){
                cart.removeItem(id);
            }else if(num==-1 && cart.getNumById(id)<=1){
                cart.removeItem(id); 
            }else{
                ProductDAO pdb = new ProductDAO();
                Product p = pdb.layTheoId(id);
                int price = p.getPrice();
                Item t = new Item(p,num,price);
                cart.addItems(t); 
            }
        } catch(NumberFormatException e){
            
        }  
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
