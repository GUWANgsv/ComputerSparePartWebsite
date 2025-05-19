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

import pk.model.Admin;
import pk.model.Customer;
import pk.model.Order;
import pk.model.Product;
import pk.model.Supplier;
import pk.control.AdminDashboardControl;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("id") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int adminId = (Integer) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        if (!"admin".equals(role)) {
            response.sendRedirect("Login.jsp");
            return;
        }
		List <Product> product = AdminDashboardControl.getAllProducts();
		List <Order> order = AdminDashboardControl.getAllOrders();
		List <Customer> cus = AdminDashboardControl.getAllCustomers();
		List<Supplier> sup = AdminDashboardControl.getAllSuppliers();
		List<Admin> Ad = AdminDashboardControl.getAdminDetails(adminId);
		
		request.setAttribute("allproducts", product);
		request.setAttribute("allorders", order);
		request.setAttribute("allusers",cus);
		request.setAttribute("allsuppliers", sup);
		request.setAttribute("admin", Ad);
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminDashboard.jsp");
		dispatcher.forward(request, response);

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}
	
	

}
