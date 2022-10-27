<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ForWorks Admin</title>

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
                    <li class="breadcrumb-item"><a href="${root}/foradmin/member/1">구성원 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">구성원 조회</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card" style="min-height: 700px;">
              <div class="card-header m-0 p-4 pt-3">
                	<div class="mt-4">
                		<h5>구성원 조회</h5>
                	</div>
                   	<div class="d-flex align-items-center justify-content-between">
                   		<!-- search bar  -->
                        <div class="email-fixed-search flex-grow-1 mt-2">
                          <div class="form-group position-relative mb-0 has-icon-left">
                            <input name="keyword" type="text" class="form-control" placeholder="이름 또는 연락처 검색" style="max-width: 600px; width: 60%" />
                            <div class="form-control-icon">
                              <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                <use xlink:href="${root}/resources/vendors/bootstrap-icons/bootstrap-icons.svg#search" />
                              </svg>
                            </div>
                          </div>
                        </div>
                   		<!-- pagination and page count -->
                   		<div class="d-flex align-items-center">
                   			<c:choose>
                    			<c:when test="${(pv.currentPage eq pv.maxPage) or (pv.listCount lt 10)}">
                        <span class="d-none d-sm-block" style="margin: 0 10px">${pv.currentPage*pv.boardLimit - (pv.boardLimit-1)}-${pv.listCount} of ${pv.listCount}</span>
                    			</c:when>
                    			<c:otherwise>
                        <span class="d-none d-sm-block" style="margin: 0 10px">${pv.currentPage*pv.boardLimit - (pv.boardLimit-1)}-${pv.currentPage * pv.boardLimit} of ${pv.listCount}</span>
                    			</c:otherwise>
                   			</c:choose>
                     	<c:if test="${pv.currentPage ne 1}">
                       <a href="${root}/foradmin/member/${(pv.currentPage) - 1}" class="btn btn-sm btn-outline-primary btn-icon email-pagination-prev d-none d-sm-block" style="margin-right: 5px">&lt;</a>
                     	</c:if>
                     	<c:if test="${pv.currentPage ne pv.maxPage}">
                      	<a href="${root}/foradmin/member/${(pv.currentPage) + 1}" class="btn btn-sm btn-outline-primary btn-icon email-pagination-next d-none d-sm-block"style="margin-right: 5px">&gt;</a>
                     	</c:if>
                  	</div>
                  </div>
               	</div>
                   <div class="card-body" style="padding-left: 20px">
                 <div>
                         <table class="table" id="member-table" style="text-align: center">
                           <thead>
                             <tr>
                               <th></th>
                               <th>
                               	<c:choose>
                               		<c:when test="${addressParam.order eq 'desc'}">
	                        			<a href="${root}/foradmin/member/1?sort=name&order=asc">이름</a>
                                 		<svg id="orderUpIcon" class="mb-1" width="0.8em" height="0.8em">
	                            			<use xlink:href="${root}/resources/vendors/bootstrap-icons/bootstrap-icons.svg#arrow-up"></use>
	                        			</svg>
                               		</c:when>
                               		<c:otherwise>
                                 		<a href="${root}/foradmin/member/1?sort=name&order=desc">이름</a>
	                                 	<svg id="orderDownIcon" class="mb-1" width="0.8em" height="0.8em">
				                            <use xlink:href="${root}/resources/vendors/bootstrap-icons/bootstrap-icons.svg#arrow-down"></use>
				                        </svg>
                               		</c:otherwise>
                               	</c:choose>
                               </th>
                               <th>부서</th>
                               <th>직급</th>
                               <th>전화번호</th>
                               <th>이메일</th>
                               <th>내선번호</th>
                             </tr>
                           </thead>
                           <tbody>
                             	<c:forEach items="${memberList}" var="l">
	                              <tr id="emp${l.empNo}" onclick="EditMemberPopup(this)" style="height: 50px">
	                              	<td></td>
	                              	<td style="display:none">${l.empNo}</td>
	                                <td>${l.empName}</td>
	                                <td>${l.deptName}</td>
	                                <td>${l.posName}</td>
	                                <td>${l.empPhone}</td>
	                                <td>${l.empEmail}</td>
	                                <td>${l.empExphone}</td>
	                              </tr>
                             	</c:forEach>
                           </tbody>
                         </table>
                         </div>
                     </div>
            </div>
          </section>
        </div>
      </div>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    
    <!-- 구성원 정보수정 모달 -->
    <div class="modal fade" tabindex="1" id="modalMemberEdit">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	   <div class="modal-content rounded-4 shadow">
	     <div class="modal-header p-5 pb-4 border-bottom-0">
	       <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
	        <h1 class="fw-bold mb-0 fs-2">구성원 정보 수정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <div class="modal-body p-5 pt-0">
	        <form action="${root}/admin/member/edit" method="post">
	          <input type="hidden" class="form-control rounded-4" id="emp_no">
	          <div class="form-floating mb-3">
	            <input type="text" class="form-control rounded-4" id="emp_name">
	            <label for="emp_name">성명</label>
	          </div>
	          <div class="form-floating mb-3">
	          	<select class="form-control rounded-4" id="emp_pos">
	            	<option selected="selected">개발부</option>
	            </select>
	            <label for="emp_pos">직무</label>
	          </div>
	          <div class="form-floating mb-3">
	            <select class="form-control rounded-4" id="emp_dept">
	            	<option selected="selected">과장</option>
	            </select>
	            <label for="emp_dept">직급</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="100000000" type="number" class="form-control rounded-4" id="emp_money">
	            <label for="emp_money">연봉</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="9999" type="text" class="form-control rounded-4" id="emp_exphone">
	            <label for="emp_exphone">내선번호</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="2022-11-14" type="text" class="form-control rounded-4" id="emp_jdate">
	            <label for="emp_jdate">입사일</label>
	          </div>
	          <div class="form-floating mb-3">
	            <input value="" type="date" class="form-control rounded-4" id="emp_rdate">
	            <label for="emp_rdate">퇴사일</label>
	          </div>
	          <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="submit">변경하기</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
  </body>
  <script>
	  	function searchKeyword() {
			const keyword = document.querySelector("input[name=keyword]").value;
			location.href = "${root}/foradmin/member/1?keyword=" + keyword;
		}
	  	
	  	function EditMemberPopup(clicked_tr) {
			var row_td = clicked_tr.getElementsByTagName("td");
			
			document.getElementById("emp_no").value = row_td[0].innerHTML;   
			document.getElementById("emp_name").value = row_td[1].innerHTML;   
			document.getElementById("emp_dept").value = row_td[2].innerHTML;
			document.getElementById("emp_pos").value = row_td[3].innerHTML;   
			document.getElementById("emp_phone").value = row_td[4].innerHTML;   
			document.getElementById("emp_email").value = row_td[5].innerHTML;
			document.getElementById("emp_").value = row_td[6].innerHTML;
			
			$('#modalMemberEdit').modal('show');
		}
  </script>
</html>
