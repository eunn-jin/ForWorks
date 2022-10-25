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
                    <li class="breadcrumb-item"><a href="${root}/foradmin/member">구성원 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">구성원 조회</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title mb-0">전체 구성원</h4>
              </div>
              <div class="card-body">
				<div class="content-right" style="width: 100%">
              <div class="email-app-area">
                <!-- Email list Area -->
                <div class="email-app-list-wrapper">
                  <div class="email-app-list">
                    <div class="email-action">
                      <!-- action right start here -->
                      <div class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
                        <!-- search bar  -->
                        <div class="email-fixed-search flex-grow-1">
                          <div class="form-group position-relative mb-0 has-icon-left">
                            <input type="text" class="form-control" placeholder="검색 .." style="max-width: 600px" />
                            <div class="form-control-icon">
                              <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                <use xlink:href="${root}/resources/vendors/bootstrap-icons/bootstrap-icons.svg#search" />
                              </svg>
                            </div>
                          </div>
                        </div>
                        <!-- pagination and page count -->
                        <div class="d-flex pagination">
                        	<span class="d-none d-sm-block">1-15 of 653</span>
                        	<button class="btn btn-sm btn-outline-primary btn-icon email-pagination-prev d-none d-sm-block">&lt;</button>
                        	<button class="btn btn-sm btn-outline-primary btn-icon email-pagination-next d-none d-sm-block">&gt;</button>
                        </div>
                      </div>
                    </div>
                    <!-- / action right -->
                    <div class="card  mt-2">
                      <div class="card-body">
                        <table class="table" id="member-table">
                          <thead>
                            <tr>
                              <th>이름</th>
                              <th>직급</th>
                              <th>부서</th>
                              <th>전화번호</th>
                              <th>이메일</th>
                              <th>내선번호</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr data-bs-toggle="modal" data-bs-target="#modalMemberEdit">
                              <td>Graiden</td>
                              <td>Offenburg</td>
                              <td>Offenburg</td>
                              <td>076 4820 8838</td>
                              <td>vehicula.aliquet@semco.co.uk</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Graiden</td>
                              <td>New Quay</td>
                              <td>New Quay</td>
                              <td>0500 527693</td>
                              <td>fringilla.euismod.enim@quam.ca</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Graiden</td>
                              <td>GrumoAppula</td>
                              <td>GrumoAppula</td>
                              <td>(012165) 76278</td>
                              <td>mi.Duis@diam.edu</td>
                              <td>
                                <span class="badge bg-danger">Inactive</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Graiden</td>
                              <td>Ways</td>
                              <td>Ways</td>
                              <td>0309 690 7871</td>
                              <td>velit@nec.com</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Graiden</td>
                              <td>Rossignol</td>
                              <td>Rossignol</td>
                              <td>0500 441046</td>
                              <td>rhoncus.id@Aliquamau.net</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Kermit</td>
                              <td>Patna</td>
                              <td>Patna</td>
                              <td>(01653) 27844</td>
                              <td>diam.Sed.diam@anteViv.org</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Jermaine</td>
                              <td>Mold</td>
                              <td>Mold</td>
                              <td>0800 528324</td>
                              <td>sodales@nuncsit.org</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Ferdinand</td>
                              <td>Marlborough</td>
                              <td>Marlborough</td>
                              <td>(016977) 4107</td>
                              <td>gravida.molestie@tincidunt.org</td>
                              <td>
                                <span class="badge bg-danger">Inactive</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Kuame</td>
                              <td>Tresigallo</td>
                              <td>Tresigallo</td>
                              <td>(0151) 561 8896</td>
                              <td>Quisque.purus@mauris.org</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Deacon</td>
                              <td>Karapınar</td>
                              <td>Karapınar</td>
                              <td>07740 599321</td>
                              <td>Duis.a.mi@sociisnatoque.com</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Channing</td>
                              <td>Warrnambool</td>
                              <td>Warrnambool</td>
                              <td>0845 46 49</td>
                              <td>tempor.bibendum.Donec@ornarel.ca</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Aladdin</td>
                              <td>Bothey</td>
                              <td>Bothey</td>
                              <td>0800 1111</td>
                              <td>sem.ut@pellentesquea.ca</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Cruz</td>
                              <td>Shikarpur</td>
                              <td>Shikarpur</td>
                              <td>07624 944915</td>
                              <td>non@quisturpisvitae.ca</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Keegan</td>
                              <td>Assen</td>
                              <td>Assen</td>
                              <td>0800 200103</td>
                              <td>molestie.dapibus@condimentum.edu</td>
                              <td>
                                <span class="badge bg-success">Active</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Keegan</td>
                              <td>Assen</td>
                              <td>Assen</td>
                              <td>0800 200103</td>
                              <td>molestie.dapibus@condimentum.edu</td>
                              <td>
                                <span class="badge bg-success">Active</span>
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
  </script>
</html>
