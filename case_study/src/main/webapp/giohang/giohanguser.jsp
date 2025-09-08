<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng - MobileStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <%@ include file="css/style.jspf" %>
    <style>
        .product-image {
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f9fa;
            border-radius: 0.5rem;
            overflow: hidden;
        }

        .product-image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain;
        }
    </style>
</head>
<body>
<%--header--%>
<%@ include file="/nguoidung/header.jsp" %>
<!-- Main Content -->
<div class="container">
    <div class="row">
        <!-- Left Column -->
        <div class="col-lg-8">
            <!-- Cart Items Section -->
            <div class="section-card">
                <div class="section-header bg-primary text-white">
                    <h5 class="mb-0">
                        <i class="bi bi-cart3 me-2"></i>Sản Phẩm Trong Giỏ Hàng
                    </h5>
                </div>
                <div class="section-content p-0">
                    <!-- Cart Item 1 -->
                    <c:forEach var="hdct" items="${hoaDonChiTietList}" varStatus="status">
                        <div class="cart-item p-4 border-bottom">
                            <div class="row align-items-center">
                                <div class="col-md-2">
                                    <div class="bg-primary rounded d-flex align-items-center justify-content-center product-image">
                                        <img src="/images/${hdct.spct.anh}" alt="${hdct.spct.sanPham.tenSanPham}" class="img-fluid">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <h5 class="mb-1">${hdct.spct.sanPham.tenSanPham}</h5>
                                    <p class="text-muted mb-1">${hdct.spct.dungLuong.tenDungLuong} - ${hdct.spct.mauSac.mauSac}</p>

                                </div>
                                <div class="col-md-2">
                                    <div class="quantity-controls">
                                        <button class="quantity-btn">
                                            <i class="bi bi-dash"></i>
                                        </button>
                                        <input type="number" class="quantity-input" value="${hdct.soLuong}" min="1">
                                        <button class="quantity-btn">
                                            <i class="bi bi-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-md-3 text-end">
<%--                                    <div class="price-text">${hdct.donGia*hdct.soLuong}₫</div>--%>
                                    <fmt:formatNumber value="${hdct.donGia*hdct.soLuong}" type="number" groupingUsed="true" maxFractionDigits="0"/> ₫
                                </div>
                                <div class="col-md-1 text-end">
                                    <button class="btn btn-outline-danger btn-sm">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>



                    <!-- Navigation Buttons -->
                    <div class="nav-buttons d-flex justify-content-between">
                        <button type="button" class="btn btn-outline-secondary nav-btn">
                            <i class="bi bi-arrow-left me-2"></i>Quay Lại Thông Tin
                        </button>
                        <button type="button" class="btn btn-success nav-btn">
                            <i class="bi bi-credit-card me-2"></i>Xác Nhận Thanh Toán
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column - Order Summary -->
        <div class="col-lg-4">
            <div class="summary-card p-4">
                <h4 class="mb-4">
                    <i class="bi bi-receipt me-2"></i>Tóm Tắt Đơn Hàng
                </h4>



                <div class="d-flex justify-content-between mb-3">
                    <span>Tạm tính (4 sản phẩm):</span>
                    <span>75.960.000₫</span>
                </div>

                <div class="d-flex justify-content-between mb-3">
                    <span>Giảm giá:</span>
                    <span class="text-success">-6.000.000₫</span>
                </div>

                <div class="d-flex justify-content-between mb-3">
                    <span>Phí vận chuyển:</span>
                    <span class="text-success">Miễn phí</span>
                </div>

                <hr>

                <div class="d-flex justify-content-between mb-4">
                    <strong>Tổng cộng:</strong>
                    <strong class="text-danger fs-5">69.960.000₫</strong>
                </div>

                <button class="btn btn-success checkout-btn w-100 mb-3">
                    <i class="bi bi-check-circle me-2"></i>Hoàn Tất Đặt Hàng
                </button>

                <div class="text-center">
                    <small class="text-muted">
                        <i class="bi bi-shield-check me-1"></i>
                        Thanh toán an toàn & bảo mật
                    </small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>


<script>(function () {
    function c() {
        var b = a.contentDocument || a.contentWindow.document;
        if (b) {
            var d = b.createElement('script');
            d.innerHTML = "window.__CF$cv$params={r:'97aca6dad240045d',t:'MTc1NzE0NzkyMy4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";
            b.getElementsByTagName('head')[0].appendChild(d)
        }
    }

    if (document.body) {
        var a = document.createElement('iframe');
        a.height = 1;
        a.width = 1;
        a.style.position = 'absolute';
        a.style.top = 0;
        a.style.left = 0;
        a.style.border = 'none';
        a.style.visibility = 'hidden';
        document.body.appendChild(a);
        if ('loading' !== document.readyState) c(); else if (window.addEventListener) document.addEventListener('DOMContentLoaded', c); else {
            var e = document.onreadystatechange || function () {
            };
            document.onreadystatechange = function (b) {
                e(b);
                'loading' !== document.readyState && (document.onreadystatechange = e, c())
            }
        }
    }
})();</script>
</body>
</html>

