package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import pk.model.Admin;
import pk.model.Customer;
import pk.model.Supplier;

public class LoginC {
	 public static Object authenticate(String email, String password, Connection conn) {
	        try {
	            // Admin check
	            String adminQuery = "SELECT * FROM admin WHERE email=? AND password=?";
	            PreparedStatement adminStmt = conn.prepareStatement(adminQuery);
	            adminStmt.setString(1, email);
	            adminStmt.setString(2, password);
	            ResultSet rs = adminStmt.executeQuery();
	            if (rs.next()) {
	                return new Admin(rs.getInt("adminID"), rs.getString("email"), rs.getString("password"));
	            }

	            // Supplier check
	            String supplierQuery = "SELECT * FROM supplier WHERE email=? AND password=?";
	            PreparedStatement supplierStmt = conn.prepareStatement(supplierQuery);
	            supplierStmt.setString(1, email);
	            supplierStmt.setString(2, password);
	            rs = supplierStmt.executeQuery();
	            if (rs.next()) {
	                return new Supplier(rs.getInt("supplierID"), rs.getString("email"), rs.getString("password"));
	            }

	            // Customer check
	            String customerQuery = "SELECT * FROM customer WHERE email=? AND password=?";
	            PreparedStatement customerStmt = conn.prepareStatement(customerQuery);
	            customerStmt.setString(1, email);
	            customerStmt.setString(2, password);
	            rs = customerStmt.executeQuery();
	            if (rs.next()) {
	                return new Customer(rs.getInt("customerID"), rs.getString("firstName"), rs.getString("lastName"),
	                        rs.getString("address"), rs.getInt("phone"), rs.getString("email"), rs.getString("password"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return null;
	    }
	  
}
