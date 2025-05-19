<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Computer Spare Parts</title>
    <style>
    body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background-color: #f4f4f8;
    color: #333;
}

a {
    text-decoration: none;
    color: inherit;
}

.hero {
    position: relative;
    padding: 100px 20px;
    text-align: center;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    color: white;
}

.hero h1 {
    font-size: 3rem;
    margin-bottom: 20px;
    font-weight: 600;
}

.hero p {
    font-size: 1.2rem;
    max-width: 700px;
    margin: 0 auto 30px;
}

.btn {
    display: inline-block;
    background: #ffffff;
    color: #6a11cb;
    padding: 12px 25px;
    border-radius: 25px;
    font-weight: 600;
    transition: background 0.3s, color 0.3s;
}

.btn:hover {
    background: #2575fc;
    color: #fff;
}

.features {
    background: #fff;
    padding: 60px 20px;
    display: flex;
    justify-content: center;
}

.feature-container {
    display: flex;
    gap: 30px;
    flex-wrap: wrap;
    max-width: 1200px;
}

.feature {
    flex: 1 1 300px;
    background: #f8f9ff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    text-align: center;
    transition: transform 0.3s;
}

 .feature:hover {
    transform: translateY(-5px);
}

.feature i {
    font-size: 2rem;
    color: #6a11cb;
    margin-bottom: 15px;
}

.feature h3 {
    margin: 10px 0;
    color: #333;
}

.categories {
    padding: 60px 20px;
    background: #eef1fb;
    text-align: center;
}

.section-title {
    font-size: 2rem;
    margin-bottom: 40px;
    color: #2c2c54;
}

.category-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 30px;
    max-width: 1200px;
    margin: auto;
}

.category {
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.05);
    overflow: hidden;
    transition: transform 0.3s ease;
}

.category:hover {
    transform: scale(1.05);
}

.category-img-container img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    display: block;
}

.category-info {
    padding: 15px;
    font-weight: 500;
    color: #6a11cb;
}

.testimonials {
    padding: 60px 20px;
    background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);
    color: #fff;
    text-align: center;
}

.testimonial-container {
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
    max-width: 1000px;
    margin: auto;
}

