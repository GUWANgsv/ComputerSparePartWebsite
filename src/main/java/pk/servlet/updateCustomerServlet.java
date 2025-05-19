package pk.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.model.Customer;
import pk.control.customerProfileControl;


@WebServlet("/updateCustomerServlet")
public class updateCustomerServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String firstName = request.getParameter("firstName");
    	String lastName = request.getParameter("lastName");
    	String address = request.getParameter("address");
    	int phone = Integer.parseInt(request.getParameter("phone"));
    	String email = request.getParameter("email");
		String password = request.getParameter("password");
		String action = request.getParameter("action");

	     
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
       
		if("update".equals(action)) {
		customerProfileControl.updateCustomerDetails(customerId,firstName,lastName,address,phone,email,password);
		
		List<Customer> customer = customerProfileControl.getCustomerDetails(customerId);
			request.setAttribute("customer", customer);
		
		
		// Redirect to the update page with success parameter
		response.sendRedirect("customerProfileServlet?");
		}
		if("delete".equals(action))
		{
			customerProfileControl.deletedata(customerId);
			response.sendRedirect("Login.jsp");

		}
    }
}
