<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>MobileStore</title>
    <!-- Gắn Bootstrap Icons nếu cần -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<header class="header">
    <div class="container">
        <nav class="nav">
            <div class="logo">
                <i class="bi bi-phone"></i> MobileStore
            </div>

            <ul class="nav-links">
                <li><a href="#home" title="Trang chủ"><i class="bi bi-house"></i></a></li>
                <li><a href="#products" title="Sản phẩm"><i class="bi bi-grid"></i></a></li>
                <li><a href="#about" title="Giới thiệu"><i class="bi bi-info-circle"></i></a></li>
                <li><a href="#contact" title="Liên hệ"><i class="bi bi-telephone"></i></a></li>
            </ul>

            <div class="search-cart">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm...">
                    <button><i class="bi bi-search"></i></button>
                </div>
                <button class="cart-btn" title="Giỏ hàng">
                    <i class="bi bi-cart3"></i>
                </button>
                <button class="login-btn" title="Đăng nhập">
                    <i class="bi bi-person"></i>
                </button>
            </div>
            <button class="mobile-menu">
                <i class="bi bi-list"></i>
            </button>
        </nav>
    </div>
</header>
</body>
</html>
