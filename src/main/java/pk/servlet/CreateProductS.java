package pk.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import pk.control.CreateProductC;
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/CreateProductS")
public class CreateProductS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String category= request.getParameter("category");
		  String name= request.getParameter("name");
		  String description= request.getParameter("description");
		  Part images = request.getPart("image");

	        double price = 0.0;
	        int qty = 0;

	        try {
	            price = Double.parseDouble(request.getParameter("price")); // Convert String to double
	            qty = Integer.parseInt(request.getParameter("quantity")); // Convert String to int
	        } catch (NumberFormatException e) {
	            response.getWriter().println("<script>alert('Invalid price or quantity! Please enter valid numbers.'); window.history.back();</script>");
	            return;
	        }
	       
	
		   byte[] image = null;
	        if (images!= null && images.getSize() > 0) {
	            try (InputStream inputStream = images.getInputStream()) {
	                image = inputStream.readAllBytes();
	                System.out.println("Image received: " + image.length + " bytes");
	            }
	        } else {
	            System.out.println("No image uploaded or image is empty!");
	        }
		  boolean ss;
		  ss=CreateProductC.insertdata(category,name,description,image,price,qty);
		  if(ss==true)
		  {
			  String alert="data insert successful";//done.jsp eke file ekek check karanta yoda gana
			  response.getWriter().println("<script>alert('"+alert+ "'); window.location.href='supplierDashboardServlet'</script>");
		  }
		  else {
			RequestDispatcher dis2=request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		  }
		 
		doGet(request, response);
	}

}
