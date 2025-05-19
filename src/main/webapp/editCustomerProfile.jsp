<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pk.model.Customer" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
       html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* Main content wrapper - this preserves space for header and footer */
        .main-content {
            flex: 1 0 auto;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
            position: relative;
        }
        
        /* Profile section styling */
        #profile-section {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            box-sizing: border-box;
            flex: 1 0 auto; /* This allows it to take up available space */
        }

        #profile-section .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 2.5rem;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            margin: 0 auto;
        }

        #profile-section .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        #profile-section .form-header h2 {
            font-size: 2rem;
            font-weight: 700;
            position: relative;
            color: #4a5568;
            margin-top: 0;
        }

        #profile-section .form-header h2::after {
            content: '';
            position: absolute;
            width: 50%;
            height: 4px;
            bottom: -8px;
            left: 25%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        #profile-section .form-group {
            margin-bottom: 1.5rem;
        }

        #profile-section .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4a5568;
            font-weight: 600;
        }

        #profile-section .form-group input {
            width: 100%;
            padding: 0.9rem 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            transition: 0.3s;
            box-sizing: border-box;
        }

        #profile-section .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
        }

        #profile-section .btn-submit {
            width: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            margin-bottom: 12px;
        }

        #profile-section .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        #profile-section .btn-delete {
            width: 100%;
            background: linear-gradient(90deg, #e53e3e, #c53030);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }
        
        #profile-section .btn-delete:hover {
            background: linear-gradient(90deg, #c53030, #9b2c2c);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main-content {
                padding-top: 60px; /* Smaller padding on mobile */
            }
            
            #profile-section .form-container {
                padding: 1.5rem;
            }
            
            #profile-section .form-header h2 {
                font-size: 1.5rem;
            }
            
            #profile-section .form-group input {
                padding: 0.7rem 0.8rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jspf" %>
      <div class="main-content">
    <div id="profile-section">

    <div class="form-container">
        <div class="form-header">
            <h2>Edit Profile</h2>
        </div>
        
        <%
        
        	String firstName = request.getParameter("firstName");
	    	String lastName = request.getParameter("lastName");
	    	String address = request.getParameter("address");
	    	String phone = request.getParameter("phone");
	    	String email = request.getParameter("email");
	    	String password = request.getParameter("password");

        %>
        
        <form action="updateCustomerServlet" method="post">

            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" id="firstName" value="<%=firstName%>" required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" id="lastName" value="<%=lastName%>" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" name="address" id="address" value="<%=address%>" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="tel" name="phone" id="phone" value="<%=phone%>" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" value="<%=email%>" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" value="<%=password%>" required>
            </div>
			<div>
            <button type="submit" class="btn-submit" name="action" value="update">Update</button>
            </div>
            <div>
            <button type="submit" class="btn-submit" name="action" value="delete">Delete</button>
            </div>
        </form>
    </div>
    </div>
    </div>
            <%@ include file="nav.jspf" %>
    
</body>
</html>
