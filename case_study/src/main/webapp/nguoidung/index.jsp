<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MobileStore - Điện Thoại Chính Hãng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

    <%--CSS--%>
    <%@ include file="css/style.jspf" %>
</head>
<body>
<!-- Header -->
<%@ include file="header.jsp" %>

<!-- Hero Section -->
<%@ include file="HeroSection.jsp" %>


<!-- Products Section -->
<section class="products" id="products">
    <div class="container">
        <div class="section-title">
            <h2>Sản Phẩm Nổi Bật</h2>
            <p>Những chiếc điện thoại được yêu thích nhất</p>
        </div>

        <div class="product-grid">
            <!-- iPhone 15 Pro -->
            <c:forEach var="spct" items="${sanPhamChiTiets}" varStatus="status">

                <div class="product-card">
                    <div class="product-image">
                        <img src="${spct.anh}"
                             alt="iPhone 15 Pro" onerror="this.src=''; this.style.display='none';">
                        <span class="badge">Hot</span>
                    </div>
                    <div class="product-info">
                        <h3 class="product-name">iPhone 15 Pro</h3>
                        <p class="product-specs">128GB - Titan Tự Nhiên</p>
                        <div class="rating">
                            <div class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <span class="rating-text">(4.9) 128 đánh giá</span>
                        </div>
                        <div class="price">
                            <span class="current-price">${spct.gia}₫</span>
                                <%--                            <span class="old-price">32.990.000₫</span>--%>
                        </div>
                        <div class="product-actions">
                            <button class="btn btn-primary">
                                <i class="bi bi-cart-plus"></i> Thêm Giỏ
                            </button>
                            <button class="btn btn-outline">
                                <i class="bi bi-eye"></i> Xem
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- Features Section -->
<%@ include file="FeaturesSection.jsp" %>

<!-- Footer -->
<%@ include file="footer.jsp" %>


<script>(function () {
    function c() {
        var b = a.contentDocument || a.contentWindow.document;
        if (b) {
            var d = b.createElement('script');
            d.innerHTML = "window.__CF$cv$params={r:'979adbb2750be2fe',t:'MTc1Njk2MTM0NS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";
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
