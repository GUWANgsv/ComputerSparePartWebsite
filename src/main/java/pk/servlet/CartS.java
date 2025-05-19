package pk.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.control.CartC;
import pk.control.OrderC;
import pk.model.Cart;
import pk.model.Order;

/**
 * Servlet implementation class CartS
 */
@WebServlet("/CartS")
public class CartS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       
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
       
		  ArrayList<Cart> clist = CartC.getCartItem(customerId);
		   List<Order> o=OrderC.getOrderDetails(customerId);
          request.setAttribute("clist", clist);
      	request.setAttribute("order", o);
          request.getRequestDispatcher("Cart.jsp").forward(request, response);
		
       
  		
  	
  		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
