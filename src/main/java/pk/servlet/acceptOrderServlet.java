
package pk.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pk.control.supplierDashboardControl;

@WebServlet("/acceptOrderServlet")
public class acceptOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        // Get parameters
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        String status = request.getParameter("status");
        
        // Update order status
        boolean isSuccess = supplierDashboardControl.acceptOrder(orderID, status);
        
        if (isSuccess) {
            // Redirect back to dashboard with success message
            response.sendRedirect("supplierDashboardServlet?orderSuccess=true");
        } else {
            // Set error message and forward back to dashboard
            request.setAttribute("errorMessage", "Failed to accept order. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("supplierDashboardServlet");
            dispatcher.forward(request, response);
        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
	
}