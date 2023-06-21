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
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/calendarcss/style.css">
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>일정관리</title>
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
	<div class="container">
		<div class="row">
			<div class="left">
				<div class="calendar">
					<div class="month">
						<i class="fas fa-angle-left prev"></i>
						<div class="date">december 2015</div>
						<i class="fas fa-angle-right next"></i>
					</div>
					<div class="weekdays">
						<div>일</div>
						<div>월</div>
						<div>화</div>
						<div>수</div>
						<div>목</div>
						<div>금</div>
						<div>토</div>
					</div>
					<div class="days"></div>
					<div class="goto-today">
						<div class="goto">
							<input type="text" placeholder="ex.06/1999" class="date-input" />
							<button class="goto-btn">Go</button>
						</div>
						<button class="today-btn">Today</button>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="today-date">
					<div class="event-day">wed</div>
					<div class="event-date">12th december 2022</div>
				</div>
				<div class="events"></div>
				<div class="add-event-wrapper">
					<div class="add-event-header">
						<div class="title">일정 추가</div>
						<i class="fas fa-times close"></i>
					</div>
					<div class="add-event-body">
						<div class="add-event-input">
							<input type="text" placeholder="일정 작성" class="event-name" />
						</div>
						<div class="add-event-input">
							<input type="text" placeholder="일정 시작" class="event-time-from" />
						</div>
						<div class="add-event-input">
							<input type="text" placeholder="일정 종료" class="event-time-to" />
						</div>
					</div>
					<div class="add-event-footer">
						<button class="add-event-btn">일정 추가</button>
					</div>
				</div>
			</div>
			<button class="add-event">
				<i class="fas fa-plus"></i>
			</button>
		</div>
	</div>
	<div class="credits">
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
					<li class="nav-item active"><a class="nav-link"
						href="calendar.jsp">일정관리</a></li>
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
								class="dropdown-item" href="userJoin.jsp">회원가입</a>
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
	</div>
	<script src="js/calendarjs/script.js"></script>
	<!-- javascript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
