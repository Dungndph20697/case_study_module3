<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hệ Thống Quản Lý</title>
    <%@include file="/layout/header.jsp" %>
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
                            <button class="btn btn-outline-primary dropdown-toggle btn-custom" type="button"
                                    data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle me-2"></i>
                                Administrator
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#"><i class="fas fa-user-cog me-2"></i>Hồ Sơ</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Cài Đặt</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item text-danger" href="#"><i
                                        class="fas fa-sign-out-alt me-2"></i>Đăng Xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="p-4">
                <!-- Storage Section -->
                <div class="mb-5 section-divider">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="fw-bold">
                            <i class="fas fa-hdd me-2 text-primary"></i>
                            Quản Lý Dung Lượng
                        </h2>

                    </div>
                    <div class="card">
                        <div class="card-body">
                            <form action="#" method="POST" enctype="multipart/form-data">
                                <!-- Thông tin cơ bản -->
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <label for="productName" class="form-label">Sản Phẩm <span
                                                class="required">*</span></label>
                                        <select class="form-select" id="productName" required>
                                            <option value="">Chọn sản phẩm</option>
                                            <option value="iphone-15-pro">iPhone 15 Pro</option>
                                            <option value="iphone-15">iPhone 15</option>
                                            <option value="samsung-s24-ultra">Samsung Galaxy S24 Ultra</option>
                                            <option value="samsung-s24">Samsung Galaxy S24</option>
                                            <option value="xiaomi-14-ultra">Xiaomi 14 Ultra</option>
                                            <option value="xiaomi-14">Xiaomi 14</option>
                                            <option value="oppo-find-x7">OPPO Find X7</option>
                                            <option value="vivo-x100-pro">Vivo X100 Pro</option>
                                            <option value="oneplus-12">OnePlus 12</option>
                                            <option value="huawei-p60-pro">Huawei P60 Pro</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="brand" class="form-label">Hãng <span
                                                class="required">*</span></label>
                                        <select class="form-select" id="brand" required>
                                            <option value="">Chọn hãng sản xuất</option>
                                            <option value="apple">Apple</option>
                                            <option value="samsung">Samsung</option>
                                            <option value="xiaomi">Xiaomi</option>
                                            <option value="oppo">OPPO</option>
                                            <option value="vivo">Vivo</option>
                                            <option value="huawei">Huawei</option>
                                            <option value="realme">Realme</option>
                                            <option value="oneplus">OnePlus</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Mô tả sản phẩm -->
                                <div class="mb-4">
                                    <label for="description" class="form-label">Mô Tả Sản Phẩm <span
                                            class="required">*</span></label>
                                    <textarea class="form-control" id="description" rows="4"
                                              placeholder="Nhập mô tả chi tiết về sản phẩm..." required></textarea>
                                </div>

                                <!-- Giá và số lượng -->
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <label for="price" class="form-label">Giá Bán (VNĐ) <span
                                                class="required">*</span></label>
                                        <div class="input-group">
                                            <input type="number" class="form-control" id="price" placeholder="0" min="0"
                                                   required>
                                            <span class="input-group-text">₫</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="quantity" class="form-label">Số Lượng <span
                                                class="required">*</span></label>
                                        <input type="number" class="form-control" id="quantity" placeholder="0" min="0"
                                               required>
                                    </div>
                                </div>

                                <!-- Trạng thái -->
                                <div class="mb-4">
                                    <label for="status" class="form-label">Trạng Thái
                                        <span
                                                class="required">*</span></label>
                                    <select class="form-select" id="status" required>
                                        <option value="0">Còn hàng</option>
                                        <option value="1">Hết hàng</option>
                                    </select>
                                </div>

                                <div class="section-divider"></div>

                                <!-- Thông số kỹ thuật -->
                                <h5 class="mb-3 text-primary"><i class="bi bi-gear"></i> Thông Số Kỹ Thuật</h5>

                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <label for="capacity" class="form-label">Dung Lượng</label>
                                        <select class="form-select" id="capacity">
                                            <c:forEach var="dungLuong" items="${dungLuongs}" varStatus="status">
                                                <option value="${dungLuong.id}">${dungLuong.tenDungLuong}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="color" class="form-label">Màu Sắc</label>
                                        <select class="form-select" id="color">
                                            <c:forEach var="ms" items="${mauSacs}" varStatus="status">
                                                <option value="${ms.id}">${ms.mauSac}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="section-divider"></div>

                                <!-- Upload ảnh -->
                                <h5 class="mb-3 text-primary"><i class="bi bi-image"></i> Hình Ảnh Sản Phẩm</h5>

                                <div class="mb-4">
                                    <div class="image-upload-area">
                                        <input type="file" class="form-control" id="productImage" accept="image/*"
                                               multiple>
                                    </div>
                                </div>

                                <!-- Nút hành động -->
                                <div class="d-flex justify-content-end gap-3 mt-4">
                                    <button type="button" class="btn btn-secondary">
                                        <i class="bi bi-x-circle"></i> Hủy
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-check-circle"></i> Thêm Sản Phẩm
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>(function () {
    function c() {
        var b = a.contentDocument || a.contentWindow.document;
        if (b) {
            var d = b.createElement('script');
            d.innerHTML = "window.__CF$cv$params={r:'979a9e4aa2611fbc',t:'MTc1Njk1ODgyOS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";
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
