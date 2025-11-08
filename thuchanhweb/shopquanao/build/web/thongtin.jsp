<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
  ==============================================
  TRANG THÔNG TIN / TIN TỨC – COMMENT TIẾNG VIỆT
  Công dụng: Trang liệt kê các bài viết: tầm nhìn, hệ thống cửa hàng, chính sách, hướng dẫn...

  Cách dùng (Controller/Servlet):
    - Đẩy vào request các biến sau:
      title        : Tiêu đề trang (ví dụ: "Tin Tức")
      posts        : List<Post> gồm các trường gợi ý
                     id, title, excerpt, imageUrl, slug, category, createdAt(java.util.Date)
      page         : trang hiện tại (int)
      totalPages   : tổng số trang (int)
    - Tuỳ chọn: categories(List<String>) để hiện bộ lọc danh mục; q (từ khoá tìm kiếm)

  Hành vi:
    - Lưới 3 cột (desktop), 2 cột (tablet), 1 cột (mobile)
    - Mỗi card hiển thị ảnh, tiêu đề, mô tả ngắn, link "Xem thêm"
    - Có breadcrumb, ô tìm kiếm, phân trang, footer đồng bộ style Atino
  ==============================================
--%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${empty title ? 'Tin Tức' : title}</title>
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

    /* Card bài viết */
    .post-card{background:#fff;border:1px solid #eee;border-radius:16px;overflow:hidden;transition:transform .2s, box-shadow .2s}
    .post-card:hover{transform:translateY(-3px);box-shadow:0 8px 24px rgba(0,0,0,.08)}
    .post-thumb{aspect-ratio:16/9;object-fit:cover;background:#f4f4f5}
    .post-title{font-weight:700}
    .post-excerpt{color:var(--muted)}
    .readmore{color:#e11d48;font-weight:600;text-decoration:none}

    .footer{background:#fff;border-top:1px solid #eee}
  </style>
</head>
<body>
    <jsp:include page="includes/header.jsp"/>
  <!-- ===== Topbar ===== -->
  <div class="topbar py-2">
    <div class="container d-flex justify-content-between align-items-center">
      <div>📞 096728.4444 (8:30 – 22:20)</div>
      <div class="d-none d-md-flex align-items-center gap-3">
        <a href="#" class="text-decoration-none">Tài khoản</a>
        <a href="#" class="text-decoration-none">Giỏ hàng (0)</a>
      </div>
    </div>
  </div>

  <!-- ===== Header/Nav ===== -->
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

  <!-- ===== Breadcrumb + Title ===== -->
  <div class="container py-3">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb mb-2">
        <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page">${empty title ? 'Tin Tức' : title}</li>
      </ol>
    </nav>
    <h1 class="h3 fw-bold">${empty title ? 'Tin Tức' : title}</h1>
  </div>

  <!-- ===== Bộ lọc danh mục (tuỳ chọn) ===== -->
  <div class="container pb-2">
    <c:if test="${not empty categories}">
      <div class="d-flex flex-wrap gap-2">
        <a class="btn btn-sm btn-dark" href="news">Tất cả</a>
        <c:forEach items="${categories}" var="cat">
          <a class="btn btn-sm btn-outline-dark" href="news?category=${cat}">${cat}</a>
        </c:forEach>
      </div>
    </c:if>
  </div>

  <!-- ===== Lưới bài viết ===== -->
  <div class="container py-3">
    <div class="row g-4">
      <!-- Lặp qua danh sách posts do server truyền sang -->
      <c:forEach items="${posts}" var="p">
        <div class="col-12 col-md-6 col-xl-4">
          <article class="post-card h-100 d-flex flex-column">
            <a href="news/detail?slug=${p.slug}" class="text-decoration-none text-dark">
              <img class="post-thumb w-100" src="${p.imageUrl}" alt="${p.title}" />
            </a>
            <div class="p-3 d-flex flex-column flex-grow-1">
              <a href="news/detail?slug=${p.slug}" class="text-decoration-none text-dark">
                <h2 class="post-title h6 mb-1 text-uppercase">${p.title}</h2>
              </a>
              <div class="post-excerpt small mb-3">${p.excerpt}</div>
              <div class="mt-auto d-flex justify-content-between align-items-center">
                <div class="text-muted small">
                  <c:if test="${not empty p.category}">${p.category}</c:if>
                  <c:if test="${not empty p.createdAt}">
                    • <fmt:formatDate value="${p.createdAt}" pattern="dd/MM/yyyy"/>
                  </c:if>
                </div>
                <a href="news/detail?slug=${p.slug}" class="readmore">Xem thêm</a>
              </div>
            </div>
          </article>
        </div>
      </c:forEach>

      <!-- Fallback demo khi chưa có dữ liệu -->
      <c:if test="${empty posts}">
        <c:forEach begin="1" end="6" var="i">
          <div class="col-12 col-md-6 col-xl-4">
            <article class="post-card h-100 d-flex flex-column">
              <img class="post-thumb w-100" src="https://images.unsplash.com/photo-1542744173-8e7e53415bb0?q=80&w=900&auto=format&fit=crop" alt="Demo" />
              <div class="p-3 d-flex flex-column flex-grow-1">
                <h2 class="post-title h6 mb-1 text-uppercase">Bài viết demo ${i}</h2>
                <div class="post-excerpt small mb-3">Mô tả ngắn gọn cho bài viết demo – bạn thay bằng dữ liệu thật từ server.</div>
                <div class="mt-auto d-flex justify-content-between align-items-center">
                  <div class="text-muted small">Tin tức • 01/01/2025</div>
                  <a href="#" class="readmore">Xem thêm</a>
                </div>
              </div>
            </article>
          </div>
        </c:forEach>
      </c:if>
    </div>

    <!-- ===== Phân trang ===== -->
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
      <div class="text-center text-muted small mt-4">© <script>document.write(new Date().getFullYear())</script> Atino – Trang Tin Tức</div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>