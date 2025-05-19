package pk.control;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import pk.util.DBconnection;

public class ForgotPasswordControl {

    // Check if email exists in the customer table
    public static boolean isEmailExist(String email) {
        boolean exists = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT * FROM customer WHERE email = ?")) {

            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                exists = rs.next(); // Returns true if record exists
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    // Update the password for the given email
    public static boolean updatePassword(String email, String newPassword) {
        boolean isUpdated = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement stmt = con.prepareStatement("UPDATE customer SET password = ? WHERE email = ?")) {

            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            int rowsAffected = stmt.executeUpdate();
            isUpdated = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }
}