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
                            <button class="btn btn-outline-primary dropdown-toggle btn-custom" type="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle me-2"></i>
                                Administrator
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#"><i class="fas fa-user-cog me-2"></i>Hồ Sơ</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Cài Đặt</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-sign-out-alt me-2"></i>Đăng Xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="p-4">
                

                <!-- Brands Section hãng -->
                <div class="mb-5 section-divider">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="fw-bold">
                            <i class="fas fa-tags me-2 text-primary"></i>
                            Quản Lý Hãng
                        </h2>
                        <button class="btn btn-primary btn-custom">
                            <i class="fas fa-plus me-2"></i>Thêm Hãng
                        </button>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <div class="search-box">
                                        <i class="fas fa-search"></i>
                                        <input type="text" class="form-control" placeholder="Tìm kiếm hãng...">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-select">
                                        <option>Tất cả quốc gia</option>
                                        <option>Mỹ</option>
                                        <option>Hàn Quốc</option>
                                        <option>Trung Quốc</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-select">
                                        <option>Tất cả trạng thái</option>
                                        <option>Hoạt động</option>
                                        <option>Ngừng hoạt động</option>
                                    </select>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Logo</th>
                                        <th>Tên Hãng</th>
                                        <th>Quốc Gia</th>
                                        <th>Website</th>
                                        <th>Trạng Thái</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><span class="badge bg-primary">#001</span></td>
                                        <td>
                                            <div class="d-flex align-items-center justify-content-center bg-light brand-logo">
                                                <i class="fab fa-apple fa-2x text-dark"></i>
                                            </div>
                                        </td>
                                        <td class="fw-bold">Apple</td>
                                        <td>🇺🇸 Mỹ</td>
                                        <td><a href="#" class="text-primary">apple.com</a></td>
                                        <td><span class="badge bg-success badge-custom">Hoạt động</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-outline-primary" title="Sửa">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" title="Xóa">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span class="badge bg-primary">#002</span></td>
                                        <td>
                                            <div class="d-flex align-items-center justify-content-center bg-light brand-logo">
                                                <i class="fab fa-android fa-2x text-success"></i>
                                            </div>
                                        </td>
                                        <td class="fw-bold">Samsung</td>
                                        <td>🇰🇷 Hàn Quốc</td>
                                        <td><a href="#" class="text-primary">samsung.com</a></td>
                                        <td><span class="badge bg-success badge-custom">Hoạt động</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-outline-primary" title="Sửa">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" title="Xóa">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span class="badge bg-primary">#003</span></td>
                                        <td>
                                            <div class="d-flex align-items-center justify-content-center bg-light brand-logo">
                                                <i class="fas fa-mobile-alt fa-2x text-warning"></i>
                                            </div>
                                        </td>
                                        <td class="fw-bold">Xiaomi</td>
                                        <td>🇨🇳 Trung Quốc</td>
                                        <td><a href="#" class="text-primary">mi.com</a></td>
                                        <td><span class="badge bg-success badge-custom">Hoạt động</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-outline-primary" title="Sửa">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" title="Xóa">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

    
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'979a9e4aa2611fbc',t:'MTc1Njk1ODgyOS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>
