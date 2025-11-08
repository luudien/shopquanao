<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
/* ====== KẾT NỐI DB & LẤY DỮ LIỆU PRODUCTS ====== */
String jdbcUrl  = "jdbc:mysql://localhost:3306/myappdb?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
String jdbcUser = "root";       // hoặc "myappuser"
String jdbcPass = "";           // hoặc "mypassword" nếu bạn đã đặt

List<Map<String,Object>> products = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");   // cần mysql-connector-j
    try (Connection cn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
         Statement st = cn.createStatement()) {

        // BẢNG products: id INT PK, name VARCHAR, price DECIMAL/INT, image_url VARCHAR
        String sql = "SELECT id, name, price, image_url FROM products ORDER BY id DESC";
        try (ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Map<String,Object> p = new HashMap<>();
                p.put("id",        rs.getInt("id"));
                p.put("name",      rs.getString("name"));
                p.put("price",     rs.getBigDecimal("price"));   // hoặc getInt nếu bạn dùng INT
                p.put("imageUrl",  rs.getString("image_url"));
                products.add(p);
            }
        }
    }
} catch (Exception e) {
    // Nếu lỗi (chưa có bảng products, sai driver, v.v.) thì để rỗng để phần demo bên dưới hiển thị
    request.setAttribute("dbError", e.getMessage());
}
request.setAttribute("products", products);
%>

