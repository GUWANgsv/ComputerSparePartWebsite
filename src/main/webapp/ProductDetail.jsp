<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Details</title>
     <style>
/* General Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', sans-serif;
}

body {
    background: #f4f4f4;
    padding: 30px 30px; /* Adds breathing room */
    
    
}
/* Product Detail Page */
.product-container {
    display: flex;
    flex-wrap: wrap;
    background: rgba(255, 255, 255, 0.895);
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 100%;
    padding: 30px; /* Adds padding inside the container */
    margin: 0 auto;
    gap: 30px;
    align-items: flex-start; 
     margin-top: 40px;
         margin-bottom: 60px; /* Adjust the value as needed */
     
}

/* Product Image */
.product-image img {
      width: 100%;
    max-width: 500px;
    max-height: 400px;
    height: auto;
    border-radius: 10px;
    object-fit: contain;
}

/* Product Details */
.product-details {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 14px;
}

h2 {
    font-size: 28px;
    margin-bottom: 10px;
}

.category, .brand, .price, .quantity, .description, .Warranty {
    font-size: 18px;
    line-height: 1.5;
}

.description {
  word-break: break-word;
    white-space: pre-wrap; 
}

/* Add to Cart Button */
.btn {
	background: linear-gradient(135deg, #6e8efb, #a777e3);
    color: white;
    padding: 14px 24px;
    font-size: 1rem;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 20px;
    align-self: flex-start;
    transition: background 0.3s ease;
}

.btn:hover {
    		background: linear-gradient(135deg, #5d7df7, #9a65de);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); 
    color: black;
}

/* Responsive Design */
@media (max-width: 768px) {
    .product-container {
        flex-direction: column;
        text-align: center;
        padding: 20px;
    }

    .product-details {
        align-items: center;
    }

    .btn {
        align-self: center;
    }
}
.btn:disabled {
    background: #ccc;
    color: #666;
}


    </style>
</head>
<body>
<%@ include file="header.jspf" %>

<div class="product-container">
    <c:forEach var="p" items="${products}">

    <!-- Product Image -->
    <div class="product-image">
        <img src="${p.getBase64Image('jpeg')}" alt="Product Image">
    </div>
<div class="product-details">
        <h2>${p.name}</h2>
        <p class="category"><strong>Category:</strong> ${p.category}</p>
        <p class="Warranty" style="color:#6989f1"><strong>Warranty: 2 years</strong></p>
        <p class="price"><strong>Price:</strong> Rs. ${p.price}</p>
        <p class="quantity"><strong>Quantity:</strong> ${p.qty}</p>

        <!-- Stock Status -->
        <p class="available" style="font-size:25px; margin-bottom: 4%; margin-top: 2%;">
            <strong>
                <c:choose>
                    <c:when test="${p.qty > 0}">
                        <span id="product-available" style="color: green;">In Stock</span>
                    </c:when>
                    <c:otherwise>
                        <span id="product-available" style="color: red;">Out of Stock</span>
                    </c:otherwise>
                </c:choose>
            </strong>
        </p>

        <p class="description"><strong>Description:</strong> ${p.description}</p>

        <!-- Add to Cart Button -->
        <form action="CartEditS" method="post">
            <input type="hidden" name="pid" value="${p.productID}">
            <input type="hidden" name="quantity" value="1" min="1" max="1">
            <input type="hidden" name="total" value="${p.price}">
            <input type="hidden" name="action" value="add">
            
            <button class="btn" 
                style="${p.qty == 0 ? 'opacity: 0.5; cursor: not-allowed;' : 'opacity: 1; cursor: pointer;'}" 
                ${p.qty == 0 ? 'disabled' : ''}>
                Add to Cart
            </button>
        </form>
</div>

      </c:forEach>
  
</div>








<%@ include file="nav.jspf" %>

</body>
</html>