package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import pk.util.DBconnection;

public class CreateProductC {
	 public static boolean insertdata(String category, String name, String description, byte[] image, double price, int qty) {
	        boolean success = false;
	        Connection con = null;
	        PreparedStatement pstmt = null;

	        try {
	            // Establish DB connection
	            con = DBconnection.getConnection();

	            // Use a parameterized query to insert data safely
	            String sql = "INSERT INTO product (category, name, description, image, price, qty) VALUES (?, ?, ?, ?, ?, ?)";
	            pstmt = con.prepareStatement(sql);

	            // Set parameters
	            pstmt.setString(1, category);
	            pstmt.setString(2, name);
	            pstmt.setString(3, description);
	            pstmt.setBytes(4, image);  
	            pstmt.setDouble(5, price);
	            pstmt.setInt(6, qty);

	            // Execute the query
	            int rowsInserted = pstmt.executeUpdate();
	            if (rowsInserted > 0) {
	                success = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Close resources
	            try {
	                if (pstmt != null) pstmt.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return success;
	    }
}
