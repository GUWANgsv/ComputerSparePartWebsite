<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact us</title>
<style>
/* Contact Form Styling - Purple and Blue Theme with strict scoping */
/* Using more specific selectors to avoid conflicts with header/nav */

#contact-section .contact-container {
  max-width: 700px;
  margin: 30px auto;
  padding: 30px;
  background: white;
  border-radius: 15px;
  box-shadow: 0 6px 20px rgba(103, 58, 183, 0.2);
  border: 1px solid rgba(138, 43, 226, 0.1);
}

#contact-section .contact-container h2 {
  color: #5e35b1;
  text-align: center;
  margin-bottom: 30px;
  font-size: 32px;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
}

#contact-section .contact-form table {
  width: 100%;
  border-collapse: collapse;
}

#contact-section .contact-form td {
  padding: 12px;
  vertical-align: top;
}

#contact-section .contact-form td:first-child {
  width: 30%;
  font-weight: bold;
  color: #4527a0;
  font-size: 18px;
}

/* Bigger input fields */
#contact-section .contact-form input[type="text"],
#contact-section .contact-form textarea {
  width: 100%;
  padding: 16px;
  border: 2px solid #b39ddb;
  border-radius: 8px;
  font-size: 18px;
  box-sizing: border-box;
  transition: all 0.3s ease;
  background-color: rgba(255, 255, 255, 0.9);
  margin-bottom: 5px;
}

#contact-section .contact-form input[type="text"]:focus,
#contact-section .contact-form textarea:focus {
  border-color: #7e57c2;
  outline: none;
  box-shadow: 0 0 12px rgba(126, 87, 194, 0.5);
  background-color: white;
  transform: scale(1.01);
}

#contact-section .contact-form textarea {
  height: 180px;
  resize: vertical;
}

/* Bigger and more colorful button */
#contact-section .contact-form input[type="submit"] {
  background: linear-gradient(45deg, #6a3de8, #3949ab, #7c43bd);
  background-size: 200% 200%;
  animation: gradient-shift 3s ease infinite;
  color: white;
  border: none;
  padding: 18px 30px;
  font-size: 20px;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
  border-radius: 50px;
  width: 100%;
  margin-top: 20px;
  transition: all 0.3s ease;
  box-shadow: 0 6px 15px rgba(94, 53, 177, 0.4);
}

#contact-section .contact-form input[type="submit"]:hover {
  background-size: 150% 150%;
  transform: translateY(-3px) scale(1.02);
  box-shadow: 0 8px 20px rgba(94, 53, 177, 0.6);
  letter-spacing: 2px;
}

#contact-section .contact-form input[type="submit"]:active {
  transform: translateY(1px);
  box-shadow: 0 2px 10px rgba(94, 53, 177, 0.4);
}

/* Animation for button gradient */
@keyframes gradient-shift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Responsive adjustments */
@media (max-width: 768px) {
  #contact-section .contact-container {
    margin: 15px;
    padding: 20px;
  }
  
  #contact-section .contact-form td {
    display: block;
    width: 100%;
  }
  
  #contact-section .contact-form td:first-child {
    width: 100%;
    padding-bottom: 5px;
    font-size: 16px;
  }
  
  #contact-section .contact-form input[type="text"],
  #contact-section .contact-form textarea {
    padding: 14px;
    font-size: 16px;
  }
  
  #contact-section .contact-form input[type="submit"] {
    padding: 16px 20px;
    font-size: 18px;
  }
}
</style>
</head>
<body>
    <%@ include file="header.jspf" %>
    <div id="contact-section">
<div class="contact-container">
<h2>Contact us</h2>
<form action="contactServlet" method="post" class="contact-form">
<table>

  <tr>
  <td>Name:</td>
  <td><input type="text"  name="name" required></td>
  </tr>
  
  <tr>
  <td>Email:</td>
  <td><input type="text"  name="email" required></td>
  </tr>
  
  <tr>
  <td>Phone number</td>
  <td><input type="text"  name="phone" required></td>
  </tr>
  
  <tr>
  <td>Subject</td>
  <td><input type="text"  name="subject" required></td>
  </tr>
  
   <tr>
   <td>Message</td>
   <td><textarea name="message" required></textarea></td>
   </tr>
  
  
  <tr>
  <td colspan="2"><input type="submit" value="submit"></td>
  </tr>
  
</table>
</form>
</div>
</div>
        <%@ include file="nav.jspf" %>


</body>
</html>