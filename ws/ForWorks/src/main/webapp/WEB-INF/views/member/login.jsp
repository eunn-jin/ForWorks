<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>For-Works</title>
    <script src="https://kit.fontawesome.com/3a92c85ff9.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${root}/resources/css/common/bootstrap.css" />

    <link rel="stylesheet" href="${root}/resources/vendors/perfect-scrollbar/perfect-scrollbar.css" />
    <!-- <link rel="stylesheet" href="resources/vendors/bootstrap-icons/bootstrap-icons.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${root}/resources/css/common/app.css" />
    <link rel="stylesheet" href="${root}/resources/css/common.css" />

    <link rel="stylesheet" href="${root}/resources/css/member/login-style.css" />
    <style>
      body {
        background-color: #fff;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="form-container">
        <div class="signin">
          <form action="" class="signin-form">
            <h1 class="title">FOR-WORKS</h1>
            <h5 class="sub-title">업무도 내 회사 생활도 완벽하게</h5>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input name="" value="" type="text" placeholder="아이디" required />
            </div>
            <div class="input-field">
              <i class="fa-solid fa-shield-halved"></i>
              <input name="" type="password" placeholder="비밀번호" required />
            </div>
            <div class="login-info">
              <div class="save-id form-check form-switch">
                <input name="" id="saveCheck" class="form-check-input" type="checkbox" role="switch" checked />
                <label for="saveCheck" class="form-check-label">아이디 저장</label>
              </div>
              <div class="find-idpwd">
                <button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalSignin">아이디 찾기</button> |
                <button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#find-pwd-modal">비밀번호 찾기</button>
              </div>
            </div>
            <input type="submit" value="로그인" class="login-btn solid" />
          </form>
          <div class="media-panel">
            <span>지금 그룹에 참여해보세요! &nbsp; <a href="/ForWorks/join">회원가입</a></span>
          </div>
        </div>
      </div>
      <div class="panel-container">
        <div class="panel">
          <div class="content">
            <h3 style="color: #7d6cff">그룹에 참여해보세요!</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            <a href="/ForWorks/join" class="btn login-btn transparent" id="signup-btn">회원가입</a>
          </div>
          <img src="${root}/resources/img/member-imgs/undraw_remotely_-2-j6y.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <!-- 아이디 찾기 모달 -->
    <div class="modal fade" tabindex="1" id="modalSignin">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	   <div class="modal-content rounded-4 shadow">
	     <div class="modal-header p-5 pb-4 border-bottom-0">
	       <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
	        <h1 class="fw-bold mb-0 fs-2">아이디 찾기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <div class="modal-body p-5 pt-0">
	        <form class="">
	          <div class="form-floating mb-3">
	            <input type="email" class="form-control rounded-4" id="floatingInput" placeholder="name@example.com">
	            <label for="floatingInput">성명</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input type="password" class="form-control rounded-4" id="floatingPassword" placeholder="Password">
	            <label for="floatingPassword">이메일</label>
	          </div>
	          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="submit">아이디 찾기</button>
	          <hr class="my-4">
	          <small class="text-muted">아이디 : </small>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
    

    <!-- 비밀번호 찾기(변경) 모달-->
    <div
      class="modal fade"
      id="find-pwd-modal"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 변경</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="mb-1">
                <label for="recipient-name" class="col-form-label">아이디 :</label>
                <input type="text" class="form-control" id="recipient-name" />
              </div>
              <div class="mb-1">
                <label for="recipient-name" class="col-form-label">이름 :</label>
                <input type="text" class="form-control" id="recipient-name" />
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">이메일 :</label>
                <input type="text" class="form-control" id="recipient-name" />
              </div>
              <span>고민</span>
              <input style="float: right" type="submit" class="btn btn-primary" value="회원 확인" />
            </form>
            <br />
            <form>
              <div class="mb-1">
                <label for="message-text" class="col-form-label">새 비밀번호 :</label>
                <input type="password" class="form-control" id="message-text" />
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">새 비밀번호 확인 :</label>
                <input type="password" class="form-control" id="message-text" />
              </div>
              <input style="float: right" type="submit" class="btn btn-primary" value="비밀번호 변경" />
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
