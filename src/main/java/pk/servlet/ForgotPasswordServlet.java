package pk.servlet;

import pk.control.ForgotPasswordControl;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    
	private static final long serialVersionUID = -1435765918924429529L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("verify".equals(action)) {
            String email = request.getParameter("email");

            if (ForgotPasswordControl.isEmailExist(email)) {
                request.setAttribute("email", email);
                request.setAttribute("verified", true);
            } else {
                request.setAttribute("error", "Email not found.");
            }

            RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
            rd.forward(request, response);

        } else if ("reset".equals(action)) {
            String email = request.getParameter("email");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match.");
                request.setAttribute("email", email);
                request.setAttribute("verified", true);

                RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
                rd.forward(request, response);

            } else if (ForgotPasswordControl.updatePassword(email, newPassword)) {
            	request.setAttribute("message", "Password reset successful. You can now log in.");
            	request.setAttribute("showLogin", true); // flag to show the login button
            	RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
            	rd.forward(request, response);

            } else {
                request.setAttribute("error", "Failed to update password.");
                request.setAttribute("email", email);
                request.setAttribute("verified", true);

                RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
                rd.forward(request, response);
            }
        }
    }
}

