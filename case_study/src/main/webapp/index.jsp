<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - TechStore Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: #f8f9fa;
        }

        .sidebar {
            background: linear-gradient(180deg, #1E40AF 0%, #3730A3 100%);
            min-height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 280px;
            z-index: 1000;
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }

        .sidebar.show {
            transform: translateX(0);
        }

        @media (min-width: 992px) {
            .sidebar {
                position: relative;
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }
        }

        .sidebar-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }

        .sidebar-overlay.show {
            display: block;
        }

        .nav-item {
            transition: all 0.2s ease;
            border-radius: 0;
        }

        .nav-item:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(4px);
        }

        .nav-item.active {
            background: rgba(255, 255, 255, 0.15);
            border-right: 3px solid #FBBF24;
        }

        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
            animation: fadeIn 0.3s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            transition: all 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .stats-card-2 {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .stats-card-3 {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .stats-card-4 {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-active {
            background: #DCFCE7;
            color: #166534;
        }

        .status-inactive {
            background: #FEE2E2;
            color: #991B1B;
        }

        .status-pending {
            background: #FEF3C7;
            color: #92400E;
        }

        .btn-gradient {
            background: linear-gradient(135deg, #1E40AF, #3730A3);
            border: none;
            transition: all 0.2s ease;
        }

        .btn-gradient:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(30, 64, 175, 0.4);
        }

        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }

        .main-content {
            transition: margin-left 0.3s ease;
        }

        @media (max-width: 991px) {
            .main-content {
                margin-left: 0;
            }
        }

        .modal-content {
            animation: modalSlide 0.3s ease-out;
        }

        @keyframes modalSlide {
            from {
                opacity: 0;
                transform: scale(0.95) translateY(-20px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }
    </style>
</head>
<body>
<!-- Sidebar Overlay -->
<div class="sidebar-overlay" id="sidebarOverlay" onclick="toggleSidebar()"></div>

<div class="d-flex">
    <!-- Sidebar -->
    <div class="sidebar text-white" id="sidebar">
        <div class="p-4">
            <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                    <div class="bg-white bg-opacity-25 rounded p-2 me-3">
                        <i class="fas fa-store fs-4"></i>
                    </div>
                    <div>
                        <h4 class="mb-0 fw-bold">TechStore</h4>
                        <small class="text-light opacity-75">Admin Panel</small>
                    </div>
                </div>
                <button class="btn btn-link text-white d-lg-none p-2" onclick="toggleSidebar()">
                    <i class="fas fa-times fs-5"></i>
                </button>
            </div>
        </div>

        <nav class="mt-4">
            <div class="px-4 mb-3">
                <h6 class="text-uppercase text-light opacity-75 fw-semibold small">Quản lý chính</h6>
            </div>

            <a href="#" class="nav-item active d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('dashboard')">
                <i class="fas fa-tachometer-alt me-3"></i>
                <span>Dashboard</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('products')">
                <i class="fas fa-box me-3"></i>
                <span>Sản phẩm</span>
                <span class="badge bg-danger ms-auto">1,247</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('product-details')">
                <i class="fas fa-info-circle me-3"></i>
                <span>Chi tiết sản phẩm</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('storage')">
                <i class="fas fa-hdd me-3"></i>
                <span>Dung lượng</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('brands')">
                <i class="fas fa-tags me-3"></i>
                <span>Thương hiệu</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('colors')">
                <i class="fas fa-palette me-3"></i>
                <span>Màu sắc</span>
            </a>

            <div class="px-4 mb-3 mt-4">
                <h6 class="text-uppercase text-light opacity-75 fw-semibold small">Bán hàng</h6>
            </div>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('orders')">
                <i class="fas fa-receipt me-3"></i>
                <span>Hóa đơn</span>
                <span class="badge bg-success ms-auto">23</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none" onclick="showSection('users')">
                <i class="fas fa-users me-3"></i>
                <span>Người dùng</span>
            </a>

            <div class="px-4 mb-3 mt-4">
                <h6 class="text-uppercase text-light opacity-75 fw-semibold small">Hệ thống</h6>
            </div>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none">
                <i class="fas fa-cog me-3"></i>
                <span>Cài đặt</span>
            </a>

            <a href="#" class="nav-item d-flex align-items-center px-4 py-3 text-white text-decoration-none">
                <i class="fas fa-sign-out-alt me-3"></i>
                <span>Đăng xuất</span>
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content flex-grow-1">
        <!-- Header -->
        <header class="bg-white shadow-sm border-bottom">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between py-3">
                    <div class="d-flex align-items-center">
                        <button class="btn btn-link d-lg-none me-3 p-2" onclick="toggleSidebar()">
                            <i class="fas fa-bars"></i>
                        </button>
                        <div>
                            <h2 id="pageTitle" class="mb-0 fw-bold text-dark">Dashboard</h2>
                            <p id="pageSubtitle" class="mb-0 text-muted">Tổng quan hệ thống</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-center">

                        <button class="btn btn-link d-md-none me-2 p-2">
                            <i class="fas fa-search"></i>
                        </button>

                        <button class="btn btn-link position-relative me-3 p-2">
                            <i class="fas fa-bell fs-5"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">5</span>
                        </button>

                        <div class="d-flex align-items-center">
                            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Ccircle cx='20' cy='20' r='20' fill='%231E40AF'/%3E%3Ctext x='20' y='26' text-anchor='middle' fill='white' font-size='14' font-weight='bold'%3EAD%3C/text%3E%3C/svg%3E"
                                 alt="Admin" class="rounded-circle me-2" width="40" height="40">
                            <div class="d-none d-sm-block">
                                <p class="mb-0 fw-medium">Admin User</p>
                                <small class="text-muted">Quản trị viên</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Content Area -->
        <main class="container-fluid py-4">
            <!-- Dashboard Section -->
            <div id="dashboard" class="content-section active">
                <!-- Stats Cards -->
                <div class="row g-4 mb-4">
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="card stats-card text-white border-0 card-hover">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class="mb-1 opacity-75">Tổng sản phẩm</p>
                                        <h3 class="mb-1 fw-bold">1,247</h3>
                                        <small class="opacity-75">+12% tháng trước</small>
                                    </div>
                                    <i class="fas fa-box fs-1 opacity-75"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="card stats-card-2 text-white border-0 card-hover">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class="mb-1 opacity-75">Đơn hàng hôm nay</p>
                                        <h3 class="mb-1 fw-bold">89</h3>
                                        <small class="opacity-75">+5% hôm qua</small>
                                    </div>
                                    <i class="fas fa-shopping-cart fs-1 opacity-75"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="card stats-card-3 text-white border-0 card-hover">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class="mb-1 opacity-75">Doanh thu tháng</p>
                                        <h3 class="mb-1 fw-bold">₫2.4B</h3>
                                        <small class="opacity-75">+18% tháng trước</small>
                                    </div>
                                    <i class="fas fa-chart-line fs-1 opacity-75"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="card stats-card-4 text-white border-0 card-hover">
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class="mb-1 opacity-75">Người dùng</p>
                                        <h3 class="mb-1 fw-bold">15,432</h3>
                                        <small class="opacity-75">+8% tháng trước</small>
                                    </div>
                                    <i class="fas fa-users fs-1 opacity-75"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activities -->
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="card border-0 shadow-sm card-hover">
                            <div class="card-header bg-white border-0 pb-0">
                                <h5 class="card-title mb-0">Đơn hàng gần đây</h5>
                            </div>
                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between p-3 bg-light rounded mb-3">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-primary bg-opacity-25 rounded p-2 me-3">
                                            <i class="fas fa-receipt text-primary"></i>
                                        </div>
                                        <div>
                                            <p class="mb-0 fw-medium">#ORD-001</p>
                                            <small class="text-muted">Nguyễn Văn A</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <p class="mb-1 fw-semibold">₫2,490,000</p>
                                        <span class="status-badge status-pending">Chờ xử lý</span>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center justify-content-between p-3 bg-light rounded">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-success bg-opacity-25 rounded p-2 me-3">
                                            <i class="fas fa-receipt text-success"></i>
                                        </div>
                                        <div>
                                            <p class="mb-0 fw-medium">#ORD-002</p>
                                            <small class="text-muted">Trần Thị B</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <p class="mb-1 fw-semibold">₫1,290,000</p>
                                        <span class="status-badge status-active">Hoàn thành</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card border-0 shadow-sm card-hover">
                            <div class="card-header bg-white border-0 pb-0">
                                <h5 class="card-title mb-0">Sản phẩm bán chạy</h5>
                            </div>
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="bg-primary bg-opacity-25 rounded p-2 me-3">
                                        <i class="fas fa-mobile-alt text-primary"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <p class="mb-0 fw-medium">iPhone 15 Pro Max</p>
                                        <small class="text-muted">Đã bán: 45 chiếc</small>
                                    </div>
                                    <div class="text-end">
                                        <p class="mb-0 fw-semibold">₫34,990,000</p>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center">
                                    <div class="bg-secondary bg-opacity-25 rounded p-2 me-3">
                                        <i class="fas fa-laptop text-secondary"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <p class="mb-0 fw-medium">MacBook Pro 16"</p>
                                        <small class="text-muted">Đã bán: 23 chiếc</small>
                                    </div>
                                    <div class="text-end">
                                        <p class="mb-0 fw-semibold">₫89,990,000</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Products Section -->
            <div id="products" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title mb-1">Quản lý sản phẩm</h5>
                                <p class="text-muted mb-0">Quản lý toàn bộ sản phẩm trong hệ thống</p>
                            </div>
                            <button class="btn btn-gradient text-white" data-bs-toggle="modal" data-bs-target="#productModal">
                                <i class="fas fa-plus me-2"></i>Thêm sản phẩm
                            </button>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Sản phẩm</th>
                                    <th>Thương hiệu</th>
                                    <th>Giá</th>
                                    <th>Trạng thái</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#001</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-primary bg-opacity-25 rounded p-2 me-3">
                                                <i class="fas fa-mobile-alt text-primary"></i>
                                            </div>
                                            <div>
                                                <p class="mb-0 fw-medium">iPhone 15 Pro Max</p>
                                                <small class="text-muted">256GB - Titan Tự Nhiên</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Apple</td>
                                    <td class="fw-semibold">₫34,990,000</td>
                                    <td><span class="status-badge status-active">Đang bán</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
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

            <!-- Product Details Section -->
            <div id="product-details" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3">
                            <div>
                                <h5 class="card-title mb-1">Chi tiết sản phẩm</h5>
                                <p class="text-muted mb-0">Quản lý thông tin chi tiết của từng sản phẩm</p>
                            </div>
                            <div class="d-flex flex-column flex-sm-row gap-3 w-100 w-md-auto">
                                <div class="position-relative flex-grow-1 flex-sm-grow-0">
                                    <input type="text" class="form-control ps-5" placeholder="Tìm kiếm sản phẩm..." style="min-width: 250px;">
                                    <i class="fas fa-search position-absolute top-50 start-0 translate-middle-y ms-3 text-muted"></i>
                                </div>
                                <button class="btn btn-gradient text-white" data-bs-toggle="modal" data-bs-target="#productDetailModal">
                                    <i class="fas fa-plus me-2"></i>Thêm chi tiết
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Hãng</th>
                                    <th>Sản phẩm</th>
                                    <th>Dung lượng</th>
                                    <th>Màu sắc</th>
                                    <th>Mô tả</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#PD001</td>
                                    <td>Apple</td>
                                    <td>iPhone 15 Pro Max</td>
                                    <td>256GB</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-dark rounded-circle me-2" style="width: 16px; height: 16px;"></div>
                                            <span>Titan Tự Nhiên</span>
                                        </div>
                                    </td>
                                    <td class="fw-semibold">₫34,990,000</td>
                                    <td>45</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
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

            <!-- Storage Section -->
            <div id="storage" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title mb-1">Quản lý dung lượng</h5>
                                <p class="text-muted mb-0">Quản lý các tùy chọn dung lượng sản phẩm</p>
                            </div>
                            <button class="btn btn-gradient text-white" data-bs-toggle="modal" data-bs-target="#storageModal">
                                <i class="fas fa-plus me-2"></i>Thêm dung lượng
                            </button>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Dung lượng</th>
                                    <th>Mô tả</th>
                                    <th>Số sản phẩm</th>
                                    <th>Trạng thái</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#ST001</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-primary bg-opacity-25 rounded p-2 me-3">
                                                <i class="fas fa-hdd text-primary"></i>
                                            </div>
                                            <div>
                                                <p class="mb-0 fw-medium">64GB</p>
                                                <small class="text-muted">64 Gigabyte</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Dung lượng cơ bản</td>
                                    <td class="fw-semibold">23</td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#ST002</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-secondary bg-opacity-25 rounded p-2 me-3">
                                                <i class="fas fa-hdd text-secondary"></i>
                                            </div>
                                            <div>
                                                <p class="mb-0 fw-medium">128GB</p>
                                                <small class="text-muted">128 Gigabyte</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Dung lượng phổ biến</td>
                                    <td class="fw-semibold">156</td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
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

            <!-- Brands Section -->
            <div id="brands" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title mb-1">Quản lý thương hiệu</h5>
                                <p class="text-muted mb-0">Quản lý các thương hiệu sản phẩm</p>
                            </div>
                            <button class="btn btn-gradient text-white" data-bs-toggle="modal" data-bs-target="#brandModal">
                                <i class="fas fa-plus me-2"></i>Thêm thương hiệu
                            </button>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Thương hiệu</th>
                                    <th>Mô tả</th>
                                    <th>Số sản phẩm</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#BR001</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded p-2 me-3">
                                                <i class="fab fa-apple fs-5 text-dark"></i>
                                            </div>
                                            <div>
                                                <p class="mb-0 fw-medium">Apple</p>
                                                <small class="text-muted">Apple Inc.</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Công nghệ cao cấp từ Mỹ</td>
                                    <td class="fw-semibold">234</td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>01/01/2020</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#BR002</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-primary bg-opacity-25 rounded p-2 me-3">
                                                <i class="fab fa-android fs-5 text-primary"></i>
                                            </div>
                                            <div>
                                                <p class="mb-0 fw-medium">Samsung</p>
                                                <small class="text-muted">Samsung Electronics</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>Điện tử hàng đầu Hàn Quốc</td>
                                    <td class="fw-semibold">189</td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>15/03/2020</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
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

            <!-- Colors Section -->
            <div id="colors" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title mb-1">Quản lý màu sắc</h5>
                                <p class="text-muted mb-0">Quản lý các tùy chọn màu sắc sản phẩm</p>
                            </div>
                            <button class="btn btn-gradient text-white" data-bs-toggle="modal" data-bs-target="#colorModal">
                                <i class="fas fa-plus me-2"></i>Thêm màu sắc
                            </button>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Màu sắc</th>
                                    <th>Mã màu</th>
                                    <th>Số sản phẩm</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#CL001</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-dark rounded-circle me-3 border" style="width: 32px; height: 32px;"></div>
                                            <div>
                                                <p class="mb-0 fw-medium">Đen</p>
                                                <small class="text-muted">Black</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>#000000</td>
                                    <td class="fw-semibold">45</td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>01/01/2020</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#CL002</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-white rounded-circle me-3 border" style="width: 32px; height: 32px;"></div>
                                            <div>
                                                <p class="mb-0 fw-medium">Trắng</p>
                                                <small class="text-muted">White</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>#FFFFFF</td>
                                    <td class="fw-semibold">67</td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>01/01/2020</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
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

            <!-- Orders Section -->
            <div id="orders" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title mb-1">Quản lý hóa đơn</h5>
                                <p class="text-muted mb-0">Theo dõi và xử lý các đơn hàng</p>
                            </div>
                            <select class="form-select" style="width: auto;">
                                <option>Tất cả trạng thái</option>
                                <option>Chờ xử lý</option>
                                <option>Đang giao</option>
                                <option>Hoàn thành</option>
                                <option>Đã hủy</option>
                            </select>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Khách hàng</th>
                                    <th>Sản phẩm</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày đặt</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="fw-semibold">#ORD-001</td>
                                    <td>
                                        <div>
                                            <p class="mb-0 fw-medium">Nguyễn Văn A</p>
                                            <small class="text-muted">nguyenvana@email.com</small>
                                        </div>
                                    </td>
                                    <td>iPhone 15 Pro Max x1</td>
                                    <td class="fw-semibold">₫34,990,000</td>
                                    <td><span class="status-badge status-pending">Chờ xử lý</span></td>
                                    <td>15/12/2024</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-success me-1" title="Xác nhận">
                                            <i class="fas fa-check"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger" title="Hủy đơn">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fw-semibold">#ORD-002</td>
                                    <td>
                                        <div>
                                            <p class="mb-0 fw-medium">Trần Thị B</p>
                                            <small class="text-muted">tranthib@email.com</small>
                                        </div>
                                    </td>
                                    <td>MacBook Pro 16" x1</td>
                                    <td class="fw-semibold">₫89,990,000</td>
                                    <td><span class="status-badge status-active">Hoàn thành</span></td>
                                    <td>14/12/2024</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-secondary" disabled title="Đã hoàn thành">
                                            <i class="fas fa-check"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Users Section -->
            <div id="users" class="content-section">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white border-0">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title mb-1">Quản lý người dùng</h5>
                                <p class="text-muted mb-0">Quản lý tài khoản khách hàng và admin</p>
                            </div>
                            <button class="btn btn-gradient text-white" data-bs-toggle="modal" data-bs-target="#userModal">
                                <i class="fas fa-plus me-2"></i>Thêm người dùng
                            </button>
                        </div>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Người dùng</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#001</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Ccircle cx='20' cy='20' r='20' fill='%233B82F6'/%3E%3Ctext x='20' y='26' text-anchor='middle' fill='white' font-size='14' font-weight='bold'%3ENA%3C/text%3E%3C/svg%3E"
                                                 alt="User" class="rounded-circle me-3" width="40" height="40">
                                            <div>
                                                <p class="mb-0 fw-medium">Nguyễn Văn A</p>
                                                <small class="text-muted">Khách hàng VIP</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>nguyenvana@email.com</td>
                                    <td><span class="badge bg-primary">Khách hàng</span></td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>10/12/2024</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-success me-1" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger" title="Khóa tài khoản">
                                            <i class="fas fa-lock"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#002</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Ccircle cx='20' cy='20' r='20' fill='%23EF4444'/%3E%3Ctext x='20' y='26' text-anchor='middle' fill='white' font-size='14' font-weight='bold'%3ETB%3C/text%3E%3C/svg%3E"
                                                 alt="User" class="rounded-circle me-3" width="40" height="40">
                                            <div>
                                                <p class="mb-0 fw-medium">Trần Thị B</p>
                                                <small class="text-muted">Khách hàng thường</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>tranthib@email.com</td>
                                    <td><span class="badge bg-primary">Khách hàng</span></td>
                                    <td><span class="status-badge status-active">Hoạt động</span></td>
                                    <td>08/12/2024</td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary me-1" title="Xem chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-success me-1" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger" title="Khóa tài khoản">
                                            <i class="fas fa-lock"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm sản phẩm mới</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Tên sản phẩm</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Thương hiệu</label>
                            <select class="form-select">
                                <option>Chọn thương hiệu</option>
                                <option>Apple</option>
                                <option>Samsung</option>
                                <option>Xiaomi</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Mô tả</label>
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-gradient text-white">Lưu sản phẩm</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Sidebar toggle functionality
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const overlay = document.getElementById('sidebarOverlay');

        sidebar.classList.toggle('show');
        overlay.classList.toggle('show');
    }

    // Navigation functionality
    function showSection(sectionId) {
        // Hide all sections
        document.querySelectorAll('.content-section').forEach(section => {
            section.classList.remove('active');
        });

        // Remove active class from all nav items
        document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('active');
        });

        // Show selected section
        document.getElementById(sectionId).classList.add('active');

        // Add active class to clicked nav item
        event.target.closest('.nav-item').classList.add('active');

        // Update page title
        updatePageTitle(sectionId);

        // Close sidebar on mobile after selection
        if (window.innerWidth < 992) {
            toggleSidebar();
        }
    }

    function updatePageTitle(sectionId) {
        const titles = {
            'dashboard': { title: 'Dashboard', subtitle: 'Tổng quan hệ thống' },
            'products': { title: 'Quản lý sản phẩm', subtitle: 'Danh sách và thông tin sản phẩm' },
            'product-details': { title: 'Chi tiết sản phẩm', subtitle: 'Thông tin chi tiết từng sản phẩm' },
            'storage': { title: 'Quản lý dung lượng', subtitle: 'Các tùy chọn dung lượng sản phẩm' },
            'brands': { title: 'Quản lý thương hiệu', subtitle: 'Danh sách các thương hiệu' },
            'colors': { title: 'Quản lý màu sắc', subtitle: 'Các tùy chọn màu sắc sản phẩm' },
            'orders': { title: 'Quản lý hóa đơn', subtitle: 'Theo dõi và xử lý đơn hàng' },
            'users': { title: 'Quản lý người dùng', subtitle: 'Tài khoản khách hàng và admin' }
        };

        const pageInfo = titles[sectionId];
        if (pageInfo) {
            document.getElementById('pageTitle').textContent = pageInfo.title;
            document.getElementById('pageSubtitle').textContent = pageInfo.subtitle;
        }
    }

    // Show notification
    function showNotification(message, type = 'success') {
        const alertClass = type === 'success' ? 'alert-success' :
            type === 'error' ? 'alert-danger' : 'alert-info';

        const notification = document.createElement('div');
        notification.className = `alert ${alertClass} alert-dismissible fade show position-fixed`;
        notification.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
        notification.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;

        document.body.appendChild(notification);

        setTimeout(() => {
            if (notification.parentNode) {
                notification.remove();
            }
        }, 5000);
    }

    // Initialize
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Admin Dashboard với Bootstrap đã khởi tạo thành công!');
    });
</script>
<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'97940893527704f7',t:'MTc1Njg4OTc4Mi4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>
