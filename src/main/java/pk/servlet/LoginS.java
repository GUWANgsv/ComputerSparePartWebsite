package pk.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.control.LoginC;
import pk.model.Admin;
import pk.model.Customer;
import pk.model.Supplier;
import pk.util.DBconnection;

/**
 * Servlet implementation class LoginS
 */
@WebServlet("/LoginS")
public class LoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        boolean remember = request.getParameter("remember") != null;

	        Connection conn = DBconnection.getConnection();
	        HttpSession session = request.getSession();

	        Object user = LoginC.authenticate(email, password, conn);

	        if (user != null) {
	            session.setMaxInactiveInterval(remember ? 7 * 24 * 60 * 60 : 30 * 60); // 7 days or 30 minutes

	            if (user instanceof Admin) {
	                session.setAttribute("role", "admin");
	                session.setAttribute("id", ((Admin) user).getAdminID());
	                response.sendRedirect("AdminDashboardServlet");
	            } else if (user instanceof Supplier) {
	                session.setAttribute("role", "supplier");
	                session.setAttribute("id", ((Supplier) user).getSupplierID());
	                response.sendRedirect("supplierDashboardServlet");
	            } else if (user instanceof Customer) {
	                session.setAttribute("role", "customer");
	                session.setAttribute("id", ((Customer) user).getCustomerID());
	                response.sendRedirect("Home.jsp");
	            }
	        } else {
	            request.setAttribute("errorMsg", "Invalid credentials");
	            request.getRequestDispatcher("Login.jsp").forward(request, response);
	        }
		doGet(request, response);
	}

}
