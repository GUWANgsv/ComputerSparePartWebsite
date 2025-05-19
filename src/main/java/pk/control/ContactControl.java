package pk.control;

import java.sql.Connection;

import java.sql.Statement;

import pk.util.DBconnection;

public class ContactControl {
	private static boolean isSuccess=false;
	private static Connection con = null;
	private static Statement stmt = null;

	
	public static boolean insertdata(String name, String email, int phone, String subject, String message) {
		
		
		try {
			//DB connection 
			con=DBconnection.getConnection();
			stmt=con.createStatement();
			
			//SQL query
			String sql ="insert into contact (`name`,`email`,`phone`,`subject`,`message`) values('"+name+"','"+email+"','"+phone+"','"+subject+"','"+message+"')";

			int rs=stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	

}
