/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.shopping.Category;
import sample.shopping.Product;
import sample.user.DAO;

/**
 *
 * @author ACER
 */
@WebServlet(name="ManagementUpdateProductController", urlPatterns={"/ManagementUpdateProductController"})
public class ManagementUpdateProductController extends HttpServlet {
   
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
            out.println("<title>Servlet ManagementUpdateProductController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagementUpdateProductController at " + request.getContextPath () + "</h1>");
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
        String cid=request.getParameter("cidSelected");
        if(cid.isEmpty()){
            cid="0";
        }
        String inputName=request.getParameter("productNameInputed");
        String id_raw= request.getParameter("id");
        String name= request.getParameter("name");
        String price_raw= request.getParameter("price");
        String description= request.getParameter("description");
        String category_raw=request.getParameter("category");
        String quantity_raw=request.getParameter("quantity");
        try{
            int id=Integer.parseInt(id_raw);
            double price=Double.parseDouble(price_raw);
            int category=Integer.parseInt(category_raw);
            int quantity=Integer.parseInt(quantity_raw);
            DAO d=new DAO();
            Category c=d.getCategoryById(category);
            Product product=new Product(id, name, price, description, "", c, quantity);
            boolean checkUpdate=d.updateProduct(product);
            request.setAttribute("CID_SELECTED", cid);
            request.setAttribute("PRODUCT_NAME_SELECTED", inputName);
            if(checkUpdate){
                
                request.setAttribute("UPDATE_SUCCESS", "Update succes");
                request.getRequestDispatcher("ManagementSearchProductController?categoryID="+cid+"&productName="+inputName).forward(request, response);
            }
        }catch(NumberFormatException e){
            request.setAttribute("UPDATE_ERROR", "Input is invalid");
            request.getRequestDispatcher("ManagementSearchProductController?categoryID="+cid+"&productName="+inputName).forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManagementUpdateProductController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManagementUpdateProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
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
        doGet(request, response);
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
