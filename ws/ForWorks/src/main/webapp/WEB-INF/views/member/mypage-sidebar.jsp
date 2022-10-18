<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="" style="width: 260px; margin-right: 30px">
       <div class="card mb-4">
         <div class="card-body py-4 px-4">
           <div class="d-flex align-items-center">
             <div class="avatar avatar-xl">
               <img src="${root}/resources/img/member-imgs/user.png" alt="Face 1" />
             </div>
             <div class="ms-3 name">
               <h5 class="font-bold">John Duck</h5>
               <h6 class="text-muted mb-1">4조 주식회사</h6>
               <h6 class="text-muted mb-0">팀장</h6>
             </div>
           </div>
         </div>
       </div>
       <div class="card mb-4">
         <div class="card-header mt-1 py-3">
           <h4 class="mb-0">내 정보 관리</h4>
         </div>
         <div class="card-content">
           <div class="recent-message d-flex px-4 py-2">
             <div class="name ms-2">
                <a href="${root}/mypage">
               		<h6 class="mb-1">내 정보 조회</h6>
                </a>
             </div>
           </div>
           <div class="recent-message d-flex px-4 py-2">
             <div class="name ms-2">
             	<a href="${root}/mypage/account">
               		<h6 class="mb-1">급여계좌 설정</h6>
             	</a>
             </div>
           </div>
           <div class="recent-message d-flex px-4 py-2">
             <div class="name ms-2">
               <h6 class="mb-3">비밀번호 재설정</h6>
             </div>
           </div>
         </div>
       </div>
       <div class="card mb-4">
         <div class="card-header mt-1 py-3">
           <h4 class="mb-0">내 활동 바로가기</h4>
         </div>
         <div class="card-content">
           <div class="recent-message d-flex px-4 py-2">
             <div class="name ms-2">
               <h6 class="mb-1">근무내역조회</h6>
             </div>
           </div>
           <div class="recent-message d-flex px-4 py-2">
             <div class="name ms-2">
               <h6 class="mb-1">연차내역조회</h6>
             </div>
           </div>
           <div class="recent-message d-flex px-4 py-2">
             <div class="name ms-2">
               <h6 class="mb-3">급여현황조회</h6>
             </div>
           </div>
         </div>
       </div>
       <div class="card mb-4">
         <div class="card-content">
           <div class="px-4">
             <button class="btn btn-block font-bold mt-3 mb-3">
               <div>for-works와 함께한지</div>
               <div>100일</div>
             </button>
           </div>
         </div>
       </div>
     </div>