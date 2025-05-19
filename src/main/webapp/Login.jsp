<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        
        body {
            background: linear-gradient(135deg, #6e8efb, #a777e3);
        
            min-height: 100vh;
       
           
        }
  
        .page-content {
        
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            margin: 0;
        }
        
      
        
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            padding: 40px 30px;
            width: 400px;
            max-width: 90%;
            margin: 20px 0;
        }
        
        .form-title {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #a777e3;
            outline: none;
            box-shadow: 0 0 0 2px rgba(167, 119, 227, 0.2);
        }
        
        .remember-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .remember-container input {
            margin-right: 8px;
        }
        
        .btn {
            width: 100%;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background: linear-gradient(135deg, #5d7df7, #9a65de);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .error-message {
            color: #ff3860;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }
        
        .links {
            margin-top: 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
        }
        
        .links a {
            color: #6e8efb;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .links a:hover {
            color: #a777e3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="header.jspf" %>
    <main class="page-content">
        <div class="container">
            <h2 class="form-title">Welcome Back</h2>
            <form action="LoginS" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <div class="remember-container">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember Me</label>
                </div>
                <button type="submit" class="btn">Login</button>
                <p class="error-message"><%= request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : "" %></p>
                <div class="links">
                    <a href="customerRegistration.jsp">Sign Up</a>
                    <a href="ForgotPassword.jsp">Forgot Password?</a>
                </div>
            </form>
        </div>
    </main>
    <%@ include file="nav.jspf" %>
    <script>
    document.querySelector("form").addEventListener("submit", function (e) {
        const emailInput = document.getElementById("email");
        const email = emailInput.value.trim();
        const errorMessage = document.querySelector(".error-message");

        // Basic email pattern check
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {
            e.preventDefault(); // Stop form from submitting
            errorMessage.textContent = "Please enter a valid email address.";
            emailInput.focus();
        } else {
            errorMessage.textContent = ""; // Clear any previous error
        }
    });
</script>
    
</body>
</html>