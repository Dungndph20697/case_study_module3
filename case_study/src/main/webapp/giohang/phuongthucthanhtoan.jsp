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
</head>
<body>
<%--header--%>
<%@ include file="header.jsp" %>
<!-- Main Content -->
<div class="container">
    <div class="row">

        <!-- Payment Method Selection -->
        <div class="section-card">
            <div class="section-header bg-success text-white">
                <h5 class="mb-0">
                    <i class="bi bi-credit-card me-2"></i>Phương Thức Thanh Toán
                </h5>
            </div>
            <div class="section-content">
                <div class="payment-method selected">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment" id="cod" checked>
                        <label class="form-check-label" for="cod">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-cash-coin me-3 fs-4 text-success"></i>
                                <div>
                                    <strong>Thanh toán khi nhận hàng (COD)</strong>
                                    <div class="text-muted small">Thanh toán bằng tiền mặt khi nhận hàng</div>
                                    <div class="text-success small mt-1">
                                        <i class="bi bi-check-circle me-1"></i>Phí COD: Miễn phí
                                    </div>
                                </div>
                            </div>
                        </label>
                    </div>
                </div>

                <div class="payment-method">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment" id="bank">
                        <label class="form-check-label" for="bank">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-bank me-3 fs-4 text-primary"></i>
                                <div>
                                    <strong>Chuyển khoản ngân hàng</strong>
                                    <div class="text-muted small">Chuyển khoản qua ATM, Internet Banking</div>
                                    <div class="text-primary small mt-1">
                                        <i class="bi bi-info-circle me-1"></i>Chuyển khoản nhanh chóng
                                    </div>
                                </div>
                            </div>
                        </label>
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

