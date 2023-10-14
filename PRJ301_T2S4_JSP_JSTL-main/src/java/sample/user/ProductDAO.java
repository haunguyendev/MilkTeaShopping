/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.shopping.Category;
import sample.shopping.Product;
import sample.utils.DBUtils;


/**
 *
 * @author ACER
 */
public class ProductDAO {
    public List<Product> getAll() throws ClassNotFoundException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        List<Product> list = new ArrayList<>();
        String sql="select * from Products";
        try{
            conn=DBUtils.getConnection();
            ptm=conn.prepareStatement(sql);
            rs=ptm.executeQuery();
            while(rs.next()){
                DAO d = new DAO();
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                
                p.setPrice(rs.getDouble("price"));
               
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                Category c = d.getCategoryById(rs.getInt("cid"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategory(c);
                list.add(p);
                

            }
        }catch(SQLException e){
            
        }
        return list;
    }
    
    public Product getProductByID(int id) throws ClassNotFoundException{
        
         Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
                String sql="select * from Products where id=?";
        try{
            conn=DBUtils.getConnection();
             ptm=conn.prepareStatement(sql);
            ptm.setInt(1, id);
            rs=ptm.executeQuery();
            if(rs.next()){
                DAO d = new DAO();
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                
                p.setPrice(rs.getDouble("price"));
               
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                Category c = d.getCategoryById(rs.getInt("cid"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategory(c);
                return p;
            }                
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;

    }
}
