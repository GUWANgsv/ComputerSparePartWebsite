package pk.control;

import java.sql.Connection;
import java.sql.Statement;

import pk.util.DBconnection;

public class customerRegistrationControl {

	// DB connection
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;

	// Insert data function
	public static boolean insertdata(String firstName, String lastName, String address, int phone, String email, String password) {

	isSuccess = false;

		try {
			// DB connection call
			con = DBconnection.getConnection();
			stmt = con.createStatement();

			// SQL query
			String sql = "insert into customer values(0,'"+firstName+"','"+lastName+"','"+address+"','"+phone+"','"+email+"','"+password+"')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

}
