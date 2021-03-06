<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<c:import url="../structure/head.jsp" />
<style type="text/css">
body {
	padding-top: 60px;
}

form>div {
	margin: 15px 0;
}
</style>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.11.1/validate.min.js"></script> -->
<body>
	<br>
	<br>

	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">회원가입</div>
				</div>
				<div class="panel-body">
					<!-- Form Name -->
					<form method="post" role="form" data-toggle="validator">
						<div class="form-group">
							<div class=" col-sm-12">
								<label class=" control-label" for="inputEmail">E-mail</label>
							</div>
							<div class=" col-sm-9">
								<input type="hidden" id="emailChk" value="N" />
								<!-- Text input-->
								<input class=" form-control " id="inputEmail" name="email"
									type="email" placeholder="E-mail을 입력하세요." autofocus
									data-error="Bruh, that email address is invalid" required>
									<div class="help-block with-errors"></div>
							</div>
								
							<div class=" col-sm-3">
								<input id="chkDupBtn" class=" form-control btn btn-primary "
									type="button" value="중복확인" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<div class="">
								<!-- Text input-->
								<label class=" control-label" for="user_name">USER_NAME</label>
								<input class="form-control" id="user_name" name="user_name"
									type="text" placeholder="이름을 입력하세요.">
							</div>
						</div>
						<div class="form-group ">
							<div class="col-sm-12">
								<!-- Password input-->
								<label class=" control-label" for="password">PASSWORD</label> <input
									id="password" name="password" type="password"
									placeholder="비밀번호를 입력하세요" class="form-control input-md">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<!-- Password input-->
							<label class=" control-label" for="password2">REPEAT
								PASSWORD</label> <input id="password2" type="password"
								placeholder="비밀번호를 다시 입력하세요." class="form-control input-md">
						</div>


						<div class="form-group">
							<div class=" col-sm-12">
								<label class=" control-label" for="signUpCode">인증번호</label>
							</div>
							<div class=" col-sm-9">
								<input id="signUpCode" type="text" placeholder="인증번호"
									class="form-control input-md">
							</div>
							<div class=" col-sm-3">
								<!-- 메일내용 -->
								<div id="signCodeBtn" class="btn btn-primary">인증번호발송</div>
							</div>
							<div class=" col-sm-12">
								<span class="glyphicon glyphicon-time"></span> <span
									id="codeTime"></span>
							</div>
						</div>
						<!-- Button -->
						<div class="form-group col-md-12">
							<label class=" control-label" for="submit"></label>
							<button id="signBtn" name="button" class="btn btn-primary">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<c:import url="../structure/tail.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		//1.아이디 중복확인
		$("#chkDupBtn").click(function() {
			var prmEmail = $('#email').val();
			if (prmEmail == '') {
				alert('email를 입력해주세요.');
				$("#email").focus();
				return;
			}
			$.ajax({
				type : 'POST',
				data : "prmEmail=" + prmEmail,
				dataType : 'text',
				url : '${path}/login/chkDupEmail.do',
				success : function(rData, textStatus, xhr) {
					var chkRst = rData;
					if (chkRst == 0) {
						alert("등록 가능 합니다.");
						$("#emailChk").val('Y');
						$("#email").attr("disabled", "disabled");
					} else {
						alert("중복 되어 있습니다.");
						$("#emailChk").val('N');
					}
				},
				error : function(xhr, status, e) {
					alert("중복확인에러:" + e);
				}
			});
		});
		//2.인증번호 메일
		$("#signCodeBtn").click(function() {
			//중복확인을 했다면.
			var signEmail = $('#inputEmail').val();
			alert(signEmail);
			$.ajax({
				type : 'POST',
				data : "signEmail=" + signEmail,
				dataType : 'text',
				url : '${path}/login/codeSend.do',
				success : function(rData, textStatus, xhr) {
					code = rData;
					clearTimeout(timeout);
					codeTimer(180);
				},
				error : function(xhr, status, e) {
					alert("인증오류 xhr:" + xhr);
					alert("인증오류 status:" + xhr);
					alert("인증오류 e:" + xhr);
				}
			});
			if ($("#emailChk").val() == 'Y') {
				//랜덤번호 생성
				//이메일 내용 생성
			} else {
				alert("e-Mail 중복확인을 해주세요.");
			}
		});
		//3.등록시 최종확인
		$("#signBtn").click(function() {
			var email = $("#email").val();
			var password = $("#password").val();
			var password2 = $("#password2").val();

			if (email == "") {
				alert("E-mail을 입력하세요");
				$("#email").focus();
				return;
			}
			if (password == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			if (password != password2) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#password2").focus();
				return;
			}
			if ($("#emailChk").val() == 'N') {
				alert('Email 중복확인을 해주세요');
				return;
			} else if ($("#emailChk").val() == 'Y') {
				//인증번호 확인
				if (code == $("#signUpCode").val() && timer > 0) {
					$("form").attr("action", "${path}/login/signUpProc.do");
					/* $("form").submit(); */
				} else if (code == $("#signUpCode").val() && timer <= 0) {
					alert("시간이초과되었습니다. 인증번호를 다시 발송해주세요.");
				} else if (code != $("#signUpCode").val()) {
					alert("인증번호가 잘못되엇습니다.");
				}
				alert("code:" + code);
				alert("$(\"#signUpCode\").val():" + $("#signUpCode").val());
			} else {
				alert("ERROR : e-Mail_check_value_false");
			}
		});
	});
	var code = "notnull";
	var timer = 0;
	var timeout;
	function codeTimer(t) {
		timer = t;
		if (timer-- > 0) {
			timeout = setTimeout(function() {
				minutes = parseInt(timer / 60 % 60, 10);
				seconds = parseInt(timer % 60, 10);
				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;
				$('#codeTime').text(minutes + ":" + seconds);
				codeTimer(timer);
			}, 1000);
		} else {
			$('#codeTime').text("인증시간종료");
		}
	}
	// 등록....
	/* function insertChk() {
	 var frm = document.companyForm;
	 if (!chkVal('email', '이메일'))
	 return false;
	 } */
</script>
</html>