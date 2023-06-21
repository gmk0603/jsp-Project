<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>오늘의 인기영상</title>
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<style>
.submitButton {
	position: absolute;
	left: 1%;
	top: 1%;
	display: flex;
	color: #fff;
	font-size: 40px;
	padding: 8px 22px;
	border-radius: 6px;
	background: #7d2ae8;
	transition: all 0.2s ease;
}

.submitButton:active {
	transform: scale(0.96);
}
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/videocss/grid.css">
<link rel="stylesheet" href="css/videocss/style.css">
<script src="js/videojs/jquery.min.js"></script>
<script src="js/videojs/app.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String gameGenre = "전체";
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
	if (request.getParameter("gameGenre") != null) {
		gameGenre = request.getParameter("gameGenre");
	}
	if (request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if (request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if (request.getParameter("pageNumber") != null) {
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
			System.out.println("검색 페이지 번호 오류");
		}
	}
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if (emailChecked == false) {
		response.sendRedirect("emailSendConfirm.jsp");
		return;
	}
	%>
	<div class="video_wrapper">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="main.jsp">겜덕후</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="gameEval.jsp">게임평가(리뷰)</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정관리</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="video.jsp">게임영상</a></li>
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
								class="dropdown-item" href="userJoin.jsp">회원가입</a>
							<%
							} else {
							%>
							<a class="dropdown-item" href="userLogout.jsp">로그아웃</a> 
							<a class="dropdown-item" href="userDelete.jsp">회원탈퇴</a>
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
		<div class="video_container">
			<div class="video_section">
				<iframe width="100%" height="100%"
					src="https://www.youtube.com/embed/CN0OTAkUD9c"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="playlist_input">
				<div class="video_content">
					<h1>
						Todays <span>Hot!</span>
					</h1>
				</div>
			</div>
		</div>
		<div class="video_thumb">
			<div class="row"></div>
		</div>
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
			안양대학교 소프트웨어학과 2018E7175 정민기 </footer>
	</div>
	<!-- javascript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>