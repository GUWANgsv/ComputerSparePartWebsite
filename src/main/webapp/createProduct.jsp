<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create product here</title>
<style>
/* Scoped styles for the spare parts form only */
.spare-parts-form-wrapper {
  display: flex;
  justify-content: center;
  padding: 2rem;
  font-family: 'Arial', sans-serif;
 
}

.spare-parts-form-container {
  background-color: #f8f9fa;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  padding: 2rem;
  width: 100%;
  max-width: 600px;
}

.spare-parts-form-container h2 {
  color: #5a62cd;
  margin-top: 0;
  margin-bottom: 1.5rem;
  text-align: center;
  font-size: 1.75rem;
  border-bottom: 2px solid #6989f1;
  padding-bottom: 0.75rem;
}

/* Form Controls - scoped to spare parts form */
.spare-parts-form-container form {
  display: flex;
  flex-direction: column;
}

.spare-parts-form-container label {
  margin-top: 1rem;
  margin-bottom: 0.5rem;
  font-weight: 600;
  color: #34495e;
}

.spare-parts-form-container input,
.spare-parts-form-container select,
.spare-parts-form-container textarea {
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  margin-bottom: 1rem;
  transition: border-color 0.3s, box-shadow 0.3s;
}

.spare-parts-form-container input:focus,
.spare-parts-form-container select:focus,
.spare-parts-form-container textarea:focus {
  border-color: #3498db;
  outline: none;
  box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
}

.spare-parts-form-container input[type="file"] {
  padding: 0.5rem 0;
  border: none;
}

.spare-parts-form-container textarea {
  resize: vertical;
  min-height: 100px;
}

/* Button Styling - scoped to spare parts form */
.spare-parts-form-container .spare-parts-btn {
	background: linear-gradient(135deg, #6e8efb, #a777e3);

  color: white;
  border: none;
  padding: 0.875rem;
  font-size: 1rem;
  font-weight: 600;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 1rem;
  transition: background-color 0.3s;
}

.spare-parts-form-container .spare-parts-btn:hover {
			 background: linear-gradient(135deg, #5d7df7, #9a65de);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); 
}

.spare-parts-form-container .spare-parts-btn:active {
  transform: translateY(1px);
}

@media (max-width: 768px) {
  .spare-parts-form-container {
    padding: 1.5rem;
  }

  .spare-parts-form-container input,
  .spare-parts-form-container select,
  .spare-parts-form-container textarea {
    padding: 0.625rem;
  }
}
</style>
</head>
<body>

<%@ include file="h.jspf" %>

<div class="spare-parts-form-wrapper">
  <div class="spare-parts-form-container">
    <h2>Add New Spare Part</h2>
    <form action="CreateProductS" method="post" enctype="multipart/form-data">
      <label for="category">Category:</label>
      <select name="category" required>
        <option value="">Select a Category</option>
        <option value="Processor">Processor</option>
        <option value="Motherboard">Motherboard</option>
        <option value="RAM">RAM</option>
        <option value="SSD">SSD</option>
        <option value="HDD">HDD</option>
        <option value="Graphics Card">Graphics Card</option>
        <option value="Power Supply">Power Supply</option>
        <option value="Case">Case</option>
        <option value="Speakers">Speakers</option>
        <option value="coolsystem">Cool system(air/liquid)</option>
        <option value="Monitor">Moniter</option>
        <option value="Keyboard">Keyboard</option>
        <option value="Mouse">Mouse</option>
      </select>

      <label for="name">Item Name:</label>
      <input type="text" name="name" placeholder="Enter item name" required>

      <label for="price">Price (Rs):</label>
      <input type="number" name="price" placeholder="Enter price" min="0" step="0.01" required>

      <label for="quantity">Quantity:</label>
      <input type="number" name="quantity" placeholder="Enter quantity" min="0" required>

      <label for="image">Item Picture:</label>
      <input type="file" name="image" accept="image/*" required>

      <label for="description">Description:</label>
      <textarea name="description" rows="4" placeholder="Enter item description" required></textarea>

      <button type="submit" class="spare-parts-btn">Add Item</button>
    </form>
  </div>
</div>

<%@ include file="n.jspf" %>

</body>
</html>