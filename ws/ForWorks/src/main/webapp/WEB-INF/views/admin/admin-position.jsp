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
                <p class="text-subtitle text-muted">기업의 직무를 확인하세요</p>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first p-4 pb-2">
                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${root}/foradmin/main">기본 설정</a></li>
                    <li class="breadcrumb-item active" aria-current="page">직무 설정</li>
                  </ol>
                </nav>
              </div>
            </div>
          </div>
          <section class="section">
            <div class="card">
              <div class="card-header pb-0">
                <h4 class="card-title">직무 설정</h4>
              </div>
              <div class="card-body">
                       <form action="${root}/foradmin/deptEdit" method="post">
                       <table id="deptTable" class="table table-lg mt-2">
                         <thead>
                           <tr class="deptView">
                             <th style="width: 40vw;">직무</th>
                             <th class="d-flex" style="justify-content: flex-end;">
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
                         	<tr class="deptEdit" style="display:none">
                         	  <td style="width: 50vw; display:none"><input name="" class="form-control form-control-sm" style="width: 200px;"></td>
                              <td style="width: 50vw;"><input name="" class="form-control form-control-sm" style="width: 200px;"></td>
                              <td class="text-center"><a style="color: red;">삭제</a></td>
                         	</tr>
                         </tbody>
                       </table>
                       <div class="deptEdit" style="display:none; text-align: center; width: 50vw;">
                       		<button type="button" class="btn btn-sm" onclick="addTr();" style="margin-left:50px; font-weight: 600">추가</button>
                       </div>
                       </form>
                    </div>
               </div>
          </section>
        </div>
      </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   </div>
  </body>
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
  	
  	function addTr() {
  		console.log("adTr");
  		$("#deptTable>tbody").append('<tr class="deptEdit" style="width: 50vw;"><td style="display:none"></td><td style="width: 50vw;"><input name="" class="form-control form-control-sm m-0" style="width: 200px;"></td><td class="text-center"><a style="color: red;">삭제</a></td></tr>');
  	}
  	
  	function deptDelete() {
  		
  	}
  </script>
</html>
