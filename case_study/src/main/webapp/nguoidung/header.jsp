<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <li><a href="/trang-chu" title="Trang chủ"><i class="bi bi-house"></i></a></li>
                <li><a href="/trang-chu" title="Sản phẩm"><i class="bi bi-grid"></i></a></li>
                <li><a href="/trang-chu" title="Giới thiệu"><i class="bi bi-info-circle"></i></a></li>
                <li><a href="/trang-chu" title="Liên hệ"><i class="bi bi-telephone"></i></a></li>
            </ul>

            <div class="search-cart">
                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm...">
                    <button><i class="bi bi-search"></i></button>
                </div>
                <button class="cart-btn" title="Giỏ hàng">
                    <i class="bi bi-cart3"></i>
                </button>

<%--                kiem tra login logout--%>
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <div class="user-info">
                            Xin chào, ${sessionScope.currentUser.firstName} ${sessionScope.currentUser.lastName}
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-link">Đăng xuất</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="login-btn" title="Đăng nhập">
                            <i class="bi bi-person"></i>
                        </a>
                    </c:otherwise>
                </c:choose>


            </div>
            <button class="mobile-menu">
                <i class="bi bi-list"></i>
            </button>
        </nav>
    </div>
</header>
</body>
</html>
