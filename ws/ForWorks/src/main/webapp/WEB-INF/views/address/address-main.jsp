<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForWorks</title>

<link rel="stylesheet" href="${root}/resources/css/address/email.css">
    
<link rel="stylesheet" href="${root}/resources/css/address/address-style.css">
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
  </style>
</head>
<body>
	<div id="app">

	<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

	<div id="main">
           <%@ include file="/WEB-INF/views/common/header.jsp" %>

               <div class="page-title">
                   <div class="row">
                       <div class="col-12 col-md-6 order-md-1 order-last">
                           <h3>주소록</h3>
                       </div>
                   </div>
               </div>
            
 
               <div class="address-navbar">
                   <div class="search-bar">
                        <div class="search-input-field">    
                            <img alt="" src="${root}/resources/img/member-imgs/free-icon-search-7233469.png">
                            <input type="text" class="">
                        </div>
                        <button class="nav-btn">검색</button>
                    </div>
                    <div class="status-outer">
                        <div class="status-img-outer">
                            <img alt="" src="${root}/resources/img/member-imgs/free-icon-loading-8590157.png">
                        </div>
                        <div class="status-content">
                            <span>상태</span>
                            <select name="empStatus" id="" class="form-select form-select-sm">
                                <option value="1">알수없음</option>
                                <option value="2">자리</option>
                                <option value="3">자리비움</option>
                                <option value="4">식사</option>
                                <option value="5">응답불가</option>
                            </select>
                        </div>
                        <button class="nav-btn" type="button" onclick="statusEdit();">등록</button>
                    </div>
                </div>

               <section class="section address-field">
                    <div class="card left-field mb-0" style="min-width: 90px">
                        <div class="card-body">
                            <div class="page-field">
                            	<a href="">
	                                <img alt="" src="${root}/resources/img/member-imgs/free-icon-company-4091968.png">
	                                <span>조직</span>
                            	</a>
                            </div>
                            <div class="page-field">
                            	<a href="">
                                	<img alt="" src="${root}/resources/img/member-imgs/favourite.png">
                                	<span>중요</span>
                                </a>
                            </div>
                            <div class="page-field">
                            	<a href="">
	                                <img alt="" src="${root}/resources/img/member-imgs/free-icon-intermediary-4968522.png">
	                                <span>부서</span>
                                </a>
                            </div>
                            <div class="page-field">
                            	<a href="">
	                               	<img alt="" src="${root}/resources/img/member-imgs/free-icon-park-6800868.png">
	                                <span>외부</span>
                               </a>
                            </div>
                        </div>
                    </div>
                    <div class="card right-field" style="overflow:auto;">
                    	<div class="card-header m-0 p-4 pt-3">
                        	<div class="d-flex align-items-center justify-content-between">
                        		<div class="mt-3">
                        			<h5>전체 주소록</h5>
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
				                        <a href="${root}/address/${(pv.currentPage) - 1}" class="btn btn-sm btn-outline-primary btn-icon email-pagination-prev d-none d-sm-block" style="margin-right: 5px">&lt;</a>
		                        	</c:if>
		                        	<c:if test="${pv.currentPage ne pv.maxPage}">
			                        	<a href="${root}/address/${(pv.currentPage) + 1}" class="btn btn-sm btn-outline-primary btn-icon email-pagination-next d-none d-sm-block"style="margin-right: 5px">&gt;</a>
		                        	</c:if>
			                    </div>
		                    </div>
                    	</div>
                        <div class="card-body" style="padding-left: 20px">
		                    <div>
                              <table class="table" id="table1" style="text-align: center">
                                <thead>
                                  <tr>
                                    <th></th>
                                    <th></th>
                                    <th>
                                    	<a href="${root}/address/1?sortType=name&sortOrder=desc">이름</a>
                                    	<svg id="orderIcon" class="bi" width="1em" height="1em">
				                            <use xlink:href="${root}/resources/vendors/bootstrap-icons/bootstrap-icons.svg#arrow-down"></use>
				                        </svg>
                                    </th>
                                    <th>직급</th>
                                    <th>부서</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>내선번호</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  	<c:forEach items="${addressList}" var="l">
	                                  <tr>
	                                    <td>
	                                    	<c:choose>
		                                    	<c:when test="${not empty l.bmEmpNo}">
		                                      	  <input type="checkbox" class="star" value="${l.empNo}" checked />
		                                    	</c:when>
		                                    	<c:otherwise>
			                                      <input type="checkbox" class="star" value="${l.empNo}"/>
		                                    	</c:otherwise>
	                                    	</c:choose>
	                                    </td>
	                                    <td>
	                                      <div class="avatar">
	                                      	<c:choose>
	                                      		<c:when test="${not empty l.empProfile}">
	                                       	 		<img src="${root}/resources/img/member-imgs/user.png" alt="img" />
	                                      		</c:when>
	                                      		<c:otherwise>
	                                       	 		<img src="${root}/resources/img/member-imgs/user.png" alt="img" />
	                                      		</c:otherwise>
	                                      	</c:choose>
	                                      	<c:choose>
	                                      		<c:when test="${l.statNo eq 2}">
			                                        <span class="avatar-status bg-success"></span>
	                                      		</c:when>
	                                      		<c:when test="${l.statNo eq 5}">
			                                        <span class="avatar-status bg-danger"></span>
	                                      		</c:when>
	                                      		<c:when test="${l.statNo eq 3 or l.statNo eq 4}">
			                                        <span class="avatar-status bg-warning"></span>
	                                      		</c:when>
	                                      		<c:otherwise>
			                                        <span class="avatar-status bg-secondary"></span>
	                                      		</c:otherwise>
	                                      	</c:choose>
	                                      </div>
	                                    </td>
	                                    <td>${l.empName}</td>
	                                    <td>${l.posName}</td>
	                                    <td>${l.deptName}</td>
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
                    </div>
               </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>
</body>
</html>