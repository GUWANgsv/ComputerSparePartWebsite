package pk.control;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pk.model.Supplier;
import pk.model.Admin;
import pk.model.Customer;
import pk.model.Order;
import pk.model.Product;
import pk.util.DBconnection;

public class AdminDashboardControl {

	// DB connection
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
	
	//Read products function
	public static List<Product> getAllProducts (){
		
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
		public static List<Order> getAllOrders (){
			
			ArrayList<Order> order = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql ="SELECT o.orderID, p.name, o.qty, o.status " +
			                "FROM `order` AS o " +
			                "JOIN cart AS c ON o.cartID = c.cartID " +
			                "JOIN product AS p ON c.productID = p.productID " +
			                "WHERE o.status = 'completed'";
				
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
		
		//Read Users function
		public static List<Customer> getAllCustomers (){
			
			ArrayList<Customer> customer = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "select * from customer";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int customerID = rs.getInt(1);
					String firstName = rs.getString(2);
					int phone = rs.getInt(5);
					String email = rs.getString(6);
					
					Customer Cus = new Customer(customerID,firstName,null, null,phone, email,null);
					customer.add(Cus);
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return customer;
		}
		
		//Read Suppliers function
				public static List<Supplier> getAllSuppliers (){
					
					ArrayList<Supplier> supplier = new ArrayList<>();
					
					try {
						//DBConnection
						con = DBconnection.getConnection();
						stmt = con.createStatement();
						
						//Query
						String sql = "select * from supplier";
						
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							int supplierID = rs.getInt(1);
							String email = rs.getString(2);
							
							Supplier Sup = new Supplier(supplierID,email,null);
							supplier.add(Sup);
						}
						
					}
					catch(Exception e) {
						e.printStackTrace();
					}
					return supplier;
				}
		
				//Read Admin details function
				public static List<Admin> getAdminDetails(int adminId) {
					
					ArrayList<Admin> Admin = new ArrayList<>();
					
					try {
						//DBConnection
						con = DBconnection.getConnection();
						stmt = con.createStatement();
						
						//Query
						String sql = "select * from admin where adminID = '"+adminId+"'";
						
						rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
							int adminID = rs.getInt(1);
							String email = rs.getString(2);
							String password = rs.getString(3);
							
							Admin Ad = new Admin(adminID,email,password);
							Admin.add(Ad);
						}
						
					}
					catch(Exception e) {
						e.printStackTrace();
					}
					return Admin;
				}
								
		
		
				//update admin details function
				public static boolean updateAdminDetails(String email, String password, int adminId) {
					
					try {
						//DBConnection
						con = DBconnection.getConnection();
						stmt = con.createStatement();
						
						//Query
						String sql = "update admin set email='"+email+"', password='"+password+"'"
									+"where adminID='"+adminId+"'";
						
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
				public static boolean deleteSupplier(int supplierID) {
					
					try {
						//DBConnection
						con = DBconnection.getConnection();
						stmt = con.createStatement();
						
						//Query
						String sql = "delete from supplier where supplierID='"+supplierID+"'";
						
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
				
				//delete user account function
				public static boolean deleteUser(int customerID) {
					
					try {
						//DBConnection
						con = DBconnection.getConnection();
						stmt = con.createStatement();
						
						//Query
						String sql = "delete from customer where customerID='"+customerID+"'";
						
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
