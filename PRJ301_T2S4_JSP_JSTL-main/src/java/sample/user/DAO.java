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
public class DAO {

    //Doc tat ca cac ban ghi tu table categories
    public List<Category> getAll() throws ClassNotFoundException {
        List<Category> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "select * from Categories";

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Category c = new Category(rs.getInt("id"), rs.getString("name"));
                    list.add(c);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<UserDTO> getTop2() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT top(2) userID, fullName, roleID\n"
                + "FROM tblUsers";

        List<UserDTO> list = new ArrayList<>();

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            rs = ptm.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUserID(rs.getString("userID"));
                user.setFullName(rs.getString("fullName"));
                user.setRoleID(rs.getString("roleID"));
                list.add(user);
            }

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public Category getCategoryById(int id) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        String sql = "select * from Categories where id=?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    Category c = new Category(rs.getInt("id"), rs.getString("name"));
                    return c;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //Doc tu bang products theo cid
    public List<Product> getProductByCid(int cid) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[image]\n"
                + "      ,[cid]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Products]"
                + "  where 1=1 ";
        if (cid != 0) {
            sql += " and cid=" + cid;
        }
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
//            st.setInt(1, cid);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));

                p.setPrice(rs.getDouble("price"));

                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductSeach(int cid, String productName) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        List<Product> list = new ArrayList<>();
        String sql = " SELECT  id, name,price, description  ,image,cid,quantity\n"
                + "                   FROM Products"
                + "                   WHERE 1=1";
        if (cid != 0) {
            sql += " and cid=" + cid;
        }
        if (!productName.isEmpty()) {
            sql += "and name like '%" + productName + "%'";
        }
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
//            st.setInt(1, cid);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));

                p.setPrice(rs.getDouble("price"));

                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                Category c = getCategoryById(rs.getInt("cid"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean updateProduct(Product product) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET \n"
                + "       [name] = ?\n"
                + "      ,[price] =?\n"
                + "      ,[description] = ?   \n"
                + "      ,[cid] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE id=?";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, product.getName());
            ptm.setDouble(2, product.getPrice());
            ptm.setString(3, product.getDescription());
            ptm.setInt(4, product.getCategory().getId());
            ptm.setInt(5, product.getQuantity());
            ptm.setInt(6, product.getId());
            check = ptm.executeUpdate() > 0 ? true : false;

        } catch (SQLException e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicateID(int id) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "select * from products where id=?";

        try {

            conn = DBUtils.getConnection();
            ptm = conn.prepareCall(sql);
            ptm.setInt(1, id);
            rs = ptm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

        }
        return false;
    }

    public boolean addProduct(Product product) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[cid]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareCall(sql);
            ptm.setInt(1, product.getId());
            ptm.setString(2, product.getName());
            ptm.setDouble(3, product.getPrice());
            ptm.setString(4, product.getDescription());
            ptm.setString(5, product.getImage());
            ptm.setInt(6, product.getCategory().getId());
            ptm.setInt(7, product.getQuantity());
            check = ptm.executeUpdate() > 0 ? true : false;
        } catch (SQLException e) {

        }

        return check;
    }

    public boolean deleteProductById(int id) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        String sql = "DELETE FROM [dbo].[Products] WHERE id=?";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareCall(sql);
            ptm.setInt(1, id);
            check = ptm.executeUpdate() > 0 ? true : false;

        } catch (SQLException e) {

        }

        return check;

    }

}
