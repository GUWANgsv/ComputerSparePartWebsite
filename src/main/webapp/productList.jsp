<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find your product here</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f8;
        color: #333;
    }

    .product-list {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        padding: 40px;
        max-width: 1200px;
        margin: auto;
    }

    .card {
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .card h3 {
        color: #5a62cd;
        font-size: 20px;
        margin-bottom: 10px;
    }

    .card p {
        margin: 8px 0;
        font-size: 16px;
    }

    .card button {
            background: linear-gradient(135deg, #6e8efb, #a777e3);

        color: white;
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        font-size: 14px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .card button:hover {
			 background: linear-gradient(135deg, #5d7df7, #9a65de);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);    }

    h3.no-products {
        text-align: center;
        margin-top: 100px;
        color: #5a62cd;
    }

    @media (max-width: 600px) {
        .product-list {
            padding: 20px;
        }
    }
</style>
</head>
<body>
    <%@ include file="header.jspf" %>
    
    

<c:if test="${not empty message}">
    <h1>${message}</h1>
</c:if>
<div class="product-list">
<c:forEach var="p" items="${products}">
    <div class="card">
        <img src="${p.getBase64Image('jpeg')}" alt="Product Image" style="max-width: 100%; height: 180px; object-fit: cover; border-radius: 8px; margin-bottom: 15px;">
        <h3>${p.name }</h3>
        <p>${p.category }</p>
        <p>Rs. ${p.price }</p>
        <form action="ProductDetailS" method="get">
            <input type="hidden" name="pid" value="${p.productID}">
            <button type="submit">View Detail</button>
        </form>
    </div>
    </c:forEach>
    
</div>
		
	      
	  <%@ include file="nav.jspf" %>
	

</body>
</html>