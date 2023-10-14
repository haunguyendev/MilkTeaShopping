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
import java.time.LocalDate;
import sample.shopping.Cart;
import sample.shopping.Item;
import sample.utils.DBUtils;


/**
 *
 * @author ACER
 */
public class OrderDAO{
     public void addOrder(UserDTO u, Cart cart) throws ClassNotFoundException {
         Connection conn=null;
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try{
            conn=DBUtils.getConnection();
            //add vào bảng Order
            String sql="insert into [order] values(?,?,?)";
            PreparedStatement st=conn.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, u.getId());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();        
            //lấy ra id của Order vừa add
            String sql1="select top 1 id from [Order] order by id desc";
            PreparedStatement st1=conn.prepareStatement(sql1);
            ResultSet rs=st1.executeQuery();       
            //add vào bảng OrderLine
            if(rs.next()){
                int oid=rs.getInt(1);
                for(Item i:cart.getItems()){
                String sql2="insert into [orderdetail] values(?,?,?,?)";
                PreparedStatement st2=conn.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setInt(2, i.getProduct().getId());
                st2.setInt(3, i.getQuantity());
                st2.setDouble(4, i.getPrice());
                st2.executeUpdate();
            }
            }
            //update so luong trong bang Product sau khi ban
            String sql3 = "update Products set quantity = quantity - ? "
                        + "where id = ?";
            PreparedStatement st3=conn.prepareStatement(sql3);
            for(Item i:cart.getItems()){
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }      
        }catch(SQLException e){
            System.out.println(e);
        }
    }   
}

