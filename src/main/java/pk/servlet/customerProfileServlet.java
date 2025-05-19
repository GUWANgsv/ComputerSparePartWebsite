package pk.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.model.Customer;
import pk.control.customerProfileControl;


@WebServlet("/customerProfileServlet")
public class customerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession(false);

	        if (session == null || session.getAttribute("id") == null) {
	            response.sendRedirect("Login.jsp");
	            return;
	        }

	        int customerId = (Integer) session.getAttribute("id");
	        String role = (String) session.getAttribute("role");

	        if (!"customer".equals(role)) {
	            response.sendRedirect("Login.jsp");
	            return;
	        }
		// Get customer details
		List<Customer> customer = customerProfileControl.getCustomerDetails(customerId);
		request.setAttribute("customer",customer);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("customerProfile.jsp");
		dispatcher.forward(request, response);
	    
	}
	
	
	
}

