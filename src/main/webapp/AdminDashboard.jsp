<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Dashboard</title>
  <style>
    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      margin: 0;
      padding: 0;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    header {
      background: #ffffffee;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid #ccc;
    }

    .dashboard-container {
      display: flex;
      flex: 1;
    }

    .sidebar {
      width: 250px;
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(10px);
      color: #fff;
      padding: 20px 10px;
    }

    .logo {
      text-align: center;
      font-size: 1.6rem;
      font-weight: 700;
      margin-bottom: 30px;
    }

    .nav-links {
      list-style-type: none;
      padding: 0;
    }

    .nav-links li {
      margin: 20px 0;
    }

    .nav-links a {
      display: block;
      color: #fff;
      text-decoration: none;
      padding: 12px 20px;
      border-radius: 8px;
      background: rgba(255, 255, 255, 0.1);
      transition: background 0.3s, transform 0.3s;
    }

    .nav-links a:hover {
      background: rgba(255, 255, 255, 0.3);
      transform: translateX(5px);
    }

    .content {
      flex: 1;
      padding: 40px;
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(10px);
      border-radius: 12px 0 0 12px;
      overflow-y: auto;
    }

    h1 {
      font-size: 2rem;
      font-weight: 700;
      color: #2d3748;
    }

    .btn {
      padding: 10px 20px;
      background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: all 0.3s;
      font-weight: 600;
    }

    .btn:hover {
      transform: translateY(-2px);
    }

    .dashboard-section {
      margin-top: 20px;
    }

    .dashboard-table {
      width: 100%;
      border-collapse: collapse;
      background: rgba(255, 255, 255, 0.9);
    }

    .dashboard-table thead {
      background: linear-gradient(90deg, #667eea, #764ba2);
      color: white;
    }

    .dashboard-table th, .dashboard-table td {
      padding: 15px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }

    .dashboard-table tbody tr:hover {
      background: rgba(240, 240, 240, 0.5);
    }

    .hidden {
      display: none;
    }

    @media (max-width: 768px) {
      .sidebar {
        display: none;
      }

      .content {
        border-radius: 0;
      }
    }
  </style>

  <script>
    function showSection(sectionId) {
      const sections = document.querySelectorAll('.dashboard-section');
      sections.forEach(section => section.classList.add('hidden'));
      document.getElementById(sectionId).classList.remove('hidden');
    }

    function confirmDelete() {
      return confirm("Are you sure you want to delete?");
    }

    window.onload = function () {
      const params = new URLSearchParams(window.location.search);
      if (params.get('updateSuccess') === 'true') {
        const alert = document.getElementById('successAlert');
        if (alert) {
          alert.style.display = 'block';
          setTimeout(() => alert.style.display = 'none', 4000);
        }
      }
      window.history.replaceState({}, document.title, window.location.pathname);
    };
  </script>
</head>

<body>
  <!-- Header fragment (horizontal at top) -->
  <%@ include file="h.jspf" %>

  <div class="dashboard-container">
    <!-- Sidebar (vertical) -->
    <aside class="sidebar">
      <div class="logo">PK Computers - Admin</div>
      <ul class="nav-links">
        <li><a href="#" onclick="showSection('products-section')">Products</a></li>
        <li><a href="#" onclick="showSection('orders-section')">Orders</a></li>
        <li><a href="#" onclick="showSection('users-section')">Users</a></li>
        <li><a href="#" onclick="showSection('suppliers-section')">Suppliers</a></li>
        <li><a href="#" onclick="showSection('profile-section')">Profile</a></li>
      </ul>
    </aside>

    <!-- Main content area -->
    <main class="content">
      <header>
        <h1>Welcome to Admin Dashboard</h1>
      </header>

      <!-- Success Alert -->
      <c:if test="${updateSuccess eq true}">
        <div id="successAlert" style="color: green;">Profile updated successfully.</div>
      </c:if>

      <!-- Sections -->
      <section id="products-section" class="dashboard-section">
        <h2>All Products</h2>
        <table class="dashboard-table">
          <thead>
            <tr>
              <th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="product" items="${allproducts}">
              <tr>
                <td>${product.productID}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.qty}</td>
                <td>
                  <a href="EditProductS?action=Edit&productID=${product.productID}"><button class="btn">Edit</button></a>
                  <a href="EditProductS?action=Delete&productID=${product.productID}" onclick="return confirmDelete()"><button class="btn">Delete</button></a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </section>

      <section id="orders-section" class="dashboard-section hidden">
        <h2>All Orders</h2>
        <table class="dashboard-table">
          <thead>
            <tr><th>Order ID</th><th>Product</th><th>Qty</th><th>Status</th></tr>
          </thead>
          <tbody>
            <c:forEach var="order" items="${allorders}">
              <tr><td>${order.orderID}</td><td>${order.name}</td><td>${order.qty}</td><td>${order.status}</td></tr>
            </c:forEach>
          </tbody>
        </table>
      </section>

      <section id="users-section" class="dashboard-section hidden">
        <h2>All Users</h2>
        <table class="dashboard-table">
          <thead>
            <tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Actions</th></tr>
          </thead>
          <tbody>
            <c:forEach var="customer" items="${allusers}">
              <tr>
                <td>${customer.customerID}</td><td>${customer.firstName}</td><td>${customer.email}</td><td>${customer.phone}</td>
                <td><a href="UserDeleteServlet?customerID=${customer.customerID}" onclick="return confirmDelete()"><button class="btn">Delete</button></a></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </section>

      <section id="suppliers-section" class="dashboard-section hidden">
        <h2>All Suppliers</h2>
        <table class="dashboard-table">
          <thead><tr><th>ID</th><th>Email</th><th>Actions</th></tr></thead>
          <tbody>
            <c:forEach var="supplier" items="${allsuppliers}">
              <tr>
                <td>${supplier.supplierID}</td><td>${supplier.email}</td>
                <td><a href="deleteASupplierServlet?supplierID=${supplier.supplierID}" onclick="return confirmDelete()"><button class="btn">Delete</button></a></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </section>

      <section id="profile-section" class="dashboard-section hidden">
        <h2>Admin Profile</h2>
        <c:forEach var="admin" items="${admin}">
          <p>Email: ${admin.email}</p>
          <p>Password: ********</p>
          <a href="updateAdmin.jsp?email=${admin.email}&password=${admin.password}"><button class="btn">Edit Profile</button></a>
        </c:forEach>
      </section>
    </main>
  </div>

  <!-- Footer / Nav bar fragment -->
  <%@ include file="n.jspf" %>
</body>
</html>

