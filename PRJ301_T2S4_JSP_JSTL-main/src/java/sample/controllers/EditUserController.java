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
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author ACER
 */
@WebServlet(name="EditUserController", urlPatterns={"/EditUserController"})
public class EditUserController extends HttpServlet {
   
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
            out.println("<title>Servlet EditUserController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserController at " + request.getContextPath () + "</h1>");
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
        String fullName =request.getParameter("fullName");
        String id_raw=request.getParameter("id");
        try {
            int id=Integer.parseInt(id_raw);
            int size=fullName.length();
        if(size<5 ||size>20){
            request.setAttribute("EDIT_ERROR", "Name must be in 5-20 character.");
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }else{
            UserDAO userDao= new UserDAO();
            boolean check=false;
            check=userDao.editNameUser(fullName, id);
            if(check){
                HttpSession session = request.getSession();
                UserDTO loginUser = (UserDTO)session.getAttribute("LOGIN_USER");
                loginUser.setFullName(fullName);
                request.setAttribute("EDIT_SUCCESS", "Edit sucsses");
                
                request.getRequestDispatcher("user.jsp").forward(request, response);
            }else{
                request.setAttribute("EDIT_ERROR", "Edit failed");
                request.getRequestDispatcher("user.jsp").forward(request, response);
            }
      
        }
        } catch (NumberFormatException e) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditUserController.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
