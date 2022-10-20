<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false" %>
<html>
  <head>
    <title>ForWorks Admin</title>
    <style>
    	#sidebarMenu div {
    		border-right: 1px solid #ccc;
    		min-height: 600px;
    	}
    </style>
  </head>
  <body>
    <div id="app">
      <%@ include file="/WEB-INF/views/admin/admin-sidebar.jsp" %>

      <div id="main" class="pt-0">
        <%@ include file="/WEB-INF/views/admin/admin-header.jsp" %>
        
        <div class="page-heading">
          <div class="page-title">
            <div class="row">
              <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>관리자 설정</h3>
                <p class="text-subtitle text-muted">그룹 관리자를 지정해보세요</p>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first p-4 pb-2">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${root}/admin/operator">관리자 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">권한 설정</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">권한 설정</h4>
              </div>
              <div class="card-body row">
              	<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
			      <div class="position-sticky sidebar-sticky">
			        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 pt-2 mt-3 mb-4">
			          <strong>관리자 목록</strong>
			          <a class="link-secondary" href="#" aria-label="Add a new report">
			          	<svg class="align-text-bottom" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle align-text-bottom" aria-hidden="true">
				          	<circle cx="12" cy="12" r="10"></circle>
				          	<line x1="12" y1="8" x2="12" y2="16"></line>
				          	<line x1="8" y1="12" x2="16" y2="12"></line>
			          	</svg>
			          </a>
			        </h6>
			        <ul class="nav flex-column mb-2" style="font-size: 15px;">
			          <li class="nav-item">
			            <a class="nav-link" href="#">
			              <strong>최고관리자</strong>
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link text-muted" href="#">
			              부관리자
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link text-muted" href="#">
			              예약관리자
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link text-muted" href="#">
			              게시판관리자
			            </a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link text-muted" href="#">
			              결재문서관리자
			            </a>
			          </li>
			        </ul>
			      </div>
			    </nav>
              	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			        <h4>최고관리자</h4>
			        <div class="btn-toolbar mb-2 mb-md-0">
			          <button type="button" class="btn btn-sm btn-outline-secondary">
			            관리자 이전
			          </button>
			        </div>
			      </div>
			        <div class="my-3 p-3 rounded shadow-sm">
					    <div class="d-flex pt-3">
					      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
					        <div class="d-flex justify-content-between">
					          <strong class="text-gray-dark">홍길동</strong>
					          <a href="#" style="color:red">삭제</a>
					        </div>
					        <span class="d-block pt-1">개발부 과장</span>
					      </div>
					    </div>
					    <small class="d-block text-end mt-3">
					      <a href="#">All suggestions</a>
					    </small>
					  </div>
			    </main>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  </body>
  <script>
    $().ready(function () {
      console.log("test:");
      $("#ex1").addClass("active");
    });
  </script>
</html>
