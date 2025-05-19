package pk.servlet;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.model.Supplier;
import pk.control.supplierDashboardControl;

@WebServlet("/updateSupplierServlet")
public class updateSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean isTrue;
		
		isTrue = supplierDashboardControl.updateSupplierDetails(email, password,supplierId);
		
		if (isTrue == true) {
			// Get updated supplier details
			List<Supplier> supplier = supplierDashboardControl.getSupplierDetails(supplierId);
			request.setAttribute("supplier", supplier);
			
			// Redirect to the update page with success parameter
			response.sendRedirect("supplierDashboardServlet?updateSuccess=true");
		} else {
			// Redirect to the update page with error parameter
			response.sendRedirect("updateSupplierServlet?error=true&email=" + email + "&password=" + password);
		}
	}
}