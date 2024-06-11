/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author Acer
 */
import DTO.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;instanceName=SQLEXPRESS;database=MyShop;encrypt=true;trustServerCertificate=true";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "12345";

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            System.err.println("Failed to establish database connection: " + e.getMessage());
            throw e;
        }
    }

    public Boolean login(String userId, int password) throws Exception {
        User user = null;
        String sql = "SELECT fullName, role FROM Users WHERE userId = ? AND password = ?";

        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userId);
            ps.setInt(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error during login: " + e.getMessage());
            throw e;
        }
        return false;
    }

    public User getUserById(String userId) throws ClassNotFoundException, SQLException {
        User user = null;
        String sql = "select password, fullName, role from Users where userId = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int password = rs.getInt(1);
                String fullName = rs.getString(2);
                int role = rs.getInt(3);
                user = new User(userId, password, fullName, role);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }finally{
            return user;
        }
    }
}


    
