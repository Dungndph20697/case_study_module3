<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Màu Sắc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-5">
<div class="container">
    <h2 class="mb-4 text-primary"><i class="fas fa-plus me-2"></i>Thêm Màu Sắc</h2>

    <form action="${pageContext.request.contextPath}/admin/mau-sac" method="post">
        <!-- ẩn ID vì thêm mới -->
        <input type="hidden" name="id" value="">

        <div class="mb-3">
            <label for="tenMauSac" class="form-label">Tên Màu Sắc</label>
            <input type="text" class="form-control" id="tenMauSac" name="tenMauSac" placeholder="Nhập tên màu..." required>
        </div>

        <button type="submit" class="btn btn-success">
            <i class="fas fa-save me-2"></i>Lưu
        </button>
        <a href="${pageContext.request.contextPath}/admin/mau-sac" class="btn btn-secondary">
            <i class="fas fa-arrow-left me-2"></i>Quay lại
        </a>
    </form>
</div>
<script src="https://kit.fontawesome.com/a2e0e9e91b.js" crossorigin="anonymous"></script>
</body>
</html>
