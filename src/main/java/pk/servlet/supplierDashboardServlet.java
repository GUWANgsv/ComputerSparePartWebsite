
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

import pk.model.Order;
import pk.model.Product;
import pk.model.Supplier;
import pk.control.supplierDashboardControl;

@WebServlet("/supplierDashboardServlet")
public class supplierDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get products
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("id") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int supplierId = (Integer) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        if (!"supplier".equals(role)) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
		List<Product> allProducts = supplierDashboardControl.getAllProducts();
		request.setAttribute("allproducts", allProducts);
		
		// Get orders
		List<Order> allOrders = supplierDashboardControl.getAllOrders();
		request.setAttribute("allorders", allOrders);
		
		// Get supplier details
		List<Supplier> supplier = supplierDashboardControl.getSupplierDetails( supplierId);
		request.setAttribute("supplier", supplier);
		
		// Check if we have a success message to display
		String updateSuccess = request.getParameter("updateSuccess");
		if (updateSuccess != null && updateSuccess.equals("true")) {
			request.setAttribute("updateSuccess", true);
		}
		
		// Check if we have an order success message
        String orderSuccess = request.getParameter("orderSuccess");
        if (orderSuccess != null && orderSuccess.equals("true")) {
            request.setAttribute("orderSuccess", true);
        }
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("supplierDashboard.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}