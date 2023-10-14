/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.shopping.Category;
import sample.shopping.Product;
import sample.shopping.ProductError;
import sample.user.DAO;

/**
 *
 * @author ACER
 */
@WebServlet(name="AddProductController", urlPatterns={"/AddProductController"})
public class AddProductController extends HttpServlet {
   
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
            out.println("<title>Servlet AddProductController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
       String id_raw=request.getParameter("productId");
       String name=request.getParameter("productName");
       String price_raw=request.getParameter("productPrice");
       String description=request.getParameter("productDescription");
       String image=request.getParameter("productImage");
       String category_raw=request.getParameter("productCategory");
       String quantity_raw=request.getParameter("productQuantity");
       try{
           boolean isValid=true;
           int id=Integer.parseInt(id_raw);
           double price=Double.parseDouble(price_raw);
           int category=Integer.parseInt(category_raw);
           int quantity=Integer.parseInt(quantity_raw);
           DAO d= new DAO();
           ProductError productError=new  ProductError();
           if(d.checkDuplicateID(id)){
               productError.setId("ID is existed.");
            isValid=false;   
           }
           if(name.length()<3||name.length()>20){
               productError.setName("Name have 3-20 character");
               isValid=false;
               
           }
           if(price<0){
               productError.setPrice("Price must over 0");
               isValid=false;
               
           }
           if(description.length()<=0|| description==null){
               productError.setDesciption("Not be blank");
           isValid=false;
           }
           if(image.length()<=0||image==null){
               productError.setImage("Not be blank");
               isValid=false;
           }
           if(quantity<0){
               productError.setQuantity("Quantity must over 0");
               isValid=false;
           }
           
           if(!isValid){
               request.setAttribute("PRODUCT_ERROR",productError);
               request.getRequestDispatcher("addproduct.jsp").forward(request, response);
           }else{
               Category c= d.getCategoryById(category);
               Product product=new Product(id, name, price, description, image, c, quantity);
               boolean check=d.addProduct(product);
               if(check){
                request.setAttribute("ADD_SUCCESS", "Update succes");
                request.getRequestDispatcher("addproduct.jsp").forward(request, response);
               }
           }
           
           
           
           
       }catch(NumberFormatException e){
           request.setAttribute("ADD_ERROR", "Input is invalid");
           request.getRequestDispatcher("addproduct.jsp").forward(request, response);
       } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
