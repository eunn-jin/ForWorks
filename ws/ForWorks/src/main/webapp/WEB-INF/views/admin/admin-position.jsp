<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>ForWorks Admin</title>
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
                <h3>기본 설정</h3>
                <p class="text-subtitle text-muted">기업의 직무/직급을 설정해보세요</p>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first p-4 pb-2">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${root}/foradmin/main">기본 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">직무/직급 설정</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">직무/직급 설정</h4>
              </div>
              <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                      <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">직무</a>
                      </li>
                      <li class="nav-item" role="presentation">
                        <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" tabindex="-1">직급</a>
                      </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                      <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <form action="${root}/foradmin/deptEdit" method="post">
                        <table id="deptTable" class="table table-lg mt-2">
                          <thead>
                            <tr class="deptView">
                              <th style="width: 40vw;">직무</th>
                              <th>
                              	<button type="button" id="editBtn" onclick="deptEdit();" class="btn btn-primary">수정하기</button>
                              </th>
                            </tr>
                            <tr class="deptEdit" style="display:none;">
                              <th style="width: 50vw;">직무</th>
                              <th>
                              	<button type="submit" id="saveBtn" class="btn btn-primary">완료</button>
                              </th>
                             </tr>
                          </thead>
                          <tbody>
                          	<c:forEach items="${deptList}" var="dl">
	                            <tr class="deptView">
	                              <td style="width: 40vw;">${dl.deptName}</td>
	                              <td></td>
	                            </tr>
                          	</c:forEach>
                          	<c:forEach items="${deptList}" var="dl">
	                            <tr class="deptEdit" style="display:none;">
	                              <td style="width: 50vw; display:none"><input name="dept[${dl.deptNo}].deptNo" value="${dl.deptNo}" class="form-control form-control-sm" style="width: 200px;"></td>
	                              <td style="width: 50vw;"><input name="dept[${dl.deptNo}].deptName" value="${dl.deptName}" class="form-control form-control-sm" style="width: 200px;"></td>
	                              <td class="text-center"><a style="color: red;">삭제</a></td>
	                            </tr>
                          	</c:forEach>
                          	<tr class="deptEdit" style="display:none; border-bottom: 1px solid white">
                          		<td style="width: 60vw;" class="text-center h6 text-muted"><a onclick="addTr(this);">추가</a></td>
                          		<td></td>
                          	</tr>
                          </tbody>
                        </table>
                        </form>
                      </div>
                      </div>
                      <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                      	<form action="${root}/foradmin/posEdit" method="post">
                        <table id="posTable" class="table table-lg mt-2">
                          <thead>
                            <tr class="posView">
                              <th style="width: 40vw;">직급</th>
                              <th>
                              	<button type="button" id="editBtn" onclick="posEdit();" class="btn btn-primary">수정하기</button>
                              </th>
                            </tr>
                            <tr class="posEdit" style="display:none;">
                              <th><i class="bi bi-filter-left"></i></th>
                              <th style="width: 50vw;">직급</th>
                              <th>
                              	<button type="submit" id="saveBtn" class="btn btn-primary">완료</button>
                              </th>
                             </tr>
                          </thead>
                          <tbody>
                          	<c:forEach items="${posList}" var="pl">
	                            <tr class="posView">
	                              <td style="width: 40vw;">${pl.posName}</td>
	                              <td></td>
	                            </tr>
                          	</c:forEach>
                          	<c:forEach items="${posList}" var="pl" varStatus="status">
	                            <tr class="posEdit" style="display:none;">
	                              <td><input class="form-control form-control-sm" style="width: 200px;"></td>
	                              <td><i class="bi bi-three-dots-vertical"></i></td>
	                              <td style="width: 50vw;"><input name="pos" value="${pl.posName}" class="form-control form-control-sm" style="width: 200px;"></td>
	                              <td class="text-center"><a style="color: red;">삭제</a></td>
	                            </tr>
                          	</c:forEach>
                          	<tr class="posEdit" style="display:none; border-bottom: 1px solid white">
                          		<td></td>
                          		<td style="width: 60vw;" class="text-center h6 text-muted"><a onclick="addTr(this);">추가</a></td>
                          		<td></td>
                          	</tr>
                          </tbody>
                        </table>
                        </form>
                      </div>
                    </div>
                  </div>
          </section>
        </div>
      </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
  </body>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>
  <script>
  	function deptEdit() {
      const deptView = document.getElementsByClassName("deptView");
      const deptEdit = document.getElementsByClassName("deptEdit");
      
      for(var i = 0; i < deptView.length; i++) {
        var deptViewTr = deptView.item(i);
        deptViewTr.style.display = "none";
      }

      for(var i = 0; i < deptEdit.length; i++) {
        var deptEditTr = deptEdit.item(i);
        deptEditTr.style.display = "block";
      }
  	}
  	
  	function posEdit() {
   	  $("#posTable").tableDnD();
       
       const posView = document.getElementsByClassName("posView");
       const posEdit = document.getElementsByClassName("posEdit");
       
       for(var i = 0; i < posView.length; i++) {
         var posViewTr = posView.item(i);
         posViewTr.style.display = "none";
       }

       for(var i = 0; i < posEdit.length; i++) {
         var posEditTr = posEdit.item(i);
         posEditTr.style.display = "block";
       }
   	}
  </script>
</html>
