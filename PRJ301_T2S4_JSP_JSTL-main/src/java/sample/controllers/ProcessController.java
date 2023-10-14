/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Item;
import sample.shopping.Product;
import sample.user.ProductDAO;

/**
 *
 * @author ACER
 */
@WebServlet(name="ProcessController", urlPatterns={"/ProcessController"})
public class ProcessController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session=request.getSession();
        Cart cart=null;
        Object o=session.getAttribute("cart");
        if(o!=null){
            cart=(Cart)o;
        }else{
            cart=new Cart();
        }
        
        String tquantity=request.getParameter("quantity").trim();
        String tid=request.getParameter("id");
        int id,quantity;
        try {
            id=Integer.parseInt(tid);
            quantity=Integer.parseInt(tquantity);
            if(quantity<=0){
                cart.removeItem(id);
            }else{
                ProductDAO pdb=new ProductDAO();
                Product p=pdb.getProductByID(id);
                double price=p.getPrice();
                Item t=new Item(p, quantity, price);
                cart.addItemByChangeQuantity(t);
            }
        } catch (NumberFormatException e) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProcessController.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Item> list=cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("view_cart.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession();
        Cart cart=null;
        Object o=session.getAttribute("cart");
        if(o!=null){
            cart=(Cart)o;
        }else{
            cart=new Cart();
        }
        int id=Integer.parseInt(request.getParameter("id"));
        cart.removeItem(id);
        
         List<Item> list=cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("view_cart.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
