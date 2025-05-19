<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Supplier Dashboard</title>

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Inter', sans-serif;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

/* Container for sidebar and main content */
.dashboard-container {
	display: flex;
	flex: 1;
	min-height: calc(100vh - 60px); /* adjust based on header/footer height */
}

/* Sidebar styling */
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

/* Main Content Area */
.content {
	flex: 1;
	padding: 40px;
	background: rgba(255, 255, 255, 0.85);
	backdrop-filter: blur(10px);
	border-radius: 0 0 0 0;
	overflow-y: auto;
}

.content-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
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
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

/* Dashboard Sections */
.dashboard-section {
	margin-top: 20px;
}

h2 {
	color: #2d3748;
	font-size: 1.8rem;
	margin-bottom: 10px;
}

.dashboard-table {
	width: 100%;
	border-collapse: collapse;
	background: rgba(255, 255, 255, 0.9);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	overflow: hidden;
}

.dashboard-table thead tr {
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

.edit { background: #4c51bf; }
.delete { background: #e53e3e; }
.accept { background: #38a169; }
.decline { background: #e53e3e; }
.add-product { background: #38a169; }

/* Profile Section Form */
.profile-section input {
	width: 100%;
	padding: 12px;
	border: 2px solid #e2e8f0;
	border-radius: 8px;
	font-size: 1rem;
	margin: 10px 0;
}

.profile-section input:focus {
	border-color: #667eea;
	box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
}

.profile-actions {
	display: flex;
	gap: 10px;
}

/* Hidden utility class */
.hidden {
	display: none;
}

/* Alert Styles */
.alert-message {
	padding: 15px;
	margin: 20px 0;
	border-radius: 8px;
	display: flex;
	justify-content: space-between;
	animation: fadeIn 0.5s ease;
}

.alert-success {
	background-color: rgba(56, 161, 105, 0.2);
	border-left: 4px solid #38a169;
	color: #276749;
}

@keyframes fadeIn {
	from { opacity: 0; transform: translateY(-10px); }
	to { opacity: 1; transform: translateY(0); }
}

.alert-message .close-btn {
	background: none;
	border: none;
	color: inherit;
	font-size: 1.2rem;
	cursor: pointer;
}

/* Responsive */
@media (max-width: 768px) {
	.sidebar {
		display: none;
	}
	.content {
		border-radius: 0;
		padding: 20px;
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
	return confirm("Are you sure you want to delete your profile? This action cannot be undone.");
}

function closeAlert() {
	document.getElementById('successAlert').style.display = 'none';
}

function confirmDecline() {
	return confirm("Are you sure you want to decline this order? This action cannot be undone.");
}

window.onload = function () {
	const urlParams = new URLSearchParams(window.location.search);

	if (urlParams.get('updateSuccess') === 'true') {
		const alert = document.getElementById('successAlert');
		if (alert) {
			alert.style.display = 'flex';
			setTimeout(() => { alert.style.display = 'none'; }, 5000);
		}
	}

	if (urlParams.get('orderSuccess') === 'true') {
		const alert = document.getElementById('orderSuccessAlert');
		if (alert) {
			alert.style.display = 'flex';
			setTimeout(() => { alert.style.display = 'none'; }, 5000);
		}
	}

	if (urlParams.get('declineSuccess') === 'true') {
		const alert = document.getElementById('declineSuccessAlert');
		if (alert) {
			alert.style.display = 'flex';
			setTimeout(() => { alert.style.display = 'none'; }, 5000);
		}
	}

	window.history.replaceState({}, document.title, window.location.pathname);
};
</script>
</head>

<body>
	<%@ include file="h.jspf" %>

	<div class="dashboard-container">
		<aside class="sidebar">
			<div class="logo">
				<h2>PK Computers</h2>
			</div>
			<ul class="nav-links">
				<li><a href="#" onclick="showSection('products-section')">Products</a></li>
				<li><a href="#" onclick="showSection('orders-section')">Orders</a></li>
				<li><a href="#" onclick="showSection('profile-section')">Manage Profile</a></li>
			</ul>
		</aside>

		<main class="content">
			<header class="content-header">
				<h1>Welcome to Supplier Dashboard</h1>
				<button class="btn add-product" onclick="window.location.href='createProduct.jsp'">+ Add Product</button>
			</header>

			<!-- Alerts -->
			<c:if test="${updateSuccess eq true}">
				<div id="successAlert" class="alert-message alert-success">
					<div><strong>Success!</strong> Your profile has been updated successfully.</div>
					<button class="close-btn" onclick="closeAlert()">×</button>
				</div>
			</c:if>

			<c:if test="${orderSuccess eq true}">
				<div id="orderSuccessAlert" class="alert-message alert-success">
					<div><strong>Success!</strong> Order has been accepted.</div>
					<button class="close-btn" onclick="closeAlert()">×</button>
				</div>
			</c:if>

			<c:if test="${declineSuccess eq true}">
				<div id="declineSuccessAlert" class="alert-message alert-success">
					<div><strong>Success!</strong> Order has been declined.</div>
					<button class="close-btn" onclick="closeAlert()">×</button>
				</div>
			</c:if>

			<!-- Products -->
			<section id="products-section" class="dashboard-section">
				<h2>All Products</h2>
				<table class="dashboard-table">
					<thead>
						<tr>
							<th>Product ID</th>
							<th>Name</th>
							<th>Price</th>
							<th>Stock</th>
							<th>Actions</th>
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
									<button class="btn edit" onclick="window.location.href='EditProductS?action=Edit&productID=${product.productID}'">Edit</button>
									<button class="btn delete" onclick="window.location.href='EditProductS?action=Delete&productID=${product.productID}'">Delete</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>

			<!-- Orders -->
			<section id="orders-section" class="dashboard-section hidden">
				<h2>All Orders</h2>
				<table class="dashboard-table">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Product</th>
							<th>Quantity</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${allorders}">
							<tr>
								<td>${order.orderID}</td>
								<td>${order.name}</td>
								<td>${order.qty}</td>
								<td>${order.status}</td>
								<td>
									<a href="acceptOrderServlet?orderID=${order.orderID}&status=completed">
										<button class="btn accept">Accept</button>
									</a>
									<a href="declineOrderServlet?orderID=${order.orderID}" onclick="return confirmDecline()">
										<button class="btn decline">Decline</button>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>

			<!-- Profile -->
			<section id="profile-section" class="dashboard-section hidden profile-section">
				<h2>Manage Profile</h2>
				<c:forEach var="supplier" items="${supplier}">
					<div class="profile-details">
						<div class="profile-field"><label>Email:</label><p>${supplier.email}</p></div>
						<div class="profile-field"><label>Password:</label><p>********</p></div>
						<div class="profile-actions">
							<a href="updateSupplier.jsp?email=${supplier.email}&password=${supplier.password}">
								<button class="btn update">Edit Profile</button>
							</a>
						</div>
					</div>
				</c:forEach>
			</section>
		</main>
	</div>

	<%@ include file="n.jspf" %>
</body>
</html>
