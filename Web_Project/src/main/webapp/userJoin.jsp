<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>겜덕후</title>
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script type="text/javascript">
	function checkID() {
		window.name = "parentForm";
		window.open("./idCheckForm.jsp", "chkForm",
				"width=500, height=300, resizable = no, scrollbars = no");
	}
	function liveCheckPW() {
		var beforePW = document.getElementById("beforePW").value;
		var afterPW = document.getElementById("afterPW").value;

		var x = document.getElementById("outputText");
		if (String(beforePW) == String(afterPW)) {
			x.innerHTML = "<div id='outputText' style='color:green;'> 비밀번호가 일치합니다.</div>";
		} else{
			x.innerHTML = "<div id='outputText' style='color:red;'> 비밀번호가 일치하지 않습니다.</div>";
		}
	}
</script>
</head>

<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'main.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="main.jsp">겜덕후</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="main.jsp">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="gameEval.jsp">게임평가(리뷰)</a></li>
				<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정관리</a></li>
				<li class="nav-item"><a class="nav-link" href="video.jsp">게임영상</a></li>
				<li class="nav-item"><a class="nav-link" href="news.jsp">게이밍정보</a></li>
				<li class="nav-item"><a class="nav-link" href="about.jsp">소개</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> 회원 관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%
						if (userID == null) {
						%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a> <a
							class="dropdown-item active" href="userJoin.jsp">회원가입</a>
						<%
						} else {
						%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a> <a
							class="dropdown-item" href="userDelete.jsp">회원탈퇴</a>
						<%
						}
						%>
					</div></li>
			</ul>
			<form action="gameEval.jsp" method="get"
				class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-sm-2"
					type="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<section class="container mt-3" stlye="max-width: 560px;">
		<form method="post" action="userRegisterAction.jsp" name="joinForm">
			<div class="form-row">
				<div class="form-group col-sm-10">
					<label>아이디</label> <input type="text" name="userID"
						class="form-control">
				</div>
				<div class="form-group col-sm-2">
					<label>&nbsp;</label><br>
					<button type="button" class="btn btn-primary" onclick="checkID()">중복확인</button>
				</div>
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" id="beforePW"
					name="userPassword" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호 재확인</label> <input type="password" id="afterPW"
					name="userPassword" class="form-control" onKeyup="liveCheckPW()">
			</div>
			<div id="outputText">
				&nbsp;
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" name="userName"
					class="form-control">
			</div>
			<div class="form-group">
				<label>생일</label> <input type="date" name="userBirth"
					placeholder="생년월일8자리" class="form-control">
			</div>
			<div class="form-group" align="center">
				<label>성별</label><br> <input type="radio" name="gender"
					value="남성">남&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="gender" value="여성">여
			</div>
			<div class="form-group">
				<label>전화번호</label> <input type="tel" name="userPhone"
					class="form-control" placeholder="-을 제외하고 입력해주세요">
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="email" name="userEmail"
					class="form-control" placeholder="ppo0603@naver.com">
			</div>
			<button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		안양대학교 소프트웨어학과 2018E7175 정민기 </footer>
	<!-- javascript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>