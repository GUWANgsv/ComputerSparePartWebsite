package pk.control;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pk.util.DBconnection;
import pk.model.Customer;

public class customerProfileControl {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Read customer details function
		public static List<Customer> getCustomerDetails(int customerId) {
			
			ArrayList<Customer> customer = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "select * from customer where customerID = '"+customerId+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int customerID = rs.getInt(1);
					String firstName = rs.getString(2);
					String lastName = rs.getString(3);
					String address = rs.getString(4);
					int phone = rs.getInt(5);
					String email = rs.getString(6);
					String password = rs.getString(7);
					
					Customer cus = new Customer(customerID,firstName,lastName,address,phone,email,password);
					customer.add(cus);
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return customer;
		}

		//update customer details function
		public static boolean updateCustomerDetails(int customerId, String firstName, String lastName, String address, int phone, String email, String password) {
			
			try {
				//DBConnection
				con = DBconnection.getConnection();
				stmt = con.createStatement();
				
				//Query
				String sql = "update customer set firstName='"+firstName+"',lastName='"+lastName+"',address='"+address+"',phone='"+phone+"', email='"+email+"', password='"+password+"'"
							+"where customerID='"+customerId+"'";
				
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
		
//delete data
public static boolean deletedata(int customerId) {
	

	try {
		con=DBconnection.getConnection();
		stmt=con.createStatement();
		//sql query
		String sql = "delete from customer where customerID='"+customerId+"'";
		
		int rs=stmt.executeUpdate(sql);
		if(rs>0) {
			isSuccess=true;
		}
		else {
			isSuccess=false;
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;		
	
}




}
