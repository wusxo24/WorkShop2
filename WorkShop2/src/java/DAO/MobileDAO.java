package DAO;

import DTO.Mobile;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MobileDAO {

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

    public List<Mobile> searchMobileByIdOrName(String searchValue) {
        String query = "SELECT [mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale] "
                + "FROM Mobiles WHERE [mobileId] LIKE ? OR [mobileName] LIKE ?";
        List<Mobile> searchList = new ArrayList<>();
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            String searchPattern = "%" + searchValue + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String mobileId = rs.getString(1);
                String description = rs.getString(2);
                double price = rs.getDouble(3);
                String mobileName = rs.getString(4);
                int yearOfProduction = rs.getInt(5);
                int quantity = rs.getInt(6);
                boolean notSale = rs.getBoolean(7);
                Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                searchList.add(mobile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return searchList;
    }

    public List<Mobile> getAllMobiles() {
        String query = "SELECT [mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale] FROM Mobiles";
        List<Mobile> mobileList = new ArrayList<>();
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String mobileId = rs.getString(1);
                String description = rs.getString(2);
                double price = rs.getDouble(3);
                String mobileName = rs.getString(4);
                int yearOfProduction = rs.getInt(5);
                int quantity = rs.getInt(6);
                boolean notSale = rs.getBoolean(7);
                Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mobileList;
    }

    public Mobile getMobileByMobileID(String mobileId) {
        String query = "SELECT [description], [price], [mobileName], [yearOfProduction], [quantity] FROM Mobiles where [mobileId] = ?";
        Mobile mobile = null;
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            ps.setString(1, mobileId);
            while (rs.next()) {
                String description = rs.getString(1);
                double price = rs.getDouble(2);
                String mobileName = rs.getString(3);
                int yearOfProduction = rs.getInt(4);
                int quantity = rs.getInt(5);
                mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mobile;
    }

    public List<Mobile> searchMobileByMinMax(Double min, Double max) {
        String query = "SELECT TOP (1000) [mobileId]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[mobileName]\n"
                + "      ,[yearOfProduction]\n"
                + "      ,[quantity]\n"
                + "      ,[notSale]\n"
                + "  FROM [MyShop].[dbo].[Mobiles]\n"
                + "  WHERE price >= ? AND  price <= ?";
        List<Mobile> mobileList = new ArrayList<>();
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query);) {
            ps.setDouble(1, min);
            ps.setDouble(2, max);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String mobileId = rs.getString(1);
                String description = rs.getString(2);
                double price = rs.getDouble(3);
                String mobileName = rs.getString(4);
                int yearOfProduction = rs.getInt(5);
                int quantity = rs.getInt(6);
                boolean notSale = rs.getBoolean(7);
                Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                if (!mobile.getNotSale()) {
                    mobileList.add(mobile);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mobileList;
    }

    public boolean deleteMobileById(String mobileId) {
        String query = "DELETE FROM Mobiles WHERE mobileId = ?";
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setString(1, mobileId);
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateMobile(String mobileId, String description, double price, String mobileName, int yearOfProduction, int quantity, boolean notSale) {
        String query = "UPDATE Mobiles SET description = ?, price = ?, mobileName = ?, yearOfProduction = ?, quantity = ?, notSale = ? WHERE mobileId = ?";
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setString(1, description);
            ps.setDouble(2, price);
            ps.setString(3, mobileName);
            ps.setInt(4, yearOfProduction);
            ps.setInt(5, quantity);
            ps.setBoolean(6, notSale);
            ps.setString(7, mobileId);
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateQuantityByAddCartAmmount(String mobileId, String description, double price, String mobileName, int yearOfProduction, int quantity, boolean notSale, int CartAmount) {
        String query = "UPDATE Mobiles SET description = ?, price = ?, mobileName = ?, yearOfProduction = ?, quantity = ?, notSale = ? WHERE mobileId = ?";
        int updatedQuantity = quantity - CartAmount;
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setString(1, description);
            ps.setDouble(2, price);
            ps.setString(3, mobileName);
            ps.setInt(4, yearOfProduction);
            ps.setInt(5, updatedQuantity);
            ps.setBoolean(6, notSale);
            ps.setString(7, mobileId);
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean updateQuantityByRemoveCartAmmount(String mobileId, String description, double price, String mobileName, int yearOfProduction, int quantity, boolean notSale, int CartAmount) {
        String query = "UPDATE Mobiles SET description = ?, price = ?, mobileName = ?, yearOfProduction = ?, quantity = ?, notSale = ? WHERE mobileId = ?";
        int updatedQuantity = quantity + CartAmount - 1;
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setString(1, description);
            ps.setDouble(2, price);
            ps.setString(3, mobileName);
            ps.setInt(4, yearOfProduction);
            ps.setInt(5, updatedQuantity);
            ps.setBoolean(6, notSale);
            ps.setString(7, mobileId);
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean updateQuantityBaseOnCartAmmount(String mobileId, String description, double price, String mobileName, int yearOfProduction, int quantity, boolean notSale, int CartAmount, int newCartAmount) {
        String query = "UPDATE Mobiles SET description = ?, price = ?, mobileName = ?, yearOfProduction = ?, quantity = ?, notSale = ? WHERE mobileId = ?";
        int updatedQuantity;
        if (newCartAmount > CartAmount) {
            updatedQuantity = (quantity) - (newCartAmount - CartAmount);
        } else {
            updatedQuantity = (quantity) + (CartAmount - newCartAmount);
        }
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setString(1, description);
            ps.setDouble(2, price);
            ps.setString(3, mobileName);
            ps.setInt(4, yearOfProduction);
            ps.setInt(5, updatedQuantity);
            ps.setBoolean(6, notSale);
            ps.setString(7, mobileId);
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean addMobile(String mobileId, String description, double price, String mobileName, int yearOfProduction, int quantity, boolean notSale) {
        String query = "INSERT INTO Mobiles (mobileId, description, price, mobileName, yearOfProduction, quantity, notSale) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection cn = getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setString(1, mobileId);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setString(4, mobileName);
            ps.setInt(5, yearOfProduction);
            ps.setInt(6, quantity);
            ps.setBoolean(7, notSale);
            int status = ps.executeUpdate();
            return status > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
