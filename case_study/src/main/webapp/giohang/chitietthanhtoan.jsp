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
        <!-- Payment Details Section -->
        <div class="section-card" id="payment-info">
            <div class="section-header bg-warning text-dark">
                <h5 class="mb-0">
                    <i class="bi bi-credit-card me-2"></i>Chi Tiết Thanh Toán
                </h5>
            </div>
            <div class="section-content">
                <!-- Bank Transfer Details -->
                <div class="row mb-5">
                    <div class="col-12">
                        <div class="d-flex align-items-center mb-3">
                            <i class="bi bi-bank me-2 fs-4 text-primary"></i>
                            <h6 class="mb-0 text-primary">Chuyển Khoản Ngân Hàng</h6>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="alert alert-info">
                            <h6><i class="bi bi-info-circle me-2"></i>Thông tin tài khoản nhận:</h6>
                            <div class="bank-info">
                                <div class="d-flex justify-content-between mb-2">
                                    <strong>Ngân hàng:</strong>
                                    <span>MBbank</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <strong>Chi nhánh:</strong>
                                    <span>Hà Nội</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <strong>Số tài khoản:</strong>
                                    <span class="text-primary fw-bold">0362778105</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <strong>Chủ tài khoản:</strong>
                                    <span>BUI VAN TRUNG</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <strong>Số tiền:</strong>
                                    <span class="text-danger fw-bold">69.960.000₫</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <strong>Nội dung:</strong>
                                    <span class="text-success">DH240001 MobileStore</span>
                                </div>
                            </div>
                        </div>

                        <div class="alert alert-warning">
                            <h6><i class="bi bi-exclamation-triangle me-2"></i>Lưu ý quan trọng:</h6>
                            <ul class="mb-0 small">
                                <li>Chuyển khoản đúng số tiền</li>
                                <li>Ghi đúng nội dung: <strong>DH240001 MobileStore</strong></li>
                                <li>Đơn hàng sẽ được xử lý sau 5-10 phút khi nhận được tiền</li>
                                <li>Liên hệ hotline 0362778105 nếu chuyển khoản quá 30 phút chưa được xử lý</li>
                            </ul>
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

