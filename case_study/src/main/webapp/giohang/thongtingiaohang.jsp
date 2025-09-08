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

        <!-- Shipping Information -->
        <div class="section-card">
            <div class="section-header bg-info text-white">
                <h5 class="mb-0">
                    <i class="bi bi-truck me-2"></i>Thông Tin Giao Hàng
                </h5>
            </div>
            <div class="section-content">
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Họ và tên *</label>
                            <input type="text" class="form-control" placeholder="Nguyễn Văn A" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Số điện thoại *</label>
                            <input type="tel" class="form-control" placeholder="0123456789" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="example@email.com">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Địa chỉ *</label>
                        <input type="text" class="form-control" placeholder="Số nhà, tên đường" required>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Tỉnh/Thành phố *</label>
                            <select class="form-select" required>
                                <option value="">Chọn tỉnh/thành</option>
                                <option value="hanoi">Hà Nội</option>
                                <option value="hcm">TP. Hồ Chí Minh</option>
                                <option value="danang">Đà Nẵng</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Quận/Huyện *</label>
                            <select class="form-select" required>
                                <option value="">Chọn quận/huyện</option>
                                <option value="district1">Quận 1</option>
                                <option value="district2">Quận 2</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Phường/Xã *</label>
                            <select class="form-select" required>
                                <option value="">Chọn phường/xã</option>
                                <option value="ward1">Phường 1</option>
                                <option value="ward2">Phường 2</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Ghi chú đơn hàng</label>
                        <textarea class="form-control" rows="3"
                                  placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn."></textarea>
                    </div>

                    <!-- Navigation Buttons -->
                    <div class="nav-buttons d-flex justify-content-between">
                        <button type="button" class="btn btn-outline-secondary nav-btn">
                            <i class="bi bi-arrow-left me-2"></i>Quay Lại Giỏ Hàng
                        </button>
                        <button type="button" class="btn btn-primary nav-btn">
                            <i class="bi bi-check-circle me-2"></i>Xác Nhận Thông Tin
                        </button>
                    </div>
                </form>
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

