<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Admin Profile</title>

<style>
/* Reset margin/padding and basic font */
body {
    font-family: 'Inter', sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Center wrapper for form */
.center-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* Form container */
.update-form-container {
    width: 100%;
    max-width: 500px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

h1 {
    font-size: 2rem;
    font-weight: 700;
    color: #2d3748;
    text-align: center;
    margin-bottom: 30px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    color: #4a5568;
    font-weight: 600;
    margin-bottom: 5px;
}

input {
    width: 100%;
    padding: 12px;
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    font-size: 1rem;
    margin-bottom: 20px;
    transition: all 0.3s ease;
}

input:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
    outline: none;
}

.profile-actions {
    display: flex;
    justify-content: space-between;
    gap: 10px;
    margin-top: 10px;
}

.btn {
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
    font-weight: 600;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    flex: 1;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}

.update {
    background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
    color: white;
}

.cancel {
    background: #718096;
    color: white;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.message {
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    text-align: center;
    display: flex;
    justify-content: space-between;
    align-items: center;
    animation: fadeIn 0.5s ease;
}

.success {
    background-color: rgba(56, 161, 105, 0.2);
    border-left: 4px solid #38a169;
    color: #276749;
}

.error {
    background-color: rgba(229, 62, 62, 0.2);
    border-left: 4px solid #e53e3e;
    color: #c53030;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.message .close-btn {
    background: none;
    border: none;
    color: inherit;
    font-size: 1.2rem;
    cursor: pointer;
}
</style>

<script>
    function validateForm() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;

        if (email.trim() === "" || password.trim() === "") {
            alert("Email and password cannot be empty!");
            return false;
        }

        return true;
    }

    function closeMessage() {
        document.querySelector('.message').style.display = 'none';
    }
</script>
</head>
<body>

    <%@ include file="h.jspf" %>

    <div class="center-wrapper">
        <div class="update-form-container">
            <h1>Update Profile</h1>

            <c:if test="${param.error eq 'true'}">
                <div class="message error">
                    <div>Failed to update profile. Please try again.</div>
                    <button class="close-btn" onclick="closeMessage()">×</button>
                </div>
            </c:if>

            <%
                String email = request.getParameter("email");
                String password = request.getParameter("password");
            %>

            <form action="updateAdminServlet" method="post" onsubmit="return validateForm()">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= email != null ? email : "" %>" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="<%= password != null ? password : "" %>" required>

                <div class="profile-actions">
                    <button type="submit" class="btn update">Update</button>
                    <a href="AdminDashboardServlet" class="btn cancel">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="n.jspf" %>

</body>
</html>
