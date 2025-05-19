<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<title>Customer Registration</title>
<style>
   body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        color: #2d3748;
    }

    .page-background {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 3rem 1rem;
    }

    .registration-container {
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

    .registration-header {
        text-align: center;
        margin-bottom: 2.5rem;
    }

    .registration-header h2 {
        color: #2d3748;
        font-weight: 700;
        margin: 0;
        font-size: 2rem;
        position: relative;
        display: inline-block;
        padding-bottom: 8px;
    }

    .registration-header h2:after {
        content: '';
        position: absolute;
        width: 50%;
        height: 4px;
        bottom: 0;
        left: 25%;
        background: linear-gradient(90deg, #667eea, #764ba2);
        border-radius: 2px;
    }

    .registration-form {
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
    }

    .form-group {
        position: relative;
    }

    .form-control {
        width: 100%;
        padding: 0.9rem 1.2rem;
        border: 2px solid #e2e8f0;
        border-radius: 10px;
        font-size: 1rem;
        background: rgba(255, 255, 255, 0.8);
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .form-control:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
        transform: translateY(-1px);
    }

    .form-group label {
        position: absolute;
        top: 0.9rem;
        left: 1.2rem;
        background: rgba(255, 255, 255, 0.8);
        padding: 0 0.3rem;
        transition: all 0.2s ease;
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
        transition: all 0.3s ease;
        margin-top: 1rem;
        letter-spacing: 0.5px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .btn:active {
        transform: translateY(0);
    }

    .form-footer {
        text-align: center;
        margin-top: 1.5rem;
        color: #718096;
        font-size: 0.9rem;
    }

    .form-footer a {
        color: #667eea;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.2s;
    }

    .form-footer a:hover {
        color: #764ba2;
        text-decoration: underline;
        text-underline-offset: 3px;
    }

    /* Content wrapper to separate from header and nav */
    .content-wrapper {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .main-content {
        flex: 1;
    }

    @media (max-width: 600px) {
        .registration-container {
            padding: 2rem 1.5rem;
            margin: 1rem;
            backdrop-filter: blur(8px);
        }

        .registration-header h2 {
            font-size: 1.7rem;
        }
    }
</style>
</head>
<body>
<div class="content-wrapper">
    <%@ include file="header.jspf" %>
    <div class="main-content">
            <div class="page-background">
	<div class="registration-container">
		<div class="registration-header">
			<h2>Create Your Account</h2>
		</div>

		<form class="registration-form" action="customerRegistrationServlet" method="post">
			<div class="form-group">
				<input type="text" id="firstName" name="firstName" class="form-control" placeholder=" " required>
				<label for="firstName">First Name</label>
			</div>

			<div class="form-group">
				<input type="text" id="lastName" name="lastName" class="form-control" placeholder=" " required>
				<label for="lastName">Last Name</label>
			</div>

			<div class="form-group">
				<input type="text" id="address" name="address" class="form-control" placeholder=" " required>
				<label for="address">Address</label>
			</div>

			<div class="form-group">
				<input type="tel" id="phone" name="phone" class="form-control" placeholder=" " required>
				<label for="phone">Phone Number</label>
			</div>

			<div class="form-group">
				<input type="email" id="email" name="email" class="form-control" placeholder=" " required>
				<label for="email">Email Address</label>
			</div>

			<div class="form-group">
				<input type="password" id="password" name="password" class="form-control" placeholder=" " required>
				<label for="password">Password</label>
			</div>

			<button type="submit" class="btn">Register Now</button>

			<div class="form-footer">
				Already have an account? <a href="Login.jsp">Sign in</a>
			</div>
		</form>
	</div>
	</div>
	</div>
	        <%@ include file="nav.jspf" %>
	</div>
</body>
</html>
