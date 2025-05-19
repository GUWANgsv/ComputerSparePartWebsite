package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pk.model.Product;
import pk.util.DBconnection;

public class SearchProductC {
	public static List<Product> searchProducts(String keyword) {
		List<Product> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			con = DBconnection.getConnection();
			String sql = "SELECT * FROM product WHERE name LIKE ? OR category LIKE ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			rs = stmt.executeQuery();

			while (rs.next()) {
				Product p = new Product(
						rs.getInt("productID"),
						rs.getString("category"),
						rs.getString("name"),
						rs.getString("description"),
						rs.getBytes("image"),
						rs.getDouble("price"),
						rs.getInt("qty")
				);
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Product> getProductsByCategory(String category) {
        List<Product> list = new ArrayList<>();
        try (
            Connection con = DBconnection.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM product WHERE category = ?")
        ) {
            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("productID"),
                    rs.getString("category"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getBytes("image"),
                    rs.getDouble("price"),
                    rs.getInt("qty")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
}
	public static List<Product> getProducts() {
		
		   List<Product> list = new ArrayList<>();
	        try (
	            Connection con = DBconnection.getConnection();
	            PreparedStatement stmt = con.prepareStatement("SELECT * FROM product ")
	        ) {
	            
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                Product p = new Product(
	                    rs.getInt("productID"),
	                    rs.getString("category"),
	                    rs.getString("name"),
	                    rs.getString("description"),
	                    rs.getBytes("image"),
	                    rs.getDouble("price"),
	                    rs.getInt("qty")
	                );
	                list.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	}
}
