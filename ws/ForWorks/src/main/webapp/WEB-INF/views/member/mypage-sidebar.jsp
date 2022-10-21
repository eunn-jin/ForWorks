<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="" style="width: 260px; margin-right: 30px">
       <div class="card mb-4">
         <div class="card-body py-4 px-4">
           <div class="d-flex align-items-center">
             <div class="avatar avatar-xl">
               <img src="${root}/resources/img/member-imgs/user.png" alt="Face 1" />
             </div>
             <div class="ms-3 name">
               <h5 class="font-bold">${loginMember.empName}</h5>
               <h6 class="text-muted mb-1">4조 주식회사</h6>
               <h6 class="text-muted mb-0">${loginMember.posName}</h6>
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
             	<a data-bs-toggle="modal" data-bs-target="#modalPwdEdit">
               		<h6 class="mb-3">비밀번호 재설정</h6>
               	</a>
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
     
     <!-- 비밀전호 재설정 모달 -->
    <div class="modal fade" tabindex="1" id="modalPwdEdit">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	   <div class="modal-content rounded-4 shadow">
	     <div class="modal-header p-5 pb-4 border-bottom-0">
	       <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
	        <h1 class="fw-bold mb-0 fs-2">비밀번호 변경</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <div class="modal-body p-5 pt-0">
	        <form class="">
	          <div class="form-floating mb-3">
	            <input name="nowPwd" type="password" class="form-control rounded-4" id=nowPwd">
	            <label for="floatingInput">현재 비밀번호</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input name="empPwd" type="password" class="form-control rounded-4" id="changePwd">
	            <label for="floatingPassword">새 비밀번호</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input name="empPwd2" type="password" class="form-control rounded-4" id="changePwd2">
	            <label for="floatingPassword">새 비밀번호 확인</label>
	          </div>
	          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="button" onclick="changePwd();">비밀번호 변경</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
      //비밀번호 재설정
      function changePwd() {
        const nowPwd = document.querySelector("#nowPwd").value;
        const empPwd = document.querySelector("#changePwd").value;
        const empPwd2 = document.querySelector("#changePwd2").value;
		
        console.log("버튼")
        
        $.ajax({
          url: "${root}/changePwd",
          type: "post",
          data: {
        	nowPwd: nowPwd,
        	empPwd: empPwd,
          },
          success: function (data) {
            if (data == 1) {
            	alert("패스워드 변경에 성공했습니다.")
            } else {
            	alert("패스워드 변경에 실패했습니다.")
            }
          },
          error: function (e) {
            alert("통신에 실패했습니다.");
          },
        });
      };
    </script>