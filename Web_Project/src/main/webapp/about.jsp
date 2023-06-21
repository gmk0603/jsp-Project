<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>About</title>
<link rel="stylesheet" type="text/css" href="css/aboutcss/style.css">
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script type="text/javascript">
	function check() {
		var f = document.contactForm;

		var email = f.email.value;
		var regExpEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		if (regExpEmail.test(email) == false) {
			alert("이메일 형식이 올바르지 않습니다.");
			f.email.focus();
			return false;
		}
		if (!(isNaN(f.name.value))) {
			alert("성함에 숫자가 포함되어있습니다.");
			f.name.focus();
			return false;
		} else {
			alert("정상적으로 제출이 완료되었습니다.");
			return true;
		}
	}
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String gameGenre = "전체";
	String searchType="최신순";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("gameGenre") != null) {
		gameGenre = request.getParameter("gameGenre");
	}
	if(request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
			System.out.println("검색 페이지 번호 오류");
		}	
	}
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false){
		response.sendRedirect("emailSendConfirm.jsp");
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
				<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="gameEval.jsp">게임평가(리뷰)</a></li>
				<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정관리</a></li>
				<li class="nav-item"><a class="nav-link" href="video.jsp">게임영상</a></li>
				<li class="nav-item"><a class="nav-link" href="news.jsp">게이밍정보</a></li>
				<li class="nav-item active"><a class="nav-link" href="about.jsp">소개</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> 회원 관리 </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%
	if(userID == null) {
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

	<div class="slider">
		<div class="controls">
			<div class="up">
				<img src="image/aboutimg/up-arrow.png" alt="uparrow" width="50px"
					height="50px">
			</div>
			<div class="down">
				<img src="image/aboutimg/down-arrow.png" alt="downarrow"
					width="50px" height="50px">
			</div>
		</div>
		<div class="wrapper">
			<div class="left">
				<div>
					<h2>일정관리</h2>
					<p>스케쥴을 작성해 게이머들이 즐기고 있는 게임 일정을 깔끔하게 소화할 수 있는 일정관리기능을 제공하고
						있습니다.</p>
				</div>
				<div>
					<h2>인기영상</h2>
					<p>오늘의 인기영상을 확인해볼 수 있는 공간입니다.</p>
				</div>
				<div>
					<h2>정보</h2>
					<p>게임 출시일, 이벤트, 이슈, 그래픽카드정보 등 게이머들에 있어 필요한 정보를 모아놓은 공간으로 최근 정보를
						신속하게 제공하고 있습니다.</p>
				</div>
				<div>
					<h2>My name is Jeong Min Ki</h2>
					<p>
						안양대학교 출신의 게임을 좋아하는 학생개발자이고,<br> 게이머들을 위한 유용한 서비스를 개발하고자 노력하고
						있습니다.
					</p>
					<br> <br> <br>
					<form name="connect" action="connect.jsp">
						<input type="text" name="home" value="anyang"
							style="display: none;">
						<table border="0">
							<tr>
								<td><input type="image" src="image/aboutimg/anyang.jpg"
									value="anyang" width="50px" height="50px"></td>
								<td><p>안양대학교</p></td>
							</tr>
						</table>
					</form>
					<form name="connect" action="connect.jsp">
						<input type="text" name="home" value="blog" style="display: none;">
						<table border="0">
							<tr>
								<td><input type="image" src="image/aboutimg/naver.png"
									value="blog" width="50px" height="50px"></td>
								<td><p>네이버블로그</p></td>
							</tr>
						</table>
					</form>
					<form name="connect" action="connect.jsp">
						<input type="text" name="home" value="facebook"
							style="display: none;">
						<table border="0">
							<tr>
								<td><input type="image" src="image/aboutimg/facebook.png"
									value="facebook" width="50px" height="50px"></td>
								<td><p>페이스북</p></td>
							</tr>
						</table>
					</form>
				</div>
				<div>
					<h2>Contact Us</h2>
					<div class="contact-box">
						<form name="contactForm" action="main.jsp" method="post"
							onsubmit="return check()">
							<input type="text" class="input-field" name="name"
								placeholder="성함"> <input type="text" class="input-field"
								name="email" placeholder="Email"> <input type="text"
								class="input-field" placeholder="subject">
							<textarea type="text" class="input-field textarea-field"
								placeholder="내용">
						  </textarea>
							<input type="submit" class="btn" value="전송">
						</form>
					</div>
				</div>
			</div>
			<div class="right">
				<div>
					<img src="image/aboutimg/contact.jpg" alt="contactusimg"
						width="500px" height="500px">
				</div>
				<div>
					<img src="image/aboutimg/gamer.jpg" alt="gamerimg" width="500px"
						height="500px">
				</div>
				<div>
					<img src="image/aboutimg/news.png" alt="newsimg" width="500px"
						height="500px">
				</div>
				<div>
					<img src="image/aboutimg/video.png" alt="videoimg" width="500px"
						height="500px">
				</div>
				<div>
					<img src="image/aboutimg/calendar.png" alt="calendarimg"
						width="500px" height="500px">
				</div>
			</div>
		</div>
	</div>
	<script src="js/aboutjs/script.js"></script>
	<!-- javascript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>