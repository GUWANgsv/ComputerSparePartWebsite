package pk.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pk.control.ContactControl;


@WebServlet("/contactServlet")
public class contactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name=request.getParameter("name");
		 String email=request.getParameter("email");
		 int phone=Integer.parseInt(request.getParameter("phone"));
		 String subject=request.getParameter("subject");
		 String message=request.getParameter("message");
//		 int customerID=Integer.parseInt(request.getParameter("customerID"));
		 
		 boolean isTrue;
		 
		 isTrue=ContactControl.insertdata(name, email, phone, subject, message);
		 if(isTrue==true) {
			 String alertMessage="your massage sent successfully ";
			 response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='Home.jsp'</script>");
		 }
		 else {
			 RequestDispatcher dis2=request.getRequestDispatcher("wrong.jsp");
			 dis2.forward(request,response);
		 }
	}

}

