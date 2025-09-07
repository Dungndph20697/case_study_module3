<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ Hàng - MobileStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <%@ include file="css/style.jspf" %>
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
                    <div class="cart-item p-4 border-bottom">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <div class="bg-primary rounded d-flex align-items-center justify-content-center product-image">
                                    <i class="bi bi-phone text-white" style="font-size: 2rem;"></i>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h5 class="mb-1">iPhone 15 Pro Max</h5>
                                <p class="text-muted mb-1">256GB - Titan Tự Nhiên</p>
                                <small class="text-success">
                                    <i class="bi bi-check-circle me-1"></i>Còn hàng
                                </small>
                            </div>
                            <div class="col-md-2">
                                <div class="quantity-controls">
                                    <button class="quantity-btn">
                                        <i class="bi bi-dash"></i>
                                    </button>
                                    <input type="number" class="quantity-input" value="1" min="1">
                                    <button class="quantity-btn">
                                        <i class="bi bi-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-3 text-end">
                                <div class="price-text">29.990.000₫</div>
                                <div class="original-price">32.990.000₫</div>
                            </div>
                            <div class="col-md-1 text-end">
                                <button class="btn btn-outline-danger btn-sm">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Cart Item 2 -->
                    <div class="cart-item p-4 border-bottom">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <div class="bg-success rounded d-flex align-items-center justify-content-center product-image">
                                    <i class="bi bi-phone text-white" style="font-size: 2rem;"></i>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h5 class="mb-1">Samsung Galaxy S24 Ultra</h5>
                                <p class="text-muted mb-1">512GB - Titan Đen</p>
                                <small class="text-success">
                                    <i class="bi bi-check-circle me-1"></i>Còn hàng
                                </small>
                            </div>
                            <div class="col-md-2">
                                <div class="quantity-controls">
                                    <button class="quantity-btn">
                                        <i class="bi bi-dash"></i>
                                    </button>
                                    <input type="number" class="quantity-input" value="1" min="1">
                                    <button class="quantity-btn">
                                        <i class="bi bi-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-3 text-end">
                                <div class="price-text">33.990.000₫</div>
                                <div class="original-price">36.990.000₫</div>
                            </div>
                            <div class="col-md-1 text-end">
                                <button class="btn btn-outline-danger btn-sm">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Cart Item 3 -->
                    <div class="cart-item p-4">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <div class="bg-warning rounded d-flex align-items-center justify-content-center product-image">
                                    <i class="bi bi-headphones text-white" style="font-size: 2rem;"></i>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h5 class="mb-1">AirPods Pro 2</h5>
                                <p class="text-muted mb-1">USB-C - Trắng</p>
                                <small class="text-success">
                                    <i class="bi bi-check-circle me-1"></i>Còn hàng
                                </small>
                            </div>
                            <div class="col-md-2">
                                <div class="quantity-controls">
                                    <button class="quantity-btn">
                                        <i class="bi bi-dash"></i>
                                    </button>
                                    <input type="number" class="quantity-input" value="2" min="1">
                                    <button class="quantity-btn">
                                        <i class="bi bi-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-3 text-end">
                                <div class="price-text">5.990.000₫</div>
                                <div class="original-price">6.490.000₫</div>
                            </div>
                            <div class="col-md-1 text-end">
                                <button class="btn btn-outline-danger btn-sm">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>

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

                <!-- Product List -->
                <div class="mb-4">
                    <h6 class="text-muted mb-3">Sản phẩm đã chọn:</h6>

                    <div class="d-flex justify-content-between align-items-center mb-3 p-2 bg-light rounded">
                        <div class="d-flex align-items-center">
                            <div class="bg-primary rounded me-2" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-phone text-white"></i>
                            </div>
                            <div>
                                <small class="fw-bold">iPhone 15 Pro Max</small>
                                <div class="text-muted" style="font-size: 0.75rem;">256GB - Titan Tự Nhiên</div>
                                <div class="text-muted" style="font-size: 0.75rem;">Số lượng: x1</div>
                            </div>
                        </div>
                        <small class="fw-bold text-danger">29.990.000₫</small>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-3 p-2 bg-light rounded">
                        <div class="d-flex align-items-center">
                            <div class="bg-success rounded me-2" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-phone text-white"></i>
                            </div>
                            <div>
                                <small class="fw-bold">Samsung Galaxy S24 Ultra</small>
                                <div class="text-muted" style="font-size: 0.75rem;">512GB - Titan Đen</div>
                                <div class="text-muted" style="font-size: 0.75rem;">Số lượng: x1</div>
                            </div>
                        </div>
                        <small class="fw-bold text-danger">33.990.000₫</small>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-3 p-2 bg-light rounded">
                        <div class="d-flex align-items-center">
                            <div class="bg-warning rounded me-2" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-headphones text-white"></i>
                            </div>
                            <div>
                                <small class="fw-bold">AirPods Pro 2</small>
                                <div class="text-muted" style="font-size: 0.75rem;">USB-C - Trắng</div>
                                <div class="text-muted" style="font-size: 0.75rem;">Số lượng: x2</div>
                            </div>
                        </div>
                        <small class="fw-bold text-danger">11.980.000₫</small>
                    </div>
                </div>

                <hr>

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


<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'97aca6dad240045d',t:'MTc1NzE0NzkyMy4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>

