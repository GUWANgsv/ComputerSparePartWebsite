package pk.servlet;

import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pk.control.EditProductC;
import pk.model.Product;


@WebServlet("/EditProductS")
public class EditProductS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("id") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        if (!"admin".equals(role)&&!"supplier".equals(role)) {
            response.sendRedirect("Login.jsp");
            return;
        }
     
	
		boolean s=false;
		if("Delete".equals(action))
		{
			int productID=Integer.parseInt(request.getParameter("productID"));
			s=EditProductC.deleteProduct(productID);

		}
		else if("Edit".equals(action)) 
		{
			int productID=Integer.parseInt(request.getParameter("productID"));
			List<Product> p=EditProductC.getEditItem(productID);
			request.setAttribute("pro", p);
			request.getRequestDispatcher("editProduct.jsp").forward(request, response);
			
		}
		
		else if("Update".equals(action))
		{
			int productID=Integer.parseInt(request.getParameter("productID"));
			double price=Double.parseDouble(request.getParameter("price"));
			int qty=Integer.parseInt(request.getParameter("qty"));
			s=EditProductC.updateProductPriceQty(productID, price, qty);
			
		}
		else {
			System.out.println("not valid action");
		}
		
		if(s) {

	        if ("admin".equals(role)) {
	        	response.sendRedirect("AdminDashboardServlet");
	         
	        }
	        if ("supplier".equals(role)) {
	        	response.sendRedirect("supplierDashboardServlet");	       
	        }
		
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
