<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PK Computer Spare Parts - About Us</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header Styles */
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .logo {
            font-size: 28px;
            font-weight: bold;
        }
        
        .logo span {
            color: #3498db;
        }
        
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .nav-links {
            list-style: none;
            display: flex;
        }
        
        .nav-links li {
            margin-left: 30px;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-links a:hover {
            color: #3498db;
        }
        
        /* Hero Section */
        .hero {
            background-color: #3498db;
            color: white;
            padding: 80px 0;
            text-align: center;
        }
        
        .hero h1 {
            font-size: 40px;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 18px;
            max-width: 700px;
            margin: 0 auto;
        }
        
        /* About Section */
        .about-section {
            padding: 80px 0;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
            position: relative;
        }
        
        .section-title h2 {
            font-size: 32px;
            display: inline-block;
        }
        
        .section-title h2:after {
            content: '';
            display: block;
            width: 70px;
            height: 3px;
            background-color: #3498db;
            margin: 15px auto 0;
        }
        
        .about-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 60px;
            flex-wrap: wrap;
        }
        
        .about-text {
            flex: 1;
            min-width: 300px;
            padding-right: 40px;
        }
        
        .about-text h3 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        
        .about-image {
            flex: 1;
            min-width: 300px;
            text-align: center;
        }
        
        .about-image img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Team Section */
        .team-section {
            padding: 80px 0;
            background-color: white;
        }
        
        .team-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
        }
        
        .team-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            width: 250px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .team-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .team-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        
        .card-content {
            padding: 20px;
            text-align: center;
        }
        
        .card-content h3 {
            font-size: 20px;
            margin-bottom: 5px;
            color: #2c3e50;
        }
        
        .card-content p {
            color: #7f8c8d;
            margin-bottom: 15px;
        }
        
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .social-icons a {
            color: #3498db;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s;
        }
        
        .social-icons a:hover {
            color: #2c3e50;
        }
        
        /* Services Section */
        .services-section {
            padding: 80px 0;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .service-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: transform 0.3s;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
        }
        
        .service-icon {
            font-size: 40px;
            color: #3498db;
            margin-bottom: 20px;
        }
        
        .service-card h3 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #2c3e50;
        }
        
        /* Contact Section */
        .contact-section {
            padding: 80px 0;
            background-color: white;
        }
        
        .contact-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 40px;
        }
        
        .contact-info {
            flex: 1;
            min-width: 300px;
        }
        
        .contact-info h3 {
            font-size: 24px;
            margin-bottom: 25px;
            color: #2c3e50;
        }
        
        .contact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        
        .contact-icon {
            color: #3498db;
            font-size: 20px;
            margin-right: 15px;
            margin-top: 5px;
        }
        
        .contact-details h4 {
            font-size: 18px;
            margin-bottom: 5px;
            color: #2c3e50;
        }
        
        .contact-details p {
            color: #7f8c8d;
        }
        
        .contact-form {
            flex: 1;
            min-width: 300px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 500;
        }
        
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            font-size: 16px;
        }
        
        .form-group textarea {
            height: 150px;
            resize: vertical;
        }
        
        .submit-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .submit-btn:hover {
            background-color: #2980b9;
        }
        
        /* Footer */
        footer {
            background-color: #2c3e50;
            color: white;
            padding: 40px 0 20px;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 40px;
            margin-bottom: 30px;
        }
        
        .footer-column {
            flex: 1;
            min-width: 200px;
        }
        
        .footer-column h3 {
            font-size: 20px;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-column h3:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 2px;
            background-color: #3498db;
        }
        
        .footer-column p {
            margin-bottom: 15px;
            color: #bdc3c7;
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 10px;
        }
        
        .footer-links a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-links a:hover {
            color: #3498db;
        }
        
        .copyright {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #bdc3c7;
        }
        
        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .about-content {
                flex-direction: column;
            }
            
            .about-text {
                padding-right: 0;
                margin-bottom: 30px;
            }
            
            .about-image {
                width: 100%;
            }
            
            .team-card {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
    <!-- Page begins with Hero Section -->
    <%@ include file="header.jspf" %>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1>About PK Computer Spare Parts</h1>
            <p>Your trusted partner for high-quality computer components and exceptional service</p>
        </div>
    </section>

    <!-- About Section -->
    <section class="about-section">
        <div class="container">
            <div class="section-title">
                <h2>Our Story</h2>
            </div>
            <div class="about-content">
                <div class="about-text">
                    <h3>Building Excellence Since 2020</h3>
                    <p>PK Computer Spare Parts was founded with a simple mission: to provide high-quality computer components at competitive prices with exceptional customer service. What began as a small operation has now grown into a trusted name in the computer hardware industry.</p>
                    <p>We take pride in our extensive inventory of computer parts, from processors and graphics cards to motherboards and storage solutions. Our team of experts is dedicated to helping you find the right components for your specific needs.</p>
                    <p>At PK Computer, we believe in building lasting relationships with our customers through honesty, reliability, and technical expertise. Whether you're a gaming enthusiast, IT professional, or business owner, we're here to support your computing needs.</p>
                </div>
                <div class="about-image">
                    <img src="images/pk.jpg" alt="PK Computer Store">
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <div class="container">
            <div class="section-title">
                <h2>Meet Our Team</h2>
            </div>
            <div class="team-cards">
                <div class="team-card">
                    <img src="images/me.jpg" alt="Guwan">
                    <div class="card-content">
                        <h3>Guwan</h3>
                        <p>Co-Founder & CEO</p>
                        <div class="social-icons">
                            <a href="#"><i class="fab fa-linkedin">in</i></a>
                            <a href="#"><i class="fab fa-twitter">tw</i></a>
                            <a href="#"><i class="fab fa-envelope">@</i></a>
                        </div>
                    </div>
                </div>
                
                <div class="team-card">
                    <img src="images/imalka.jpg"" alt="Imalka">
                    <div class="card-content">
                        <h3>Imalka</h3>
                        <p>Co-Founder & CTO</p>
                        <div class="social-icons">
                            <a href="#"><i class="fab fa-linkedin">in</i></a>
                            <a href="#"><i class="fab fa-twitter">tw</i></a>
                            <a href="#"><i class="fab fa-envelope">@</i></a>
                        </div>
                    </div>
                </div>
                
                <div class="team-card">
                    <img src="images/kawinda.jpg" alt="Kawinda">
                    <div class="card-content">
                        <h3>Kawinda</h3>
                        <p>Operations Manager</p>
                        <div class="social-icons">
                            <a href="#"><i class="fab fa-linkedin">in</i></a>
                            <a href="#"><i class="fab fa-twitter">tw</i></a>
                            <a href="#"><i class="fab fa-envelope">@</i></a>
                        </div>
                    </div>
                </div>
                
                <div class="team-card">
                    <img src="images/viraj.jpg" alt="Viraj">
                    <div class="card-content">
                        <h3>Viraj</h3>
                        <p>Customer Relations</p>
                        <div class="social-icons">
                            <a href="#"><i class="fab fa-linkedin">in</i></a>
                            <a href="#"><i class="fab fa-twitter">tw</i></a>
                            <a href="#"><i class="fab fa-envelope">@</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services-section">
        <div class="container">
            <div class="section-title">
                <h2>Our Services</h2>
            </div>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">🛒</div>
                    <h3>Retail Sales</h3>
                    <p>Browse our wide selection of computer components, peripherals, and accessories for all your computing needs.</p>
                </div>
                
                <div class="service-card">
                    <div class="service-icon">🔧</div>
                    <h3>Custom PC Builds</h3>
                    <p>Let our experts build a custom computer system tailored to your specific requirements and budget.</p>
                </div>
                
                <div class="service-card">
                    <div class="service-icon">🚚</div>
                    <h3>Wholesale Supply</h3>
                    <p>We offer competitive pricing and reliable delivery for businesses and bulk orders.</p>
                </div>
                
                <div class="service-card">
                    <div class="service-icon">💻</div>
                    <h3>Technical Support</h3>
                    <p>Our knowledgeable team provides technical assistance and advice for all your computer-related questions.</p>
                </div>
            </div>
        </div>
    </section>


    <%@ include file="nav.jspf" %>


</body>
</html>