<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Body changed to column flex, full height */
    body {
        font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
    }

    /* Main content wrapper takes available space and centers content */
    .main-content-wrapper {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px;
    }

    .container {
        width: 100%;
        max-width: 550px;
        background: white;
        padding: 30px 35px;
        border-radius: 15px;
        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        color: #4a148c;
        margin-bottom: 15px;
        font-size: 24px;
    }

    .product-image {
        text-align: center;
        margin-bottom: 20px;
    }

    .product-image img {
        max-width: 100%;
        max-height: 200px;
        border-radius: 10px;
        object-fit: contain;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    label {
        display: block;
        font-size: 16px;
        font-weight: 500;
        margin-bottom: 6px;
        color: #333;
        margin-top: 15px;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 12px 14px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        outline: none;
        transition: 0.3s ease;
    }

    input[type="text"]:disabled {
        background-color: #f5f5f5;
        color: #666;
    }

    input[type="number"]:focus {
        border-color: #6200ea;
        box-shadow: 0 0 0 2px rgba(98, 0, 234, 0.2);
    }

    .btn-group {
        margin-top: 30px;
        display: flex;
        justify-content: space-between;
        gap: 15px;
    }

    .btn {
        flex: 1;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        color: #fff;
        transition: background 0.3s ease, transform 0.2s ease;
        text-align: center;
        text-decoration: none;
    }

    .btn-update {
        background: linear-gradient(to right, #7b1fa2, #512da8);
    }

    .btn-delete {
        background: linear-gradient(to right, #d32f2f, #c2185b);
    }

    .btn:hover {
        transform: scale(1.03);
    }

    .btn:active {
        transform: scale(0.98);
    }

    @media (max-width: 500px) {
        .container {
            padding: 25px 20px;
        }

        .btn-group {
            flex-direction: column;
        }
    }
</style>
</head>
<body>

    <%@ include file="h.jspf" %>

    <div class="main-content-wrapper">
        <c:forEach var="p" items="${pro}">
            <div class="container">
                <h2>Edit Product</h2>
                <h2>${p.name}</h2>
                <div class="product-image">
                    <img src="${p.getBase64Image('jpeg')}" alt="Product Image" />
                </div>

                <form action="EditProductS" method="get">
                    <input type="hidden" name="productID" value="${p.productID}" />

                    <label for="price">Price:</label>
                    <input type="number" name="price" value="${p.price}" required />

                    <label for="qty">Quantity:</label>
                    <input type="number" name="qty" min="1" value="${p.qty}" required />

                    <input type="hidden" name="action" value="Update" />

                    <div class="btn-group">
                        <button type="submit" class="btn btn-update">Update</button>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>

    <%@ include file="n.jspf" %>

</body>
</html>
