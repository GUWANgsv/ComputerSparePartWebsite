package pk.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.control.supplierDashboardControl;

@WebServlet("/deleteSupplierServlet")
public class deleteSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int supplierID = Integer.parseInt(request.getParameter("supplierID"));
		boolean isTrue;
		
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
        

		isTrue = supplierDashboardControl.deleteSupplier(supplierId);
		
		if(isTrue == true) {
			String alertMessage = "Account Deleted Successfully!";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='Login.jsp';</script>");
		}
		else {
			request.setAttribute("errorMessage", "Failed to delete account. Please try again.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("supplierDashboardServlet");
			dispatcher.forward(request,response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		 doGet(request, response);

		
	}

}
