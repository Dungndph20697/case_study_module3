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
                        <a class="btn btn-primary btn-custom" href="/admin/dung-luong?action=create">
                            <i class="fas fa-plus me-2"></i>Thêm Dung Lượng
                        </a>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="row mb-4">
                                <form action="${pageContext.request.contextPath}/admin/dung-luong" method="get"
                                      class="d-flex">
                                    <input type="hidden" name="action" value="search"/>
                                    <input type="text" name="keyword" class="form-control me-2"
                                           placeholder="Tìm kiếm dung lượng..." value="${param.keyword}"/>
                                    <%--                              <button type="submit" class="btn btn-primary">--%>
                                    <%--                                  <i class="fas fa-search"></i>--%>
                                    <%--                              </button>--%>
                                </form>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên Dung Lượng</th>
                                        <th>Thao Tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="dungLuong" items="${dungLuongs}" varStatus="status">
                                        <tr>
                                            <td><span class="badge bg-primary">${dungLuong.id}</span></td>
                                            <td class="fw-bold">${dungLuong.tenDungLuong}</td>
                                            <td class="action-buttons">
                                                <a href="/admin/dung-luong?action=edit&id=${dungLuong.id}"
                                                   class="btn btn-sm btn-outline-primary" title="Sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>

<%--                                                <a href="/admin/dung-luong?action=delete&id=${dungLuong.id}"--%>
<%--                                                   class="btn btn-sm btn-outline-danger" title="Xóa"--%>
<%--                                                   onclick="return confirm('Bạn có chắc muốn xóa không?')">--%>
<%--                                                    <i class="fas fa-trash"></i>--%>
<%--                                                </a>--%>
                                            </td>
                                        </tr>
                                    </c:forEach>
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
