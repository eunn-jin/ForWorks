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
                    <li class="breadcrumb-item"><a href="${root}/admin/approval">구성원 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">구성원 조회</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title mb-0">전체 구성원 조회</h4>
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
                    <div class="card">
                      <div class="card-body pt-2">
                        <table class="table" id="table1">
                          <thead>
                            <tr>
                              <th></th>
                              <th></th>
                              <th>이름</th>
                              <th>직급</th>
                              <th>부서</th>
                              <th>전화번호</th>
                              <th>이메일</th>
                              <th>내선번호</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <input type="checkbox" class="star" checked />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-warning"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-secondary"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-warning"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
                              <td>
                                <input type="checkbox" class="star" />
                              </td>
                              <td>
                                <div class="avatar">
                                  <img src="${root}/resources/img/member-imgs/user.png" alt="img" />
                                  <span class="avatar-status bg-success"></span>
                                </div>
                              </td>
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
  </body>
  <script>
    $().ready(function () {
      console.log("test:");
      $("#ex1").addClass("active");
    });
  </script>
</html>
