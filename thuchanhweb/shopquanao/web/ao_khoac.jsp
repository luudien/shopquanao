<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Áo Khoác</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root{--brand:#111;--muted:#6b7280;--bg:#fafafa}
    *{font-family:Inter,system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif}
    body{background:var(--bg);color:#111}
    .topbar{font-size:.95rem;border-bottom:1px solid #eee;background:#fff}
    .logo{font-weight:700;letter-spacing:.06em;font-size:1.75rem}
    .nav-link{color:#111;opacity:.85}
    .nav-link:hover{opacity:1}
    .search-input{border-radius:999px;padding-left:1rem}
    .breadcrumb{--bs-breadcrumb-divider:'›'}
    .facet-title{font-weight:600;margin-bottom:.25rem}

    .product-card{background:#fff;border:1px solid #eee;border-radius:16px;overflow:hidden;transition:transform .2s, box-shadow .2s}
    .product-card:hover{transform:translateY(-3px);box-shadow:0 8px 24px rgba(0,0,0,.08)}
    .product-img{aspect-ratio:1/1;object-fit:cover;background:#f4f4f5}
    .brand{font-size:.9rem;color:var(--muted)}
    .color-dot{width:18px;height:18px;border-radius:999px;border:1px solid rgba(0,0,0,.1);display:inline-block;margin-right:6px}
    .price{font-weight:700}
    .old-price{text-decoration:line-through;color:var(--muted);font-weight:500;margin-left:.5rem}
    .badge-oos{position:absolute;right:12px;top:12px;background:#fff;border:1px solid #ddd;padding:.25rem .5rem;border-radius:999px;font-size:.75rem}

    .footer{background:#fff;border-top:1px solid #eee}
  </style>
</head>
<body>
    <jsp:include page="includes/header.jsp"/>
  <!-- Topbar -->
  <div class="topbar py-2">
    <div class="container d-flex justify-content-between align-items-center">
      <div>📞 096728.4444 (8:30 – 22:20)</div>
      <div class="d-none d-md-flex align-items-center gap-3">
        <a href="#" class="text-decoration-none">Tài khoản</a>
        <a href="#" class="text-decoration-none">Giỏ hàng (<span id="cart-count">0</span>)</a>
      </div>
    </div>
  </div>

  <!-- Header/Nav -->
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

  <!-- Breadcrumb & Title -->
  <div class="container py-3">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-2">
        <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page">Áo Khoác</li>
      </ol>
    </nav>
    <h1 class="h3 fw-bold">Áo Khoác</h1>
  </div>

  <!-- Filters + Sort -->
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
              <c:if test="${empty colors}"><span class="text-muted">(Bind từ server)</span></c:if>
            </div>
          </div>
          <div class="col-12 col-md-4">
            <div class="facet-title">Kích cỡ</div>
            <div class="d-flex flex-wrap gap-2">
              <c:forEach items="${sizes}" var="s">
                <a href="?size=${s}" class="btn btn-sm btn-outline-dark">${s}</a>
              </c:forEach>
              <c:if test="${empty sizes}"><span class="text-muted">(Bind từ server)</span></c:if>
            </div>
          </div>
          <div class="col-12 col-md-4">
            <div class="facet-title">Khoảng giá</div>
            <div class="d-flex flex-wrap gap-2">
              <c:forEach items="${priceRanges}" var="p">
                <a href="?price=${p.code}" class="btn btn-sm btn-outline-dark">${p.label}</a>
              </c:forEach>
              <c:if test="${empty priceRanges}"><span class="text-muted">(Bind từ server)</span></c:if>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 col-lg-3 text-lg-end">
        <form method="get">
          <label for="sort" class="form-label mb-1">Sắp xếp theo:</label>
          <select id="sort" name="sort" class="form-select" onchange="this.form.submit()">
            <option value="newest" ${param.sort=="newest"?"selected":''}>Mới nhất</option>
            <option value="price_asc" ${param.sort=="price_asc"?"selected":''}>Giá tăng dần</option>
            <option value="price_desc" ${param.sort=="price_desc"?"selected":''}>Giá giảm dần</option>
            <option value="popular" ${param.sort=="popular"?"selected":''}>Phổ biến</option>
          </select>
        </form>
      </div>
    </div>
  </div>

  <!-- Product Grid -->
  <div class="container py-3">
    <div class="row g-4">
      <!-- Expect products = List<Product> with fields: id,name,price,oldPrice,imageUrl,colors,inStock(boolean) -->
      <c:forEach items="${products}" var="p">
        <div class="col-12 col-md-6 col-xl-3">
          <a href="detail?id=${p.id}" class="text-decoration-none text-dark">
            <div class="product-card position-relative h-100">
              <c:if test="${!p.inStock}"><span class="badge-oos">Hết hàng</span></c:if>
              <img class="product-img w-100" src="${p.imageUrl}" alt="${p.name}" />
              <div class="p-3 text-center">
                <div class="brand">Atino JACKET | ${p.sku}</div>
                <div class="fw-semibold text-truncate" title="${p.name}">${p.name}</div>
                <div class="my-2">
                  <c:forEach items="${p.colors}" var="cc">
                    <span class="color-dot" style="background:${cc}"></span>
                  </c:forEach>
                </div>
                <div class="price">
                  <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫
                  <c:if test="${p.oldPrice gt p.price}">
                    <span class="old-price"><fmt:formatNumber value="${p.oldPrice}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫</span>
                  </c:if>
                </div>
              </div>
            </div>
          </a>
        </div>
      </c:forEach>

      <!-- Demo fallback (if products empty) -->
      <c:if test="${empty products}">
        <c:forEach begin="1" end="8" var="i">
          <div class="col-12 col-md-6 col-xl-3">
            <div class="product-card h-100">
              <img class="product-img w-100" src="https://images.unsplash.com/photo-1548883354-2d0f5a06eb32?q=80&w=640&auto=format&fit=crop" alt="Demo" />
              <div class="p-3 text-center">
                <div class="brand">Atino JACKET | 18${i}</div>
                <div class="fw-semibold">Áo Khoác L3.8${i}07</div>
                <div class="my-2">
                  <span class="color-dot" style="background:#2e2e2e"></span>
                  <span class="color-dot" style="background:#e5e7eb"></span>
                  <span class="color-dot" style="background:#8b7355"></span>
                </div>
                <div class="price"><fmt:formatNumber value="${479000 + i*10000}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫</div>
              </div>
            </div>
          </div>
        </c:forEach>
      </c:if>
    </div>

    <!-- Pagination -->
    <nav class="mt-4" aria-label="Phân trang">
      <ul class="pagination justify-content-center">
        <li class="page-item ${page == 1 ? 'disabled' : ''}"><a class="page-link" href="?page=${page-1}">«</a></li>
        <c:forEach begin="1" end="${totalPages != null ? totalPages : 5}" var="pno">
          <li class="page-item ${page == pno ? 'active' : ''}"><a class="page-link" href="?page=${pno}">${pno}</a></li>
        </c:forEach>
        <li class="page-item ${page == totalPages ? 'disabled' : ''}"><a class="page-link" href="?page=${page+1}">»</a></li>
      </ul>
    </nav>
  </div>

  <!-- Banner -->
  <div class="container my-4">
    <img class="w-100 rounded-3" src="https://images.unsplash.com/photo-1516762689617-e1cffcef479d?q=80&w=1600&auto=format&fit=crop" alt="Banner" />
  </div>

  <!-- Footer -->
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
            <li>1221 Giải Phóng</li>
            <li>34 Trần Phú, Hà Đông</li>
            <li>175 Chùa Bộc</li>
            <li>195 Quang Trung, Sơn Tây</li>
            <li>225 Võ Văn Ngân, Thủ Đức</li>
            <li>567 Quang Trung, Gò Vấp</li>
            <li>... (bind thêm từ server)</li>
          </ul>
        </div>
      </div>
      <div class="text-center text-muted small mt-4">© <script>document.write(new Date().getFullYear())</script> Atino – Trang Áo Khoác (JSP)</div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
