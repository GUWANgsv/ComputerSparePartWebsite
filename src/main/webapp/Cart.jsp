<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<style>
	/* Enhanced Cart Styles - Scoped to avoid affecting header/nav */
/* Main cart container */
.cart-container {
    width: 95%;
    max-width: 1200px;
    margin: 2rem auto;
    padding: 0 1rem;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Cart heading */
.cart-container h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 2rem;
    font-size: 2rem;
    font-weight: 600;
    position: relative;
    padding-bottom: 0.8rem;
}

.cart-container h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background: linear-gradient(to right, #3498db, #9b59b6);
    border-radius: 2px;
}

/* Cart item styling */
.cart-item {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.07);
    margin-bottom: 1.5rem;
    overflow: hidden;
    display: flex;
    flex-wrap: wrap;
    transition: transform 0.3s, box-shadow 0.3s;
    position: relative;
    border: 1px solid rgba(0, 0, 0, 0.08);
}

.cart-item:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

/* Product image container */
.product-image {
    flex: 0 0 200px;
    padding: 1.2rem;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f9f9f9;
}

.product-image img {
    max-width: 100%;
    max-height: 150px;
    object-fit: contain;
    border-radius: 6px;
    transition: transform 0.3s;
}

.cart-item:hover .product-image img {
    transform: scale(1.05);
}

/* Product details area */
.product-details {
    flex: 1;
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
}

.cart-item h3 {
    margin: 0 0 0.8rem 0;
    color: #2c3e50;
    font-size: 1.3rem;
    font-weight: 600;
}

.cart-item p {
    margin: 0.5rem 0;
    color: #555;
    font-size: 1rem;
    display: flex;
    align-items: center;
}

/* Price styling */
.cart-item p:nth-of-type(1) {
    font-weight: 600;
    color: #3498db;
}

/* Quantity input styling */
.cart-item input[type="number"] {
    padding: 0.6rem;
    width: 80px;
    border: 2px solid #e0e0e0;
    border-radius: 6px;
    font-size: 0.95rem;
    margin-left: 0.5rem;
    transition: border 0.3s;
    background: #fcfcfc;
}