<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Atino - Demo (index.jsp)</title>
  <link rel="stylesheet" href="css/home.css">

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .topbar { background:#fff; border-bottom:1px solid #eee; }
    .contact-phone { font-weight:700; color:#222; }
    .category-menu { background:#fff; }
    .product-card img { object-fit:cover; height:260px; }
    .footer { background:#f8f9fa; padding:30px 0; font-size:0.95rem; }
    .brand-logo { height:48px; }
    .nav-categories .dropdown-menu { max-height:400px; overflow:auto; }
  </style>
</head>
<body>
    
<!-- Thông báo lỗi DB (nếu có) -->
<c:if test="${not empty dbError}">
  <div class="container mt-3">
    <div class="alert alert-warning">
      ⚠️ Không tải được dữ liệu từ database: ${dbError}
    </div>
  </div>
</c:if>

<!-- TOP BAR -->
<header class="topbar py-2">
  <div class="container d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center gap-3">
      <img src="assets/logo.png" alt="Atino" class="brand-logo">
      <span class="text-muted">Always Be Casual</span>
    </div>

    <div class="d-flex align-items-center gap-3">
      <div class="contact-phone">096728.4444</div>
      <a href="#" class="btn btn-outline-secondary btn-sm">Giỏ hàng (0)</a>
      <a href="#" class="btn btn-outline-secondary btn-sm">Tài khoản</a>
    </div>
  </div>
</header>

<!-- NAV / CATEGORIES -->
<nav class="navbar navbar-expand-lg navbar-light bg-white category-menu shadow-sm">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-categories">
        <li class="nav-item"><a class="nav-link active" href="#">Trang chủ</a></li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="menMenu" role="button" data-bs-toggle="dropdown">ÁO THU ĐÔNG</a>
          <ul class="dropdown-menu" aria-labelledby="menMenu">
            <li><a class="dropdown-item" href="ao_ni_ao_thu_dong.jsp">Áo Nỉ / Áo Thun Dài Tay</a></li>
            <li><a class="dropdown-item" href="ao_len.jsp">Áo Len</a></li>
            <li><a class="dropdown-item" href="ao_khoac.jsp">Áo Khoác</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="Cadigan.jsp">Cardigan</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="aoxuanhe.jsp">ÁO XUÂN HÈ</a></li>
        <li class="nav-item"><a class="nav-link" href="quan.jsp">QUẦN</a></li>
        <li class="nav-item"><a class="nav-link" href="phukien.jsp">PHỤ KIỆN</a></li>
        <li class="nav-item"><a class="nav-link" href="hethongCH.jsp">Hệ thống cửa hàng</a></li>
        <li class="nav-item"><a class="nav-link" href="thongtin.jsp">Thông Tin</a></li>
      </ul>

      <form class="d-flex" role="search" action="search">
        <input class="form-control me-2" type="search" placeholder="Tìm kiếm sản phẩm..." name="q">
        <button class="btn btn-outline-primary" type="submit">Tìm</button>
      </form>
    </div>
  </div>
</nav>

<!-- SLIDER / HERO -->
<section class="py-3">
  <div class="container">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="assets/slide1.jpg" class="d-block w-100" alt="Slide 1" style="height:360px; object-fit:cover;">
        </div>
        <div class="carousel-item">
          <img src="assets/slide2.jpg" class="d-block w-100" alt="Slide 2" style="height:360px; object-fit:cover;">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </div>
</section>

<!-- SẢN PHẨM MỚI - GRID -->
<section class="py-4">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h3 class="mb-0">Sản phẩm mới</h3>
      <a href="#" class="text-decoration-none">Xem tất cả &raquo;</a>
    </div>

    <div class="row g-3">
      <!-- Hiển thị từ DB nếu có -->
      <c:forEach var="p" items="${products}">
        <div class="col-6 col-md-3">
          <div class="card product-card h-100">
            <img src="${empty p.imageUrl ? 'assets/prod1.jpg' : p.imageUrl}" class="card-img-top" alt="${p.name}">
            <div class="card-body d-flex flex-column">
              <h6 class="card-title">${p.name}</h6>
              <p class="card-text mt-auto fw-bold">
                <c:out value="${p.price}" />₫
              </p>
              <div class="d-grid gap-2 mt-2">
                <a href="product?id=${p.id}" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
                <form action="cart/add" method="post" class="d-inline">
                  <input type="hidden" name="productId" value="${p.id}">
                  <button class="btn btn-primary btn-sm" type="submit">Mua nhanh</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>

      <!-- Nếu chưa có DB / lỗi → hiển thị demo -->
      <c:if test="${empty products}">
        <div class="col-6 col-md-3">
          <div class="card product-card">
            <img src="assets/prod1.jpg" class="card-img-top" alt="Áo Sơ Mi Slim">
            <div class="card-body">
              <h6 class="card-title">Áo Sơ Mi Slim L.4.4471</h6>
              <p class="fw-bold">215,000₫</p>
              <a href="#" class="btn btn-outline-primary btn-sm">Xem chi tiết</a>
            </div>
          </div>
        </div>
      </c:if>
    </div>
  </div>
</section>

<!-- FOOTER -->
<footer class="footer">
  <div class="container">
    <div class="row">
      <div class="col-md-4 mb-3">
        <h6>Về chúng tôi</h6>
        <p>HỘ KINH DOANH ATINO<br>
        Địa chỉ: Số 110 Phố Nhổn, Phường Tây Tựu, Bắc Từ Liêm, Hà Nội<br>
        Email: cntt@atino.vn</p>
      </div>
      <div class="col-md-4 mb-3">
        <h6>Gọi mua hàng</h6>
        <p class="mb-1">096728.4444 (8:30 - 22:20)</p>
        <h6>Hỗ trợ</h6>
        <ul class="list-unstyled">
          <li><a href="#">Hướng dẫn mua hàng</a></li>
          <li><a href="#">Chính sách vận chuyển</a></li>
          <li><a href="#">Quy định đổi trả</a></li>
        </ul>
      </div>
      <div class="col-md-4 mb-3">
        <h6>Theo dõi chúng tôi</h6>
        <p>
          <a href="#" class="me-2">Facebook</a>
          <a href="#" class="me-2">Instagram</a>
          <a href="#">Shopee</a>
        </p>
      </div>
    </div>
    <div class="text-center mt-3">
      <small>Thiết kế website bởi NHANH.VN - Demo mô phỏng</small>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
