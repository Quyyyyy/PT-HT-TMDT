/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package view;

import controller.Order_detailsDAO;
import controller.OrdersDAO;
import controller.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Order_details;
import model.Orders;

/**
 *
 * @author HP
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String id_raw = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String sdt = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String add = request.getParameter("address");
        String note = request.getParameter("note");
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if(o!=null){
            int id = Integer.parseInt(id_raw);
            cart = (Cart) o;
            OrdersDAO or = new OrdersDAO();
            Order_detailsDAO od = new Order_detailsDAO();
            UsersDAO u = new UsersDAO();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = df.format(new Date()); 
            Orders da = new Orders(0,u.layTheoId(id),fullname,email,sdt,add,note,time,0,cart.getTotalMoney());
            or.themOrd(da);
            Orders k = or.layTheoTime(time);
            
            for(Item i:cart.getItems()){
                int total_money = i.getPrice()*i.getNum();
                Order_details j = new Order_details(0,k,i.getP(),i.getPrice(),i.getNum(),total_money);
                od.themOrderdetai(j);
                //cart.removeItem(i.getP().getId());  
            }
            session.removeAttribute("cart"); 
            request.getRequestDispatcher("complete.jsp").forward(request, response); 
        }
        //request.getRequestDispatcher("complete.jsp").forward(request, response);
            //response.sendRedirect("/Web/index");  
//        } else{
//            request.getRequestDispatcher("checkout.jsp").forward(request, response); 
//        }
        
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