.cart-item input[type="number"]:focus {
    outline: none;
    border-color: #3498db;
    box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

/* Total price styling */
.line-total {
    font-weight: 700;
    color: #e74c3c;
}

/* Action buttons container */
.action-buttons {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 1rem;
}

/* Form styling to stay inline */
.cart-item form {
    margin: 0;
    padding: 0;
}

/* Button styling */
.cart-item button {
    cursor: pointer;
    padding: 0.7rem 1.2rem;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    font-size: 0.9rem;
    transition: all 0.2s;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 100px;
    color: white;
}

/* Remove button */
.cart-item form:nth-of-type(1) button {
    background-color: #e74c3c;
}

.cart-item form:nth-of-type(1) button:hover {
    background-color: #c0392b;
}

/* Save button */
.cart-item form:nth-of-type(2) button {
    background-color: #2ecc71;
}

.cart-item form:nth-of-type(2) button:hover {
    background-color: #27ae60;
}

/* Checkout button */
.cart-item form:nth-of-type(3) button {
    background-color: #f39c12;
}

.cart-item form:nth-of-type(3) button:hover {
    background-color: #e67e22;
}

/* Continue shopping button */
.continue-shopping {
    margin: 2rem 0;
    text-align: center;
}

.continue-shopping a button {
    background-color: #9b59b6;
    color: white;
    padding: 0.8rem 2rem;
    border: none;
    border-radius: 6px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.continue-shopping a button:hover {
    background-color: #8e44ad;
    transform: translateY(-2px);
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
}

/* Empty cart message */
.empty-cart {
    text-align: center;
    padding: 4rem 0;
    color: #7f8c8d;
    font-size: 1.2rem;
}

/* Responsive design */
@media (max-width: 768px) {
    .cart-item {
        flex-direction: column;
    }
    
    .product-image {
        flex: 0 0 auto;
        width: 100%;
        max-height: 200px;
    }
    
    .action-buttons {
        justify-content: center;
    }
}


.cart-summary {
    background: white;
    border-radius: 12px;
    padding: 1.5rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.07);
    margin-top: 2rem;
}

.cart-summary h3 {
    border-bottom: 1px solid #eee;
    padding-bottom: 1rem;
    margin-top: 0;
}

.summary-item {
    display: flex;
    justify-content: space-between;
    margin: 0.7rem 0;
}

.summary-total {
    font-weight: 700;
    font-size: 1.2rem;
    color: #e74c3c;
    border-top: 1px solid #eee;
    padding-top: 1rem;
    margin-top: 1rem;
}
</style>
</head>
<body>
 <%@ include file="header.jspf" %>
 <div class="cart-container">
  <h2>My Cart</h2>

    <c:forEach var="c" items="${clist}">
        <div class="cart-item cart-section-item" data-cartid="${c.cartID}">
            <h3>Product: ${c.productName}</h3>

            <div class="product-image">
                <img src="${c.getBase64Image('jpeg')}" alt="Product Image">
            </div>
  <div class="product-details">
            <p>Price: Rs. ${c.productPrice}</p>
            <p>
                Quantity:
                <input type="number"
                       id="quantity_${c.cartID}"
                       name="quantity_${c.productID}"
                       value="${c.qty}"
                       min="1"
                       max="${c.productQty }"
                       onchange="updateTotal(this, ${c.cartID})"
                       data-price="${c.productPrice}"
                       data-cart-id="${c.cartID}" />
            </p>

            <p>
                Total: Rs. <span id="line-total-${c.cartID}" class="line-total">${c.productPrice * c.qty}</span>
            </p>

            

           <div class="action-buttons">  
            
            <form action="CartEditS" method="post">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="cartId" value="${c.cartID}">
                <button type="submit">Remove</button>
            </form>
            
            <form id="saveForm_${c.cartID}" action="CartEditS" method="post">
                <input type="hidden" name="action" value="save">
                <input type="hidden" id="quantity_hidden_${c.cartID}" name="quantity" value="${c.qty}" class="hidden-quantity">
                <input type="hidden" id="total_hidden_${c.cartID}" name="total" value="${c.productPrice * c.qty}" class="hidden-total">
                <input type="hidden" name="cartId" value="${c.cartID}">
                <button type="submit">Save</button>
            </form>
            <form id="checkForm_${c.cartID}" action="CartEditS" method="post">
    			<input type="hidden" name="action" value="checkout">                          
    			<input type="hidden" id="checkout_quantity_hidden_${c.cartID}" name="quantity" value="${c.qty}" class="hidden-quantity">
    			<input type="hidden" id="checkout_total_hidden_${c.cartID}" name="total" value="${c.productPrice * c.qty}" class="hidden-total">
    			<input type="hidden" name="cartId" value="${c.cartID}">
    			<button type="submit">Checkout</button>
</form>
            
          
            </div>
              </div>
        </div>
    </c:forEach>

    <div class="continue-shopping">
        <a href="Home.jsp"><button type="button">Continue Shopping</button></a>
    </div>

</div>

<div class="cart-container">
<h2>My Orders</h2>
  <div class="cart-item">
  <div class="product-details">
  <c:forEach var="o" items="${order}">
            <h3>Product: ${o.name}</h3>
            <input type="hidden" class="order-cart-id" data-cartid="${o.cartID}" >
  			<h4 style="color:blue;">
                Total: Rs. ${o.total}
            </h4>
  			<p style="color:black;">
                Quantity:  <span >${o.qty}</span>
            </p>
            <p>
                Date: <span >${o.date}</span>
            </p>
  			<h4 style="color:red;">
                status:  <span>${o.status}</span>
            </h4>
            <br>
  </c:forEach>
  
  </div>
  
  </div>

</div>

<script>
function updateTotal(input, cartId) {
    var price = parseFloat(input.getAttribute("data-price"));
    var quantity = parseInt(input.value);
    var total = price * quantity;

    // Update the visible total
    var lineTotal = document.getElementById('line-total-' + cartId);
    lineTotal.textContent = total.toFixed(2);
    
    // Update the Save form hidden fields
    var hiddenQuantity = document.getElementById('quantity_hidden_' + cartId);
    var hiddenTotal = document.getElementById('total_hidden_' + cartId);
    
    if (hiddenQuantity) {
        hiddenQuantity.value = quantity;
    }
    
    if (hiddenTotal) {
        hiddenTotal.value = total.toFixed(2);
    }

    // Update the Checkout form hidden fields
    var checkoutQuantity = document.getElementById('checkout_quantity_hidden_' + cartId);
    var checkoutTotal = document.getElementById('checkout_total_hidden_' + cartId);

    if (checkoutQuantity) {
        checkoutQuantity.value = quantity;
    }

    if (checkoutTotal) {
        checkoutTotal.value = total.toFixed(2);
    }

    console.log("Updated cart ID: " + cartId + ", New quantity: " + quantity + ", New total: " + total.toFixed(2));
}


</script>



<%@ include file="nav.jspf" %>
</body>
</html>