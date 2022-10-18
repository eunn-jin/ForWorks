<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header style="width: 100%">
  <nav class="navbar navbar-expand navbar-light navbar-top pt-4" style="padding-left: 0; padding-right: 0">
    <div class="container-fluid" style="padding-left: 0">
      <a href="#" class="burger-btn d-block gray">
        <i class="bi bi-justify fs-3"></i>
      </a>

      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-lg-0">
        </ul>
        <div class="dropdown pt-3">
          <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
            <div class="user-menu d-flex">
              <div class="user-name text-end me-3">
                <h6 class="mb-0 text-gray-600">John Ducky</h6>
                <p class="mb-0 text-sm text-gray-600">최고 관리자</p>
              </div>
              <div class="user-img d-flex align-items-center">
                <div class="avatar avatar-md">
                  <img src="${root}/resources/img/member-imgs/user.png" />
                </div>
              </div>
            </div>
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton" style="min-width: 11rem">
            <li>
              <h6 class="dropdown-header">Hello, John!</h6>
            </li>
            <li>
              <a class="dropdown-item" href="${root}"><i class="icon-mid bi bi-wallet me-2"></i> 관리메뉴 나가기</a>
            </li>
            <li>
              <hr class="dropdown-divider" />
            </li>
            <li>
              <a class="dropdown-item" href="#"><i class="icon-mid bi bi-box-arrow-left me-2"></i> 로그아웃</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</header>