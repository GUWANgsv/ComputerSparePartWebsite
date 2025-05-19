
package pk.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pk.control.supplierDashboardControl;

@WebServlet("/declineOrderServlet")
public class declineOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get the orderID from request parameter
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        
        // Call the declineOrder method
        supplierDashboardControl.declineOrder(orderID);
 
        // Redirect back to dashboard with success message
        response.sendRedirect("supplierDashboardServlet?declineSuccess=true");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}