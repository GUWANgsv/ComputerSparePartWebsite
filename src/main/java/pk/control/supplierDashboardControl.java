package pk.control;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pk.model.Order;
import pk.model.Product;
import pk.model.Supplier;
import pk.util.DBconnection;

public class supplierDashboardControl {

	// DB connection
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
	
	//Read products function
	public static List<Product> getAllProducts() {
		
		ArrayList<Product> product = new ArrayList<>();
		
		try {
			//DBConnection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from product";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int productID = rs.getInt(1);
				String category = rs.getString(2);
				String name = rs.getString(3);
				String description = rs.getString(4);
				double price = rs.getDouble(6);
				int qty = rs.getInt(7);
				
				Product pro = new Product(productID,category,name, description, null, price,qty);
				product.add(pro);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	//Read orders function
	public static List<Order> getAllOrders() {
			
		ArrayList<Order> order = new ArrayList<>();
			
		try {
			//DBConnection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql ="SELECT o.orderID, p.name, o.qty, o.status "+ 
						"FROM `order` AS o "+ 
						"JOIN cart AS c    ON o.cartID    = c.cartID "+
						"JOIN product AS p ON c.productID = p.productID "+
						"WHERE o.status='pending'";

			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Order o = new Order();
				
				o.setOrderID(rs.getInt("orderID"));
				o.setName(rs.getString("name"));
				o.setQty(rs.getInt("qty"));
				o.setStatus(rs.getString("status"));

				order.add(o);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return order;
	}
		
	//Read supplier details function
	public static List<Supplier> getSupplierDetails(int supplierId) {
		
		ArrayList<Supplier> supplier = new ArrayList<>();
		
		try {
			//DBConnection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from supplier where supplierID = '"+supplierId+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int supplierID = rs.getInt(1);
				String email = rs.getString(2);
				String password = rs.getString(3);
				
				Supplier sup = new Supplier(supplierID,email,password);
				supplier.add(sup);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return supplier;
	}
	
	//update supplier details function
	public static boolean updateSupplierDetails(String email, String password , int supplierId) {
		
		try {
			//DBConnection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "update supplier set email='"+email+"', password='"+password+"'"
						+"where supplierID='"+supplierId+"'";
			
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//delete supplier account function
	public static boolean deleteSupplier(int supplierId) {
		
		try {
			//DBConnection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "delete from supplier where supplierID='"+supplierId+"'";
		
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
		
	}
	
	//accept order function
	public static boolean acceptOrder(int orderID, String status) {
		
		try {
			//DBConnection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "update `order` set status='"+status+"'"
						+"where orderID= '"+orderID+"'";
			
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//decline order function
		public static boolean declineOrder(int orderID) {
			
			try {
				//DBConnection
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "delete from `order` where orderID='"+orderID+"'";
				
				int rs = stmt.executeUpdate(sql);

				if (rs > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
			
		}

	
}
	


