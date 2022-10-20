<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false" %>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ForWorks</title>

    <link rel="stylesheet" href="${root}/resources/css/address/email.css" />
    <link rel="stylesheet" href="${root}/resources/css/address/style.css" />
    <script src="https://kit.fontawesome.com/3a92c85ff9.js" crossorigin="anonymous"></script>
    <style>
      .star {
        visibility: hidden;
        cursor: pointer;
      }
      .star:before {
        content: "\f005";
        font-family: FontAwesome;
        color: #ccc;
        position: absolute;
        visibility: visible;
      }
      .star:checked:before {
        content: "\f005";
        color: #ffc107;
        font-family: FontAwesome;
        position: absolute;
      }
      
      .pagination span, .pagination button {
      	margin: 0 5px;
      }
      
      #member-table tbody > tr:hover {
      	background-color: #eeeeee;
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
                <h3>구성원 설정</h3>
                <p class="text-subtitle text-muted p-1">조직 구성원을 관리해보세요</p>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first p-4 pb-2">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${root}/admin/member">구성원 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">구성원 승인</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title mb-0">구성원 승인 요청</h4>
              </div>
              <div class="card-body">
				<div class="content-right" style="width: 100%">
              <div class="email-app-area">
                <!-- Email list Area -->
                <div class="email-app-list-wrapper">
                    <div class="card">
                      <div class="card-body pt-2">
                        <table class="table" id="member-table">
                          <thead>
                            <tr>	
                              <th>번호</th>
                              <th>이름</th>
                              <th>주민번호</th>
                              <th>휴대전화</th>
                              <th></th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr data-bs-toggle="modal" data-bs-target="#modalMemberEdit">
                              <td>1</td>
                              <td>Graiden</td>
                              <td>076 4820 8838</td>
                              <td>076 4820 8838</td>
                              <td>
                                <button class="btn btn-sm btn-success">추가 정보 입력</button>
                                <button class="btn btn-sm btn-secondary">거절</button>
                              </td>
                            </tr>
                            <tr>
                              <td>2</td>
                              <td>Graiden</td>
                              <td>0500 527693</td>
                              <td>0500 527693</td>
                              <td>
                                <button class="btn btn-sm btn-success">추가 정보 입력</button>
                                <button class="btn btn-sm btn-secondary">거절</button>
                              </td>
                            </tr>
                            
                          </tbody>
                        </table>
                      </div>
                  </div>
                  </div>
              </div>
            </div>
			</div>
            </div>
          </section>
        </div>
      </div>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
    <!-- 구성원 정보입력 모달 -->
    <div class="modal fade" tabindex="1" id="modalMemberEdit">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	   <div class="modal-content rounded-4 shadow">
	     <div class="modal-header p-5 pb-4 border-bottom-0">
	       <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
	        <h1 class="fw-bold mb-0 fs-2">구성원 정보 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <div class="modal-body p-5 pt-0">
	        <form class="">
	          <div class="form-floating mb-3">
	            <input value="홍길동" type="text" class="form-control rounded-4" id="floatingInput" placeholder="성명">
	            <label for="floatingInput">성명</label>
	          </div>
	          <div class="form-floating mb-3">
	          	<select class="form-control rounded-4" id="floatingInput" placeholder="직무">
	            	<option selected="selected">과장</option>
	            </select>
	            <label for="floatingPassword">직급</label>
	          </div>
	          <div class="form-floating mb-3">
	            <select class="form-control rounded-4" id="floatingInput" placeholder="직무">
	            	<option selected="selected">개발부</option>
	            </select>
	            <label for="floatingPassword">직무</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="100000000" type="number" class="form-control rounded-4" id="floatingInput" placeholder="연봉">
	            <label for="floatingPassword">연봉</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="9999" type="text" class="form-control rounded-4" id="floatingInput" placeholder="내선번호">
	            <label for="floatingPassword">내선번호</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="2022-11-14" type="text" class="form-control rounded-4" id="floatingInput" placeholder="입사일">
	            <label for="floatingPassword">입사일</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="" type="date" class="form-control rounded-4" id="floatingInput" placeholder="퇴사일">
	            <label for="floatingPassword">퇴사일</label>
	          </div>
	          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="submit">변경하기</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
  </body>
  <script>
    $().ready(function () {
      console.log("test:");
      $("#ex1").addClass("active");
    });
  </script>
</html>
