<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Áo Nỉ / Áo Thu Đông</title>

  <!-- Bootstrap + Font -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    :root{--brand:#111;--muted:#6b7280;--bg:#fafafa;--active:#e11d48}
    *{font-family:Inter,system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif}
    body{background:var(--bg);color:#111}

    /* Topbar */
    .topbar{font-size:.95rem;border-bottom:1px solid #eee;background:#fff}

    /* Header đồng bộ */
    .atino-header{background:#fff;border-bottom:1px solid #eee}
    .atino-header .logo{font-weight:700;letter-spacing:.06em;font-size:1.75rem}
    .atino-header nav a{color:#111;text-decoration:none;font-weight:600;letter-spacing:.02em;padding-bottom:6px;border-bottom:2px solid transparent;transition:color .2s,border-color .2s}
    .atino-header nav a:hover{color:var(--active);border-color:var(--active)}
    .atino-header nav a.active{color:var(--active);border-color:var(--active)}
    .search-input{border-radius:999px;padding-left:1rem}

    /* Breadcrumb + lọc */
    .breadcrumb{--bs-breadcrumb-divider:'›'}
    .facet-title{font-weight:600;margin-bottom:.25rem}

    /* Card sản phẩm */
    .product-card{background:#fff;border:1px solid #eee;border-radius:16px;overflow:hidden;transition:transform .2s,box-shadow .2s}
    .product-card:hover{transform:translateY(-3px);box-shadow:0 8px 24px rgba(0,0,0,.08)}
    .product-img{aspect-ratio:1/1;object-fit:cover;background:#f4f4f5}
    .color-dot{width:18px;height:18px;border-radius:999px;border:1px solid rgba(0,0,0,.1);display:inline-block;margin-right:6px}
    .price{font-weight:700}
    .old-price{text-decoration:line-through;color:var(--muted);font-weight:500;margin-left:.5rem}
    .badge-new{position:absolute;left:12px;top:12px;background:#111;color:#fff;font-size:.75rem;padding:.25rem .5rem;border-radius:999px}

    /* Footer */
    .footer{background:#fff;border-top:1px solid #eee}
    .footer .title{font-weight:700;margin-bottom:.75rem}
    .phone{font-size:1.25rem;font-weight:700}

    /* Back to top */
    .sticky-actions{position:fixed;right:18px;bottom:18px;z-index:1000}
  </style>
</head>
<body>
    <jsp:include page="includes/header.jsp"/>
  <%-- TOPBAR: hotline + tài khoản --%>
  <div class="topbar py-2">
    <div class="container d-flex justify-content-between align-items-center">
      <div class="d-flex align-items-center gap-3">
        <span>📞 096728.4444 (8:30 – 22:20)</span>
        <span class="text-muted d-none d-md-inline">|</span>
        <span>📣 Góp ý & Khiếu nại: 096.895.90.50 (8:00 – 17:00)</span>
      </div>
      <div class="d-none d-md-flex align-items-center gap-3">
        <a href="#" class="text-decoration-none">Tài khoản</a>
        <a href="#" class="text-decoration-none">Giỏ hàng (<span id="cart-count">0</span>)</a>
      </div>
    </div>
  </div>

  <%-- HEADER: đồng bộ trên mọi trang --%>
<!--  <header class="atino-header">
    <div class="container py-3 d-flex align-items-center justify-content-between gap-3 flex-wrap">
      <div class="logo">Atino</div>

      <nav class="d-flex gap-4 flex-wrap">
        <a href="index.jsp"              class="">TRANG CHỦ</a>
        <a href="ao_ni_ao_thu_dong.jsp"  class="active">ÁO THU ĐÔNG</a>
        <a href="aoxuanhe.jsp"           class="">ÁO XUÂN HÈ</a>
        <a href="quan.jsp"               class="">QUẦN</a>
        <a href="phukien.jsp"            class="">PHỤ KIỆN</a>
        <a href="hethongCH.jsp"          class="">HỆ THỐNG CỬA HÀNG</a>
        <a href="thongtin.jsp"           class="">THÔNG TIN</a>
      </nav>

      <form class="d-flex" action="list" method="get" role="search">
        <input name="q" type="search" class="form-control search-input me-2" placeholder="Tìm kiếm sản phẩm..." value="${param.q}" />
        <button class="btn btn-outline-primary rounded-pill fw-semibold" type="submit">Tìm</button>
      </form>
    </div>
  </header>-->

  <%-- BREADCRUMB + TIÊU ĐỀ --%>
  <div class="container py-3">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-2">
        <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
        <li class="breadcrumb-item"><a href="ao_ni_ao_thu_dong.jsp">Áo Thu Đông</a></li>
        <li class="breadcrumb-item active" aria-current="page">Áo Nỉ / Áo Thun Dài Tay</li>
      </ol>
    </nav>
    <h1 class="h3 fw-bold">Áo Nỉ / Áo Thun Dài Tay</h1>
  </div>

  <%-- BỘ LỌC + SẮP XẾP --%>
  <div class="container pb-2">
    <div class="row g-3 align-items-end">
      <div class="col-12 col-lg-9">
        <div class="row g-3">
          <div class="col-12 col-md-4">
            <div class="facet-title">Màu sắc</div>
            <div class="d-flex flex-wrap gap-2">
              <c:forEach items="${colors}" var="c">
                <a href="?color=${c}" class="btn btn-sm btn-outline-dark">${c}</a>
              </c:forEach>
              <c:if test="${empty colors}">
                <span class="text-muted">(Dữ liệu màu sẽ bind từ server)</span>
              </c:if>
            </div>
          </div>

          <div class="col-12 col-md-4">
            <div class="facet-title">Kích cỡ</div>
            <div class="d-flex flex-wrap gap-2">
              <c:forEach items="${sizes}" var="s">
                <a href="?size=${s}" class="btn btn-sm btn-outline-dark">${s}</a>
              </c:forEach>
              <c:if test="${empty sizes}">
                <span class="text-muted">(Dữ liệu size sẽ bind từ server)</span>
              </c:if>
            </div>
          </div>

          <div class="col-12 col-md-4">
            <div class="facet-title">Khoảng giá</div>
            <div class="d-flex flex-wrap gap-2">
              <c:forEach items="${priceRanges}" var="p">
                <a href="?price=${p.code}" class="btn btn-sm btn-outline-dark">${p.label}</a>
              </c:forEach>
              <c:if test="${empty priceRanges}">
                <span class="text-muted">(Bind khoảng giá từ server)</span>
              </c:if>
            </div>
          </div>
        </div>
      </div>

      <div class="col-12 col-lg-3 text-lg-end">
        <form method="get">
          <label for="sort" class="form-label mb-1">Sắp xếp theo:</label>
          <select id="sort" name="sort" class="form-select" onchange="this.form.submit()">
            <option value="newest"     <c:if test="${param.sort=='newest'}">selected</c:if>>Mới nhất</option>
            <option value="price_asc"  <c:if test="${param.sort=='price_asc'}">selected</c:if>>Giá tăng dần</option>
            <option value="price_desc" <c:if test="${param.sort=='price_desc'}">selected</c:if>>Giá giảm dần</option>
            <option value="popular"    <c:if test="${param.sort=='popular'}">selected</c:if>>Phổ biến</option>
          </select>
        </form>
      </div>
    </div>
  </div>

  <%-- LƯỚI SẢN PHẨM --%>
  <div class="container py-3">
    <div class="row g-4">
      <%-- products: List<Product> {id, name, price, oldPrice, imageUrl, colors(List<String>), newArrival(Boolean)} --%>
      <c:forEach items="${products}" var="p">
        <div class="col-6 col-md-4 col-xl-3">
          <a href="detail?id=${p.id}" class="text-decoration-none text-dark">
            <div class="product-card position-relative h-100">
              <c:if test="${p.newArrival}"><span class="badge-new">New</span></c:if>

              <%-- Fallback ảnh nếu thiếu URL --%>
              <img class="product-img w-100"
                   src="${empty p.imageUrl ? 'https://placehold.co/800x800?text=No+Image' : p.imageUrl}"
                   alt="${p.name}" />

              <div class="p-3">
                <div class="small text-muted">Atino SWEAT/TEE</div>
                <div class="fw-semibold text-truncate" title="${p.name}">${p.name}</div>

                <div class="my-2">
                  <c:forEach items="${p.colors}" var="cc">
                    <span class="color-dot" style="background:${cc}"></span>
                  </c:forEach>
                </div>

                <div class="price">
                  <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫
                  <c:if test="${p.oldPrice gt p.price}">
                    <span class="old-price">
                      <fmt:formatNumber value="${p.oldPrice}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫
                    </span>
                  </c:if>
                </div>
              </div>
            </div>
          </a>
        </div>
      </c:forEach>

      <%-- Fallback demo khi chưa bind dữ liệu --%>
      <c:if test="${empty products}">
        <c:forEach begin="1" end="8" var="i">
          <div class="col-6 col-md-4 col-xl-3">
            <div class="product-card h-100">
              <img class="product-img w-100" src="https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=640&auto=format&fit=crop" alt="Demo" />
              <div class="p-3">
                <div class="small text-muted">Atino SWEAT/TEE</div>
                <div class="fw-semibold">Áo Nỉ Fitted L3.78${i}</div>
                <div class="my-2">
                  <span class="color-dot" style="background:#ccc"></span>
                  <span class="color-dot" style="background:#f2f2ea"></span>
                  <span class="color-dot" style="background:#2e2e2e"></span>
                </div>
                <div class="price">
                  <fmt:formatNumber value="${99000 + i*10000}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </c:if>
    </div>

    <%-- PHÂN TRANG --%>
    <nav class="mt-4" aria-label="Phân trang">
      <ul class="pagination justify-content-center">
        <li class="page-item ${page == 1 ? 'disabled' : ''}">
          <a class="page-link" href="?page=${page-1}">«</a>
        </li>
        <c:forEach begin="1" end="${totalPages != null ? totalPages : 5}" var="pno">
          <li class="page-item ${page == pno ? 'active' : ''}">
            <a class="page-link" href="?page=${pno}">${pno}</a>
          </li>
        </c:forEach>
        <li class="page-item ${page == totalPages ? 'disabled' : ''}">
          <a class="page-link" href="?page=${page+1}">»</a>
        </li>
      </ul>
    </nav>
  </div>

  <%-- FOOTER --%>
  <footer class="footer py-5 mt-5">
    <div class="container">
      <div class="row g-4">
        <div class="col-lg-4">
          <div class="title">GỌI MUA HÀNG (8:30 - 22:20)</div>
          <div class="phone">096728.4444</div>
          <div class="text-muted">Tất cả các ngày trong tuần</div>
          <hr class="my-4">
          <div class="title">GÓP Ý, KHIẾU NẠI (8:00 - 17:00)</div>
          <div class="phone">096.895.90.50</div>
          <div class="text-muted">Các ngày trong tuần (trừ ngày lễ)</div>
        </div>
        <div class="col-lg-4">
          <div class="title">VỀ CHÚNG TÔI</div>
          <p>HỘ KINH DOANH ATINO<br>
            Địa chỉ: Số 110 Phố Nhổn, Phường Tây Tựu,<br>Quận Bắc Từ Liêm, Tp Hà Nội<br>
            Mã số DN: 01D-8004624<br>
            Email: cntt@atino.vn
          </p>
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
          <div class="title">HỆ THỐNG CỬA HÀNG</div>
          <ul class="small text-muted mb-0" style="max-height:220px;overflow:auto">
            <li>Hà Nội: 110 Phố Nhổn</li>
            <li>1221 Giải Phóng</li>
            <li>34 Trần Phú, Hà Đông</li>
            <li>208 Bạch Mai</li>
            <li>175 Chùa Bộc</li>
            <li>116 Cầu Giấy</li>
            <li>312 K6 Trạm Trôi, Hoài Đức</li>
            <li>195 Quang Trung, TX Sơn Tây</li>
            <li>... (thêm từ server nếu có)</li>
          </ul>
        </div>
      </div>
      <div class="text-center text-muted small mt-4">© <script>document.write(new Date().getFullYear())</script> Atino – Áo Nỉ / Áo Thu Đông</div>
    </div>
  </footer>

  <%-- Back to top --%>
  <div class="sticky-actions">
    <a href="#" class="btn btn-dark rounded-circle" onclick="window.scrollTo({top:0,behavior:'smooth'});return false;" title="Về đầu trang">↑</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
