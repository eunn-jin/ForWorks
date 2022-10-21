<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html>
  <head>
    <title>ForWorks</title>
  </head>
  <body>
    <div id="app">
      <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

      <div id="main">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="page-heading">
          <div class="page-title">
            <div class="row">
              <div class="col-12 col-md-6 order-md-1 order-last mt-2 mb-4">
                <h3>마이페이지</h3>
              </div>
            </div>
          </div>
          <div class="page-content">
            <section class="section d-flex">
              <%@ include file="/WEB-INF/views/member/mypage-sidebar.jsp" %>
              <div class="card" style="width: calc(100% - 300px); min-width: 300px">
                <div class="card-header mt-1">
                  <h4>급여계좌 설정</h4>
                </div>
                <div class="card-body">
                  <form action="" method="post">
                    <label class="text-muted mb-2" style="font-weight: 600">은행명</label>
                    <div class="input-group mb-3">
                      <button type="button" class="input-group-text" for="" id="selboxBtn">직접입력</button>
                      <button type="button" id="selboxResetBtn" class="input-group-text" for="" id="selboxBtn">은행선택</button>
                      <select name="empBank" class="form-select" id="selbox" size="5">
                        <option value="농협">농협</option>
                        <option value="신한">신한</option>
                        <option value="IBK기업">IBK기업</option>
                        <option value="하나">하나</option>
                        <option value="우리">우리</option>
                        <option value="국민">국민</option>
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="토스뱅크">토스뱅크</option>
                        <option value="케이뱅크">케이뱅크</option>
                        <option value="산업">산업</option>
                        <option value="수협">수협</option>
                        <option value="씨티">씨티</option>
                      </select>
                      <input name="empBank" value="${loginMember.empBank}" type="text" id="selboxDirect" class="form-control" placeholder="은행명을 입력하세요"/>
                    </div>
                    <div class="form-group">
                      <label class="text-muted mb-2" for="basicInput">계좌번호</label>
                      <input name="empAccount" value="${loginMember.empAccount}" type="text" class="form-control" id="basicInput" placeholder="계좌번호를 입력해주세요" required/>
                    </div>
                    <div class="col-12 d-flex justify-content-end">
                      <button type="submit" class="btn btn-primary me-1 mb-1">변경</button>
                      <button type="reset" class="btn btn-light-secondary me-1 mb-1">모두 지우기</button>
                    </div>
                  </form>
                </div>
              </div>
            </section>
          </div>
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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript">
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function (data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ""; // 주소 변수
          var extraAddr = ""; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === "R") {
            // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          } else {
            // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if (data.userSelectedType === "R") {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
              extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== "" && data.apartment === "Y") {
              extraAddr += extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== "") {
              extraAddr = " (" + extraAddr + ")";
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("sample6_extraAddress").value = extraAddr;
          } else {
            document.getElementById("sample6_extraAddress").value = "";
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById("sample6_postcode").value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
        },
      }).open();
    }

    $(function () {
      //직접입력 인풋박스 기존에는 숨어있다가
      $("#selboxDirect").hide();
      $("#selboxResetBtn").hide();

      $("#selboxBtn").click(function () {
        //직접입력을 누를 때 나타남
        $("#selbox").hide();
        $("#selboxBtn").hide();
        $("#selboxDirect").show();
        $("#selboxResetBtn").show();
      });
      
      $("#selboxResetBtn").click(function () {
        //직접입력을 누를 때 나타남
        $("#selboxDirect").hide();
        $("#selboxResetBtn").hide();
        $("#selbox").show();
        $("#selboxBtn").show();
      });
    });
  </script>
</html>
