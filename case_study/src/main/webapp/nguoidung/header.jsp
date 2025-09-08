<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>MobileStore</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<header class="shadow-sm mb-3">

    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <a class="navbar-brand fw-bold" href="/trang-chu">
                <i class="bi bi-phone"></i> MobileStore
            </a>


            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">

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
                <a href="/giohang" class="cart-btn" title="Giỏ hàng">
                    <i class="bi bi-cart3"></i>
                </a>
                <button class="login-btn" title="Đăng nhập">
                    <i class="bi bi-person"></i>
                </button>
            </div>
            <button class="mobile-menu">

                <i class="bi bi-list"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- Menu links -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/trang-chu"><i class="bi bi-house"></i> Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="/san-pham"><i class="bi bi-grid"></i> Sản phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="/gioi-thieu"><i class="bi bi-info-circle"></i> Giới thiệu</a></li>
                    <li class="nav-item"><a class="nav-link" href="/lien-he"><i class="bi bi-telephone"></i> Liên hệ</a></li>
                </ul>

                <!-- Search box -->
                <form class="d-flex me-3">
                    <input class="form-control form-control-sm me-2" type="search" placeholder="Tìm kiếm...">
                    <button class="btn btn-outline-primary btn-sm" type="submit"><i class="bi bi-search"></i></button>
                </form>

                <!-- Cart -->
                <a href="/gio-hang" class="btn btn-outline-secondary btn-sm me-3">
                    <i class="bi bi-cart3"></i>
                </a>

                <!-- User dropdown -->
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <div class="dropdown">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button"
                                    id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-person-circle me-1"></i> ${sessionScope.currentUser.fullName}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenu">
                                <li><a class="dropdown-item" href="#"><i class="bi bi-person-gear me-2"></i> Hồ sơ</a></li>
                                <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i> Cài đặt</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
                                    <i class="bi bi-box-arrow-right me-2"></i> Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-person"></i> Đăng nhập
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </div>
</header>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
