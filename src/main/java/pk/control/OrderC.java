package pk.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pk.model.Order;
import pk.util.DBconnection;

public class OrderC {
public static List<Order> getOrderDetails(int customerId) {
		
		ArrayList<Order> o =new ArrayList<>();
		try (Connection con = DBconnection.getConnection()) {
		
			//Query
			String sql ="SELECT  p.name, o.date, o.qty, o.status, o.total "+ 
						"FROM `order` AS o "+ 
						"JOIN cart AS c    ON o.cartID    = c.cartID "+
						"JOIN product AS p ON c.productID = p.productID "+
						"WHERE o.customerID=? ";
			PreparedStatement stmt = con.prepareStatement(sql);
			   stmt.setInt(1, customerId);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				Order o1 = new Order();
				
				
				o1.setName(rs.getString("name"));
				o1.setDate(rs.getTimestamp("date"));
				o1.setQty(rs.getInt("qty"));
				o1.setStatus(rs.getString("status"));
				o1.setTotal(rs.getDouble("total"));

				o.add(o1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return o;
	}
}
