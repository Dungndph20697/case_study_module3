<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa màu sắc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-5">

<h2 class="mb-4">Sửa Màu Sắc</h2>

<form action="${pageContext.request.contextPath}/admin/mau-sac?action=update" method="post">
    <input type="hidden" name="id" value="${mauSac.id}"/>

    <div class="mb-3">
        <label for="tenMauSac">Tên màu</label>
        <input type="text" name="tenMauSac" class="form-control" value="${mauSac.mauSac}" required/>
    </div>

    <button type="submit" class="btn btn-primary">Cập nhật</button>
    <a href="${pageContext.request.contextPath}/admin/mau-sac" class="btn btn-secondary">Hủy</a>
</form>

</body>
</html>