.testimonial {
    background: rgba(255, 255, 255, 0.1);
    padding: 30px;
    border-radius: 15px;
    max-width: 450px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.testimonial-content p {
    font-style: italic;
}

.testimonial-author {
    display: flex;
    align-items: center;
    margin-top: 20px;
}

.testimonial-author img {
    border-radius: 50%;
    margin-right: 15px;
    width: 50px;
    height: 50px;
    object-fit: cover;
    border: 2px solid white;
}

.author-info h4 {
    margin: 0;
    font-size: 1rem;
    font-weight: 600;
}

.author-info span {
    font-size: 0.85rem;
    opacity: 0.8;
}
    
    </style>
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jspf" %>

    <section class="hero">
        <div class="glow-accent glow-1"></div>
        <div class="glow-accent glow-2"></div>
        <div class="hero-content">
            <h1>Premium Computer Parts & Components</h1>
            <p>Build, upgrade, or repair your system with high-quality computer hardware at competitive prices. Free shipping on orders over $75.</p>
            <a href="SearchProductS" class="btn">Shop Now <i class="fas fa-arrow-right"></i></a>
        </div>
    </section>

    <section class="features">
        <div class="feature-container">
            <div class="feature">
                <i class="fas fa-shipping-fast"></i>
                <h3>Fast Delivery</h3>
                <p>Get your orders within 2-3 business days with our express shipping options. We partner with trusted delivery services to ensure your parts arrive safely and on time.</p>
            </div>
            <div class="feature">
                <i class="fas fa-shield-alt"></i>
                <h3>2-Year Warranty</h3>
                <p>All our products come with a minimum 2-year warranty for your peace of mind. We stand behind the quality and durability of everything we sell.</p>
            </div>
            <div class="feature">
                <i class="fas fa-headset"></i>
                <h3>Expert Support</h3>
                <p>Our technical team is available 7 days a week to answer your questions and help you select the right components for your specific needs.</p>
            </div>
        </div>
    </section>

    <section class="categories">
        <h2 class="section-title">Shop By Category</h2>
        <div class="category-container">
            <div class="category">
                <a href="SearchProductS?category=Processor">
                    <div class="category-img-container">
                        <img src="images/Processors.webp" >
                    </div>
                    <div class="category-info">
                        <p>Processors</p>
                    </div>
                </a>
            </div>

            <div class="category">
                <a href="SearchProductS?category=Motherboard">
                    <div class="category-img-container">
                        <img src="images/Motherboards.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Motherboards</p>
                    </div>
                </a>
            </div>

            <div class="category">
                <a href="SearchProductS?category=RAM">
                    <div class="category-img-container">
                        <img src="images/RAM.jpg" >
                    </div>
                    <div class="category-info">
                        <p>RAM</p>
                    </div>
                </a>
            </div>

            <div class="category">
                <a href="SearchProductS?category=HDD">
                    <div class="category-img-container">
                        <img src="images/Hard Drives.webp" >
                    </div>
                    <div class="category-info">
                        <p>Hard Drives</p>
                    </div>
                </a>
            </div>

            <div class="category">
                <a href="SearchProductS?category=SSD">
                    <div class="category-img-container">
                        <img src="images/Solid State Drives.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Solid State Drives</p>
                    </div>
                </a>
            </div>

            <div class="category">
                <a href="SearchProductS?category=Graphics Card">
                    <div class="category-img-container">
                        <img src="images/Graphics Cards.jpeg" >
                    </div>
                    <div class="category-info">
                        <p>Graphics Cards</p>
                    </div>
                </a>
            </div>

            <div class="category">
                <a href="SearchProductS?category=Power Supply">
                    <div class="category-img-container">
                        <img src="images/Power Supplies.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Power Supplies</p>
                    </div>
                </a>
            </div>
           
            <div class="category">
                <a href="SearchProductS?category=Mouse">
                    <div class="category-img-container">
                        <img src="images/Mouse.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Mouse</p>
                    </div>
                </a>
            </div>
            <div class="category">
                <a href="SearchProductS?category=Case">
                    <div class="category-img-container">
                        <img src="images/Case.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Case</p>
                    </div>
                </a>
            </div>
            <div class="category">
                <a href="SearchProductS?category=Speakers">
                    <div class="category-img-container">
                        <img src="images/Speakers.webp">
                    </div>
                    <div class="category-info">
                        <p>Speakers</p>
                    </div>
                </a>
            </div>
            <div class="category">
                <a href="SearchProductS?category=coolsystem">
                    <div class="category-img-container">
                        <img src="images/coolsystem.webp" >
                    </div>
                    <div class="category-info">
                        <p>coolsystem</p>
                    </div>
                </a>
            </div>
            <div class="category">
                <a href="SearchProductS?category=Monitor">
                    <div class="category-img-container">
                        <img src="images/Moniter.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Monitor</p>
                    </div>
                </a>
            </div>
            
            <div class="category">
                <a href="SearchProductS?category=Keyboard">
                    <div class="category-img-container">
                        <img src="images/Keyboard.jpg" >
                    </div>
                    <div class="category-info">
                        <p>Keyboard</p>
                    </div>
                </a>
            </div>
            
            
            
            
        </div>
    </section>

    <section class="testimonials">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="testimonial-container">
            <div class="testimonial">
                <div class="testimonial-content">
                    <p>"I've been building PCs for years, and I can confidently say the quality of components from this store is top-notch. Fast shipping and excellent customer service too!"</p>
                    <div class="testimonial-author">
                        <img src="images/v.jpg" alt="Customer">
                        <div class="author-info">
                            <h4>Michael S.</h4>
                            <span>PC Builder</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="testimonial">
                <div class="testimonial-content">
                    <p>"As a game developer, I need reliable hardware that can handle intensive workloads. The components I purchased have exceeded my expectations in both performance and durability."</p>
                    <div class="testimonial-author">
                        <img src="images/k.jpg" alt="Customer">
                        <div class="author-info">
                            <h4>Sarah T.</h4>
                            <span>Game Developer</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <%@ include file="nav.jspf" %>
    
</body>
</html>
   
