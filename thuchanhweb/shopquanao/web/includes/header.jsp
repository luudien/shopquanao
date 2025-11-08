<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Font Inter có tiếng Việt -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700&display=swap&subset=vietnamese" rel="stylesheet">

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