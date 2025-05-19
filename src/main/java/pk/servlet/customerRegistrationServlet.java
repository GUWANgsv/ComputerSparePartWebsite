package pk.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pk.control.customerRegistrationControl;



@WebServlet("/customerRegistrationServlet")
public class customerRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		boolean isTrue;

		isTrue = customerRegistrationControl.insertdata(firstName, lastName, address, phone, email, password);

		if (isTrue == true) {
			String alertMessage = "Registration successfully!";
			response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='Login.jsp'</script>");
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
