package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pk.model.Product;
import pk.util.DBconnection;

public class ProductDetailC {
	public static List<Product> getProductById(int pid) {
		
		ArrayList<Product> p1 =new ArrayList<>();
		try (Connection con = DBconnection.getConnection()) {
			String sql = "SELECT * FROM product WHERE productID = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, pid);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
			Product	p = new Product(
					rs.getInt("productID"),
					rs.getString("category"),
					rs.getString("name"),
					rs.getString("description"),
					rs.getBytes("image"),
					rs.getDouble("price"),
					rs.getInt("qty")
				);
			p1.add(p);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return p1;
	}
}
