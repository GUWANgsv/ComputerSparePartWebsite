
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Global styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #2d3748;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* We're not styling the header directly - letting the included header.jspf
       maintain its original styling */

        /* Main content container */
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }

        /* Forgot password specific styles */
        .forgot-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 480px;
            padding: 2.5rem;
            margin: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        .forgot-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .forgot-header h2 {
            color: #2d3748;
            font-weight: 700;
            margin: 0;
            font-size: 2rem;
            position: relative;
            display: inline-block;
            padding-bottom: 8px;
        }

        .forgot-header h2:after {
            content: '';
            position: absolute;
            width: 50%;
            height: 4px;
            bottom: 0;
            left: 25%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-control {
            width: 100%;
            padding: 0.9rem 1.2rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.8);
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
        }

        .form-group label {
            position: absolute;
            top: 0.9rem;
            left: 1.2rem;
            background: rgba(255, 255, 255, 0.8);
            padding: 0 0.3rem;
            transition: 0.2s ease;
            font-size: 0.95rem;
            color: #4a5568;
            pointer-events: none;
        }

        .form-control:focus ~ label,
        .form-control:not(:placeholder-shown) ~ label {
            top: -0.6rem;
            left: 0.8rem;
            font-size: 0.8rem;
            color: #667eea;
        }

        .btn {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .error, .success {
            text-align: center;
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        /* Navigation styles - simplified to avoid affecting other elements */
        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            margin: 1rem 0;
        }

        nav ul li {
            margin: 0 1rem;
        }

        nav ul li a {
            color: #4a5568;
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <%@ include file="header.jspf" %>

    <div class="main-content">
        <div class="forgot-container">
            <div class="forgot-header">
                <h2>Forgot Password</h2>
            </div>

            <% 
                String error = (String) request.getAttribute("error");
                String message = (String) request.getAttribute("message");
                String email = (String) request.getAttribute("email");
                Boolean verified = (Boolean) request.getAttribute("verified");
                Boolean showLogin = (Boolean) request.getAttribute("showLogin");
            %>

            <% if (error != null) { %>
                <div class="error"><%= error %></div>
            <% } %>

            <% if (message != null) { %>
                <div class="success"><%= message %></div>
            <% } %>

            <% if (verified != null && verified) { %>
                <form action="forgot-password" method="post">
                    <input type="hidden" name="action" value="reset" />
                    <input type="hidden" name="email" value="<%= email %>" />
                    <div class="form-group">
                        <input type="password" name="newPassword" class="form-control" placeholder=" " required />
                        <label>New Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" name="confirmPassword" class="form-control" placeholder=" " required />
                        <label>Confirm Password</label>
                    </div>
                    <button type="submit" class="btn">Reset Password</button>
                </form>
            <% } else if (showLogin != null && showLogin) { %>
                <form action="Login.jsp" method="get" style="margin-top: 1rem;">
                    <button type="submit" class="btn">Login</button>
                </form>
            <% } else { %>
                <form action="forgot-password" method="post">
                    <input type="hidden" name="action" value="verify" />
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder=" " required />
                        <label>Enter your email</label>
                    </div>
                    <button type="submit" class="btn">Verify</button>
                </form>
            <% } %>
        </div>
    </div>

    <%@ include file="nav.jspf" %>
</body>
</html>