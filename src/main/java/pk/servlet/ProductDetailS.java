package pk.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pk.control.ProductDetailC;
import pk.model.Product;

/**
 * Servlet implementation class ProductDetailS
 */
@WebServlet("/ProductDetailS")
public class ProductDetailS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
	            int pid = Integer.parseInt(request.getParameter("pid"));
	            

	            List<Product> products = ProductDetailC.getProductById(pid);
	           
	          
	            if (products != null) {
	            	
	                request.setAttribute("products", products);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("ProductDetail.jsp");
	                dispatcher.forward(request, response);
	 	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
			response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
