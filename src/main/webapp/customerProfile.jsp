<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, pk.model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
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
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Inter', sans-serif;
            color: #2d3748;
            padding: 20px;
            box-sizing: border-box;
        }

        .profile-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            padding: 2.5rem;
            margin: 1rem;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .profile-header h2 {
            font-size: 2rem;
            font-weight: 700;
            position: relative;
            margin-bottom: 0.5rem;
        }

        .profile-header h2::after {
            content: '';
            position: absolute;
            width: 50%;
            height: 4px;
            bottom: -8px;
            left: 25%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        .profile-details {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            font-size: 1rem;
        }

        .profile-details strong {
            color: #2d3748;
            width: 130px;
            display: inline-block;
        }

        .btn-edit {
            margin-top: 2rem;
            display: block;
            width: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .profile-container {
                padding: 1.5rem;
                margin: 0.5rem;
            }
            
            .profile-header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jspf" %>
<div class="main-content">
    <div class="profile-container">
        <div class="profile-header">
            <h2>Customer Profile</h2>
        </div>

		<c:forEach var="customer" items="${customer}">
	        <div class="profile-details">
	            <div><strong>First Name:</strong> ${customer.firstName}</div>
	            <div><strong>Last Name:</strong> ${customer.lastName}</div>
	            <div><strong>Address:</strong> ${customer.address}</div>
	            <div><strong>Phone:</strong> ${customer.phone}</div>
	            <div><strong>Email:</strong> ${customer.email}</div>
	            <div><strong>Password:</strong> ${customer.password}</div>
	        </div><a href="editCustomerProfile.jsp?customerID=${customer.customerID}&firstName=${customer.firstName}&lastName=${customer.lastName}&address=${customer.address}&phone=${customer.phone}&email=${customer.email}&password=${customer.password}" class="btn-edit">Edit Profile</a>
        </c:forEach>
        
        
    </div>
    </div>
        <%@ include file="nav.jspf" %>
    
</body>
</html>
