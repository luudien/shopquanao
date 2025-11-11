<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Hệ thống cửa hàng | Atino</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {--brand:#111;--muted:#6b7280;--bg:#fafafa;}
    * {font-family:Inter,system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif;}
    body {background:var(--bg);color:#111;}
    .topbar {font-size:.95rem;border-bottom:1px solid #eee;background:#fff;}
    .logo {font-weight:700;letter-spacing:.06em;font-size:1.75rem;}
    .nav-link {color:#111;opacity:.85;}
    .nav-link:hover {opacity:1;}
    .search-input {border-radius:999px;padding-left:1rem;}
    .store-list {max-height:650px;overflow-y:auto;background:#fff;border-radius:10px;border:1px solid #e5e5e5;padding:1rem;}
    .store-item {margin-bottom:1rem;padding-bottom:1rem;border-bottom:1px dashed #ddd;}
    .store-item:last-child {border-bottom:none;}
    .map-container {background:#eee;height:650px;border-radius:10px;overflow:hidden;}
    .footer {background:#fff;border-top:1px solid #eee;}
  </style>
</head>
<body>

  <jsp:include page="includes/header.jsp"/>

  <!-- ===== Thanh trên cùng ===== -->
  <div class="topbar py-2">
    <div class="container d-flex justify-content-between align-items-center">
      <div>📞 096728.4444 (8:30 – 22:20)</div>
      <div class="d-none d-md-flex align-items-center gap-3">
        <a href="#" class="text-decoration-none">Tài khoản</a>
        <a href="#" class="text-decoration-none">Giỏ hàng (0)</a>
      </div>
    </div>
  </div>

  <!-- ===== Tiêu đề trang ===== -->
  <div class="container py-4">
    <h1 class="h3 fw-bold mb-3">HỆ THỐNG CỬA HÀNG ATINO</h1>
  </div>

  <!-- ===== Danh sách cửa hàng + Bản đồ ===== -->
  <div class="container pb-5">
    <div class="row g-4">
      <!-- Cột bên trái: Danh sách cửa hàng -->
      <div class="col-12 col-lg-4">
        <div class="store-list">
          <div class="fw-semibold mb-3">DANH SÁCH ĐỊA CHỈ CÁC CỬA HÀNG</div>
          <div class="mb-3">
            <label class="form-label">Tỉnh thành</label>
            <select class="form-select">
              <option>Toàn quốc</option>
              <option>Hà Nội</option>
              <option>TP. Hồ Chí Minh</option>
              <option>Đà Nẵng</option>
              <option>Bình Dương</option>
              <option>Hải Phòng</option>
            </select>
          </div>

          <!-- Danh sách bind từ server -->
          <c:forEach items="${stores}" var="s">
            <div class="store-item">
              <div><strong>${s.name}</strong></div>
              <div>${s.address}</div>
              <div>SĐT: <span class="fw-semibold">${s.phone}</span></div>
            </div>
          </c:forEach>

          <!-- Nếu chưa có dữ liệu -->
          <c:if test="${empty stores}">
            <div class="store-item">
              <strong>ATINO: 110 Phố Nhổn, Bắc Từ Liêm, Hà Nội</strong>
              <div>Số điện thoại: <span class="fw-semibold">0967284444</span></div>
            </div>
            <div class="store-item">
              <strong>ATINO: 208 Bạch Mai, Hai Bà Trưng, Hà Nội</strong>
              <div>Số điện thoại: <span class="fw-semibold">0967284444</span></div>
            </div>
            <div class="store-item">
              <strong>ATINO: 175 Chùa Bộc, Đống Đa, Hà Nội</strong>
              <div>Số điện thoại: <span class="fw-semibold">0967284444</span></div>
            </div>
            <div class="store-item">
              <strong>ATINO: 312 Khu 6, Trạm Trôi, Hoài Đức</strong>
              <div>Số điện thoại: <span class="fw-semibold">0967284444</span></div>
            </div>
            <div class="store-item">
              <strong>ATINO: 116 Cầu Giấy, Quan Hoa, Hà Nội</strong>
              <div>Số điện thoại: <span class="fw-semibold">0967284444</span></div>
            </div>
            <div class="store-item">
              <strong>ATINO: 218 Lĩnh Nam, Hoàng Mai, Hà Nội</strong>
              <div>Số điện thoại: <span class="fw-semibold">0967284444</span></div>
            </div>
          </c:if>
        </div>
      </div>

      <!-- Cột bên phải: Bản đồ -->
      <div class="col-12 col-lg-8">
        <div class="map-container" id="map">
          <!-- Google Maps hiển thị địa chỉ mới -->
          <iframe
            src="https://www.google.com/maps?q=218%20Lĩnh%20Nam,%20Hoàng%20Mai,%20Hà%20Nội&output=embed"
            width="100%"
            height="100%"
            style="border:0; border-radius:10px;"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
          </iframe>
        </div>
      </div>
    </div>
  </div>

  <!-- ===== Banner hình ảnh ===== -->
  <div class="container mb-4">
    <img src="https://images.unsplash.com/photo-1607083206967-7c59c50f4b90?q=80&w=1600&auto=format&fit=crop" class="w-100 rounded-3" alt="Cửa hàng Atino" />
  </div>

  <!-- ===== Footer ===== -->
  <footer class="footer py-5 mt-5">
    <div class="container">
      <div class="row g-4">
        <div class="col-lg-4">
          <div class="fw-bold mb-2">GỌI MUA HÀNG (8:30 - 22:20)</div>
          <div class="fs-4 fw-bold">096728.4444</div>
          <div class="text-muted">Tất cả các ngày trong tuần</div>
          <hr class="my-4">
          <div class="fw-bold mb-2">GÓP Ý, KHIẾU NẠI (8:00 - 17:00)</div>
          <div class="fs-4 fw-bold">096.895.90.50</div>
          <div class="text-muted">Các ngày trong tuần (trừ ngày lễ)</div>
        </div>
        <div class="col-lg-4">
          <div class="fw-bold mb-2">VỀ CHÚNG TÔI</div>
          <p class="mb-3 small">HỘ KINH DOANH ATINO<br>Đ/c: 110 Phố Nhổn, P. Tây Tựu, Q. Bắc Từ Liêm, Hà Nội<br>Mã số DN: 01D-8004624<br>Email: cntt@atino.vn</p>
          <form class="d-flex gap-2">
            <input class="form-control" placeholder="Nhập email của bạn tại đây..." />
            <button class="btn btn-dark" type="button">Đăng ký</button>
          </form>
          <div class="mt-3 d-flex gap-3">
            <a href="#" class="text-decoration-none">Facebook</a>
            <a href="#" class="text-decoration-none">Instagram</a>
            <a href="#" class="text-decoration-none">Shopee</a>
            <a href="#" class="text-decoration-none">Lazada</a>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="fw-bold mb-2">HỆ THỐNG CỬA HÀNG</div>
          <ul class="small text-muted mb-0" style="max-height:220px;overflow:auto">
            <li>110 Phố Nhổn (HN)</li>
            <li>208 Bạch Mai</li>
            <li>175 Chùa Bộc</li>
            <li>116 Cầu Giấy</li>
            <li>218 Lĩnh Nam</li>
            <li>225 Võ Văn Ngân (TP.HCM)</li>
            <li>567 Quang Trung (Gò Vấp)</li>
            <li>... (bind thêm từ server)</li>
          </ul>
        </div>
      </div>
      <div class="text-center text-muted small mt-4">© <script>document.write(new Date().getFullYear())</script> Atino – Hệ thống cửa hàng</div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
