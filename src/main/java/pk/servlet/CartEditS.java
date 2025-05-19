package pk.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.control.CartC;

/**
 * Servlet implementation class CartEditS
 */
@WebServlet("/CartEditS")
public class CartEditS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
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

	            boolean success = false;

	            if ("add".equals(action)) {
	                int productId = Integer.parseInt(request.getParameter("pid"));
	                int qty = Integer.parseInt(request.getParameter("quantity"));
	                double total = Double.parseDouble(request.getParameter("total"));
	                success = CartC.addCart(customerId, productId, qty, total);
	            } else if ("remove".equals(action)) {
	                int cartId = Integer.parseInt(request.getParameter("cartId"));
	                success = CartC.removeCart(cartId);
	            } else if ("save".equals(action)) {
	                int cartId = Integer.parseInt(request.getParameter("cartId"));
	                int qty = Integer.parseInt(request.getParameter("quantity"));
	                double total = Double.parseDouble(request.getParameter("total"));
	                success = CartC.updateCart(cartId, qty, total);
	            } else if ("checkout".equals(action)) {
	                int qty = Integer.parseInt(request.getParameter("quantity"));
	                double total = Double.parseDouble(request.getParameter("total"));
	                int cartId = Integer.parseInt(request.getParameter("cartId"));
	                String status="pending";
	                Timestamp date=Timestamp.from(Instant.now());
	                success = CartC.addOrder( qty, date, total, status, cartId, customerId);

	             
	            } 
	            else {
	            	System.out.println("no valid action");
	            }

	            // If the action was successful, refresh the cart items
	           if(success) {
                   request.getRequestDispatcher("CartS").forward(request, response);

	           }

	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("error2.jsp").forward(request, response);
	        }
		doGet(request, response);
	}

}
