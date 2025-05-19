
package pk.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pk.control.AdminDashboardControl;

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           int customerID = Integer.parseInt(request.getParameter("customerID"));
		
		boolean isTrue;
		
		isTrue = AdminDashboardControl.deleteUser(customerID);
		
		if(isTrue == true) {
			response.sendRedirect("AdminDashboardServlet");
		}
		else {
			request.setAttribute("errorMessage", "Failed to delete account. Please try again.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboardServlet");
			dispatcher.forward(request,response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		 doGet(request, response);

		
	}
}

