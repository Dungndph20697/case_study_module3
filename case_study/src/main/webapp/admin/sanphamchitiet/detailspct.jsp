<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard - Hệ Thống Quản Lý</title>
    <%@include file="/layout/header.jsp" %>
    <link rel="stylesheet" href="/css/detailcss.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 sidebar p-0">
            <div class="p-4">
                <h4 class="text-white mb-4">
                    <i class="fas fa-cogs me-2"></i>
                    Admin Panel
                </h4>
                <nav class="nav flex-column">
                    <%@include file="/layout/nav.jsp" %>
                </nav>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 main-content p-0">
            <!-- Top Navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                <div class="container-fluid">
              <span class="navbar-brand mb-0 h1">
                <i class="fas fa-store me-2"></i>
                Hệ Thống Quản Lý
              </span>
                    <div class="d-flex align-items-center">
                        <div class="dropdown">
                            <button
                                    class="btn btn-outline-primary dropdown-toggle btn-custom"
                                    type="button"
                                    data-bs-toggle="dropdown"
                            >
                                <i class="fas fa-user-circle me-2"></i>
                                Administrator
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="#"
                                    ><i class="fas fa-user-cog me-2"></i>Hồ Sơ</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#"
                                    ><i class="fas fa-cog me-2"></i>Cài Đặt</a
                                    >
                                </li>
                                <li>
                                    <hr class="dropdown-divider"/>
                                </li>
                                <li>
                                    <a class="dropdown-item text-danger" href="#"
                                    ><i class="fas fa-sign-out-alt me-2"></i>Đăng Xuất</a
                                    >
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="p-4">
                <!-- Product Details Section -->
                <div class="mb-5 section-divider">

                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="product-card">
                                <!-- Header -->
                                <div class="header-section">
                                    <h1 class="mb-3">
                                        <i class="fas fa-mobile-alt me-3"></i>
                                        Chi Tiết Sản Phẩm
                                    </h1>
                                    <p class="mb-0 fs-5">Thông tin đầy đủ về sản phẩm</p>
                                </div>

                                <div class="row g-0">
                                    <!-- Product Image -->
                                    <div class="col-md-5 d-flex align-items-center justify-content-center">
                                        <div class="bg-light rounded-4 shadow-sm d-flex align-items-center justify-content-center"
                                             style="width:100%; min-height:220px;">
                                            <img src="/images/${spct.anh}" alt="Product Image"
                                                 class="img-fluid rounded-4"
                                                 style="max-height: 220px; object-fit: cover;">
                                            <!-- If no image, show icon -->
                                            <!-- <i class="fas fa-mobile-alt fs-1 text-secondary"></i> -->
                                        </div>
                                    </div>

                                    <!-- Product Info -->
                                    <div class="col-md-7">
                                        <div class="info-section">
                                            <!-- Product Name & Status -->
                                            <div class="d-flex justify-content-between align-items-start mb-4">
                                                <h2 class="text-primary fw-bold">${spct.sanPham.tenSanPham}</h2>
                                                <span class="status-badge status-active">
                                        <i class="fas fa-check-circle me-1"></i>
                                        ${spct.trangThai==0?'CÒN HÀNG':'HẾT HÀNG'}
                                    </span>
                                            </div>

                                            <!-- Price -->
                                            <div class="price-tag">
                                                <i class="fas fa-tag me-2"></i>
                                                <fmt:formatNumber value="${spct.gia}" type="number" groupingUsed="true"
                                                                  maxFractionDigits="0"/> ₫
                                            </div>

                                            <!-- Product Details -->
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="info-item">
                                                        <div class="info-label">
                                                            <i class="fas fa-info-circle"></i>
                                                            Mô tả sản phẩm
                                                        </div>
                                                        <div class="info-value">
                                                            ${spct.moTa}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="info-item">
                                                        <div class="info-label">
                                                            <i class="fas fa-building"></i>
                                                            Thương hiệu
                                                        </div>
                                                        <div class="info-value">${spct.hang.tenHang}</div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="info-item">
                                                        <div class="info-label">
                                                            <i class="fas fa-hdd"></i>
                                                            Dung lượng
                                                        </div>
                                                        <div class="info-value">${spct.dungLuong.tenDungLuong}</div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="info-item">
                                                        <div class="info-label">
                                                            <i class="fas fa-palette"></i>
                                                            Màu sắc
                                                        </div>
                                                        <div class="info-value d-flex align-items-center">
                                                            ${spct.mauSac.mauSac}

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="quantity-display">
                                                        <i class="fas fa-boxes me-2"></i>
                                                        Số lượng: ${spct.soLuong}
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Action Buttons -->
                                            <div class="mt-4 text-center">
                                                <a class="btn btn-custom me-3" href="/admin/chi-tiet-san-pham?action=edit&id=${spct.id}">
                                                    <i class="fas fa-edit me-2"></i>
                                                    Chỉnh sửa
                                                </a>
                                                <a class="btn btn-outline-secondary" href="/admin/chi-tiet-san-pham">
                                                    <i class="fas fa-arrow-left me-2"></i>
                                                    Quay lại
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (function () {
        function c() {
            var b = a.contentDocument || a.contentWindow.document;
            if (b) {
                var d = b.createElement("script");
                d.innerHTML =
                    "window.__CF$cv$params={r:'979a9e4aa2611fbc',t:'MTc1Njk1ODgyOS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";
                b.getElementsByTagName("head")[0].appendChild(d);
            }
        }

        if (document.body) {
            var a = document.createElement("iframe");
            a.height = 1;
            a.width = 1;
            a.style.position = "absolute";
            a.style.top = 0;
            a.style.left = 0;
            a.style.border = "none";
            a.style.visibility = "hidden";
            document.body.appendChild(a);
            if ("loading" !== document.readyState) c();
            else if (window.addEventListener)
                document.addEventListener("DOMContentLoaded", c);
            else {
                var e = document.onreadystatechange || function () {
                };
                document.onreadystatechange = function (b) {
                    e(b);
                    "loading" !== document.readyState &&
                    ((document.onreadystatechange = e), c());
                };
            }
        }
    })();
</script>
</body>
</html>
