package pk.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pk.control.SearchProductC;
import pk.model.Product;

/**
 * Servlet implementation class SearchProductS
 */
@WebServlet("/SearchProductS")
public class SearchProductS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		 String keyword = request.getParameter("search");     // from search bar
		        String category = request.getParameter("category");  // from header dropdown
		        List<Product> products;
		        String title;
		        

			        if (keyword != null && !keyword.trim().isEmpty()) {
		            products = SearchProductC.searchProducts(keyword);
		          title = "Search Results for: " + keyword;
		        } else if (category != null && !category.trim().isEmpty()) {
		            products = SearchProductC.getProductsByCategory(category);
			            title = "Category: " + category;
			        } else {
			            products = SearchProductC.getProducts(); // returns empty or all, your choice
			            title = "All Products";
			        }
			        if (products == null || products.isEmpty()) {
		                request.setAttribute("message", "No products found.");
		            }

			        request.setAttribute("products", products);
			        request.setAttribute("searchTitle", title);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
		        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
