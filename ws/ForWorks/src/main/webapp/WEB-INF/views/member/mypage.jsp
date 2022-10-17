<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page session="false" %>
<html>
  <head>
    <title>Home</title>
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
              <div class="" style="width: 300px; margin-right: 30px">
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
                        <h6 class="mb-1">내 정보 조회</h6>
                      </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-2">
                      <div class="name ms-2">
                        <h6 class="mb-1">급여계좌 설정</h6>
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
              <div class="card" style="width: calc(100% - 350px)">
                <div class="card-header mt-1">
                  <h4>내 정보 조회</h4>
                </div>
                <div class="card-body">
                      <form class="form" data-parsley-validate>
                        <div class="row">
                          <div class="col-md-6 col-12">
                            <div class="form-group mandatory">
                              <label for="first-name-column" class="form-label"
                                >이메일</label
                              >
                              <input
                                type="text"
                                id="first-name-column"
                                class="form-control"
                                name="fname-column"
                                data-parsley-required="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-6 col-12">
                            <div class="form-group mandatory">
                              <label for="email-id-column" class="form-label"
                                >휴대전화</label
                              >
                              <input
                                type="email"
                                id="email-id-column"
                                class="form-control"
                                name="email-id-column"
                                data-parsley-required="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-6 col-12">
                          	<label for="sample6_postcode" class="form-label">주소</label>
				            <div class="col-12">
				              <input class="form-control" type="text" id="sample6_postcode" placeholder="우편번호" required />
				              <input class="btn btn-primary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" />
				              <input class="form-control" type="text" id="sample6_address" placeholder="주소" required />
				              <input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소" required />
				              <input class="form-control" type="text" id="sample6_extraAddress" placeholder="참고항목" />
				            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-12 d-flex justify-content-end">
                            <button
                              type="submit"
                              class="btn btn-primary me-1 mb-1"
                            >
                              Submit
                            </button>
                            <button
                              type="reset"
                              class="btn btn-light-secondary me-1 mb-1"
                            >
                              Reset
                            </button>
                          </div>
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
  </script>
<script src="${root}/resources/js/member/parsley.min.js"></script>
<script src="${root}/resources/js/member/parsley.js"></script>
</html>
