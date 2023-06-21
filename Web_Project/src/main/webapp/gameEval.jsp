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
<title>겜덕후</title>
<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
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
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
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
				<li class="nav-item active"><a class="nav-link" href="gameEval.jsp">게임평가(리뷰)</a></li>
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
	<section class="container">
		<form method="get" action="gameEval.jsp" class="form-inline mt-3">
			<select name="gameGenre" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="교육"
					<% if(gameGenre.equals("교육")) out.println("selected"); %>>교육</option>
				<option value="단어"
					<% if(gameGenre.equals("단어")) out.println("selected"); %>>단어</option>
				<option value="AOS"
					<% if(gameGenre.equals("AOS")) out.println("selected"); %>>AOS</option>
				<option value="보드"
					<% if(gameGenre.equals("보드")) out.println("selected"); %>>보드</option>
				<option value="스포츠"
					<% if(gameGenre.equals("스포츠")) out.println("selected"); %>>스포츠</option>
				<option value="시뮬레이션"
					<% if(gameGenre.equals("시뮬레이션")) out.println("selected"); %>>시뮬레이션</option>
				<option value="아케이드"
					<% if(gameGenre.equals("아케이드")) out.println("selected"); %>>아케이드</option>
				<option value="액션"
					<% if(gameGenre.equals("액션")) out.println("selected"); %>>액션</option>
				<option value="어드벤처"
					<% if(gameGenre.equals("어드벤처")) out.println("selected"); %>>어드벤처</option>
				<option value="음악"
					<% if(gameGenre.equals("음악")) out.println("selected"); %>>음악</option>
				<option value="카드"
					<% if(gameGenre.equals("카드")) out.println("selected"); %>>카드</option>
				<option value="RPG"
					<% if(gameGenre.equals("RPG")) out.println("selected"); %>>RPG</option>
			</select> <select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="추천순"
					<% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
			</select> <input type="text" name="search" class="form-control mx-1 mt-2"
				placeholder="내용을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
				href="#registerModal">등록하기</a> <a class="btn btn-danger mx-1 mt-2"
				data-toggle="modal" href="#reportModal">신고</a>
		</form>

		<%
	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
	evaluationList = new EvaluationDAO().getList(gameGenre, searchType, search, pageNumber);
	if(evaluationList != null) 
		for(int i = 0; i < evaluationList.size(); i++) {
			if(i == 5) break;
			EvaluationDTO evaluation = evaluationList.get(i);
%>

		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-4 text-left">
						작성자:
						<%= evaluation.getUserID() %>
					</div>
					<div class="col-6 text-left">
						게임명:
						<%= evaluation.getGameName() %>&nbsp;<small>제작사: <%= evaluation.getGameManufacturers() %></small>
					</div>
					<div class="col-2 text-right">
						종합<span style="color: red;"><%= evaluation.getTotalScore() %></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					제목:
					<%= evaluation.getEvaluationTitle() %>&nbsp;<small>(작성일: <%= evaluation.getEvalYear() %>년
						<%= evaluation.getEvalQuarter() %>)
					</small>
				</h5>
				<p class="card-text"><%= evaluation.getEvaluationContent() %></p>
				<div class="row">
					<div class="col-12 text-left">
						플레이타임: <span><%= evaluation.getPlayTimeHour() %></span>시간 <span><%= evaluation.getPlayTimeMin() %></span>분
						<span><%= evaluation.getPlayTimeSec() %></span>초
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-9 text-left">
						그래픽<span style="color: red;"><%= evaluation.getGraphicScore() %></span>
						스토리<span style="color: red;"><%= evaluation.getStoryScore() %></span>
						조작성<span style="color: red;"><%= evaluation.getControlScore() %></span>
						<span style="color: green;">(추천: <%= evaluation.getLikeCount() %>)
						</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')"
							href="likeAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')"
							href="deleteAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">삭제</a>
					</div>
				</div>
			</div>
		</div>
		<%
				}
%>
	</section>
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
			<%
	if (pageNumber <= 0) {
%> <a class="page-link disabled">이전</a> <%
	} else {
%> <a class="page-link"
			href="./gameEval.jsp?lectureDivide=<%=URLEncoder.encode(gameGenre, "UTF-8") %>&searchType=
	<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8")%>&pageNumber=
	<%= pageNumber - 1 %>">이전</a>
			<%
	}
%>
		</li>
		<li>
			<%
	 if(evaluationList.size() < 6) {
%> <a class="page-link disabled">다음</a> <%		 
	 } else {
%> <a class="page-link"
			href="./gameEval.jsp?lectureDivide=<%=URLEncoder.encode(gameGenre, "UTF-8") %>&searchType=
	<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8")%>&pageNumber=
	<%= pageNumber + 1 %>">다음</a>
			<%
	 }
%>
		</li>
	</ul>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		arialabelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">리뷰 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>게임명</label> <input type="text" name="gameName"
									class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>제작사</label> <input type="text" name="gameManufacturers"
									class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>평가 연도</label> <select name="evalYear"
									class="form-control">
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023" selected>2023</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>평가 분기</label> <select name="evalQuarter"
									class="form-control">
									<option value="1분기" selected>1분기</option>
									<option value="2분기">2분기</option>
									<option value="3분기">3분기</option>
									<option value="4분기">4분기</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>장르</label> <select name="gameGenre" class="form-control">
									<option value="교육" selected>교육</option>
									<option value="단어">단어</option>
									<option value="AOS">AOS</option>
									<option value="보드">보드</option>
									<option value="스포츠">스포츠</option>
									<option value="시뮬레이션">시뮬레이션</option>
									<option value="아케이드">아케이드</option>
									<option value="액션">액션</option>
									<option value="어드벤처">어드벤처</option>
									<option value="음악">음악</option>
									<option value="카드">카드</option>
									<option value="RPG">RPG</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<label>플레이타임</label>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>시간</label> <input type="text" name="playTimeHour"
									class="form-control" maxlength="5">
							</div>
							<div class="form-group col-sm-4">
								<label>분</label> <input type="text" name="playTimeMin"
									class="form-control" maxlength="2">
							</div>
							<div class="form-group col-sm-4">
								<label>초</label> <input type="text" name="playTimeSec"
									class="form-control" maxlength="2">
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="evaluationTitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>리뷰 내용</label>
							<textarea name="evaluationContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label> <select name="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>그래픽</label> <select name="graphicScore"
									class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>스토리</label> <select name="storyScore"
									class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>조작성</label> <select name="controlScore"
									class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		arialabelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="reportAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label> <input type="text" name="reportTitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		안양대학교 소프트웨어학과 2018E7175 정민기 </footer>
	<!-- javascript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>