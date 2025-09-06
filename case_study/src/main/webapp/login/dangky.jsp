<%--
  Created by IntelliJ IDEA.
  User: chung
  Date: 6/9/25
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản - MobileStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
        }

        .register-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
        }

        .register-left {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }

        .register-right {
            padding: 3rem;
        }

        .brand-logo {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .form-floating {
            margin-bottom: 1.5rem;
        }

        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 12px;
            padding: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
        }

        .btn-register {
            background: linear-gradient(135deg, #007bff, #0056b3);
            border: none;
            border-radius: 12px;
            padding: 1rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,123,255,0.3);
        }

        .social-btn {
            border: 2px solid #e9ecef;
            border-radius: 12px;
            padding: 0.75rem;
            transition: all 0.3s ease;
            text-decoration: none;
            color: #495057;
        }

        .social-btn:hover {
            border-color: #007bff;
            color: #007bff;
            transform: translateY(-1px);
        }

        .password-strength {
            height: 4px;
            border-radius: 2px;
            margin-top: 0.5rem;
            transition: all 0.3s ease;
        }

        .strength-weak { background: #dc3545; width: 25%; }
        .strength-fair { background: #ffc107; width: 50%; }
        .strength-good { background: #17a2b8; width: 75%; }
        .strength-strong { background: #28a745; width: 100%; }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
        }

        .login-link {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        .terms-link {
            color: #007bff;
            text-decoration: none;
        }

        .terms-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .register-left {
                padding: 2rem;
            }

            .register-right {
                padding: 2rem;
            }

            .brand-logo {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="register-card">
        <div class="row g-0">
            <!-- Left Side - Welcome -->
            <div class="col-lg-5 register-left">
                <div class="brand-logo">
                    <i class="bi bi-phone"></i>
                </div>
                <h2 class="mb-4">Chào Mừng Đến Với MobileStore!</h2>
                <p class="mb-4 opacity-75">Tạo tài khoản để trải nghiệm những tính năng tuyệt vời</p>

                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <div>
                        <strong>Bảo mật cao</strong>
                        <div class="small opacity-75">Thông tin được mã hóa an toàn</div>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="bi bi-gift"></i>
                    </div>
                    <div>
                        <strong>Ưu đãi độc quyền</strong>
                        <div class="small opacity-75">Giảm giá đặc biệt cho thành viên</div>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="bi bi-truck"></i>
                    </div>
                    <div>
                        <strong>Giao hàng nhanh</strong>
                        <div class="small opacity-75">Miễn phí vận chuyển toàn quốc</div>
                    </div>
                </div>
            </div>

            <!-- Right Side - Registration Form -->
            <div class="col-lg-7 register-right">
                <div class="text-center mb-4">
                    <h3 class="text-primary mb-2">Đăng Ký Tài Khoản</h3>
                    <p class="text-muted">Điền thông tin để tạo tài khoản mới</p>
                </div>

                <form id="registerServlet" action="${pageContext.request.contextPath}/dang-ky" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Họ" required>
                                <label for="firstName">Họ *</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Tên" required>
                                <label for="lastName">Tên *</label>
                            </div>
                        </div>
                    </div>
                    <!-- email -->
                    <div class="form-floating">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                        <label for="email">Email *</label>
                    </div>
                    <!-- phone -->
                    <div class="form-floating">
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Số điện thoại" required>
                        <label for="phone">Số điện thoại *</label>
                    </div>
                    <!-- password -->
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                        <label for="password">Mật khẩu *</label>
                    </div>
                    <!-- confirm password -->
                    <div class="form-floating">
                        <input type="password" class="form-control" id="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                        <label for="confirmPassword">Xác nhận mật khẩu *</label>
                    </div>

                    <button type="submit" class="btn btn-primary btn-register w-100 mb-3">
                        <i class="bi bi-person-plus me-2"></i>Đăng Ký Tài Khoản
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Password strength checker
    document.getElementById('password').addEventListener('input', function() {
        const password = this.value;
        const strengthBar = document.getElementById('passwordStrength');

        let strength = 0;

        // Check password criteria
        if (password.length >= 8) strength++;
        if (/[a-z]/.test(password)) strength++;
        if (/[A-Z]/.test(password)) strength++;
        if (/[0-9]/.test(password)) strength++;
        if (/[^A-Za-z0-9]/.test(password)) strength++;

        // Update strength bar
        strengthBar.className = 'password-strength';
        if (strength === 0) {
            strengthBar.style.width = '0%';
        } else if (strength <= 2) {
            strengthBar.classList.add('strength-weak');
        } else if (strength === 3) {
            strengthBar.classList.add('strength-fair');
        } else if (strength === 4) {
            strengthBar.classList.add('strength-good');
        } else {
            strengthBar.classList.add('strength-strong');
        }
    });

    // Form validation
    document.getElementById('registerForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const terms = document.getElementById('terms').checked;

        // Check if passwords match
        if (password !== confirmPassword) {
            alert('Mật khẩu xác nhận không khớp!');
            return;
        }

        // Check if terms are accepted
        if (!terms) {
            alert('Vui lòng đồng ý với điều khoản sử dụng!');
            return;
        }

        // Check password strength
        if (password.length < 8) {
            alert('Mật khẩu phải có ít nhất 8 ký tự!');
            return;
        }

        // Simulate registration process
        const submitBtn = document.querySelector('.btn-register');
        const originalText = submitBtn.innerHTML;

        submitBtn.innerHTML = '<i class="bi bi-hourglass-split me-2"></i>Đang xử lý...';
        submitBtn.disabled = true;

        setTimeout(() => {
            alert('Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.');
            submitBtn.innerHTML = originalText;
            submitBtn.disabled = false;

            // Reset form
            this.reset();
            document.getElementById('passwordStrength').style.width = '0%';
        }, 2000);
    });

    // Phone number formatting
    document.getElementById('phone').addEventListener('input', function() {
        let value = this.value.replace(/\D/g, '');
        if (value.length > 0) {
            if (value.length <= 3) {
                value = value;
            } else if (value.length <= 6) {
                value = value.slice(0, 3) + ' ' + value.slice(3);
            } else if (value.length <= 10) {
                value = value.slice(0, 3) + ' ' + value.slice(3, 6) + ' ' + value.slice(6);
            } else {
                value = value.slice(0, 3) + ' ' + value.slice(3, 6) + ' ' + value.slice(6, 10);
            }
        }
        this.value = value;
    });

    // Email validation
    document.getElementById('email').addEventListener('blur', function() {
        const email = this.value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (email && !emailRegex.test(email)) {
            this.setCustomValidity('Vui lòng nhập email hợp lệ');
            this.classList.add('is-invalid');
        } else {
            this.setCustomValidity('');
            this.classList.remove('is-invalid');
        }
    });

    // Social login handlers
    document.querySelectorAll('.social-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const provider = this.textContent.trim();
            alert(`Tính năng đăng ký với ${provider} sẽ được cập nhật sớm!`);
        });
    });
</script>
<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'97ae52f894a1064f',t:'MTc1NzE2NTQ1OS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>

