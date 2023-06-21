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
<title>정보</title>

<link rel="stylesheet" href="css/newscss/style.css">

<!--  폰트 poppins -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
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
				<li class="nav-item active"><a class="nav-link" href="news.jsp">게이밍정보</a></li>
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
	<section id="news">
		<div class="news-heading">
			<h3>게이머 뉴스</h3>
		</div>

		<div class="news-container">
			<div class="news-box">
				<div class="news-img">
					<img
						src="https://cdn.gamemeca.com/data_center/264/526/20230502163848.jpg"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.05.02 / Game</span> <a
						href="https://www.gamemeca.com/view.php?gid=1713246"
						class="news-title">스트리트 파이터 6 개발진, '진입장벽 낮췄다' 몇 번씩 강조</a>
					<p>오는 6월 2일 정식 출시 예정인 스트리트 파이터 시리즈 신작 '스트리트 파이터 6(이하 스파 6)'이 국내
						미디어를 대상으로 쇼케이스를 열었다...</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://cdn.gamemeca.com/data_center/264/366/20230428172249.jpg"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.05.01 / Game</span> <a
						href="https://www.gamemeca.com/view.php?gid=1712950"
						class="news-title">[매장탐방] 젤다와 파판이 불 붙였지만 패키지가 부족해!</a>
					<p>현실에서는 반가운 봄비가 내렸지만, 게임 매장에서는 봄가뭄이 이어졌다. 4월 한 달간 데드 아일랜드 2나
						스타워즈 제다이 서바이버를 제외하면 별다른 히트작이 없었다.</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://cdn.kr.aving.net/news/photo/202304/1778229_701961_2342.png"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.04.14 / Graphic</span> <a
						href="https://kr.aving.net/news/articleView.html?idxno=1778229"
						class="news-title">MSI, 지포스 RTX 4070 시리즈 그래픽카드 2종 출시...</a>
					<p>MSI코리아가 최신 엔비디아 에이다 러브레이스(NVIDIA Ada Lovelace) 아키텍처를 기반으로
						3세대 DLSS, 실시간 레이 트레이싱 등 차세대 기술을 지원하는 ‘MSI 지포스(GeForce) RTX 4070’
						그래픽카드 2종을 출시한다고 14일 밝혔다.</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://www.brainbox.co.kr/data/editor/2305/630f0ed12b44c1a9e36057b31985a379_1683105906_6145.jpg"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.05.03 / Graphic</span> <a
						href="https://www.brainbox.co.kr/bbs/board.php?bo_table=news&wr_id=57278&page=142"
						class="news-title">이엠텍, SAPPHIRE 라데온 RX 6600 PULSE 구매 시, 그래픽카드
						지지대 RB-2 증정!</a>
					<p>국내 PC 그래픽카드 점유율 1위이자, 대한민국 토종 그래픽카드 브랜드 ㈜이엠텍아이엔씨(대표:이덕수)은
						2023년 5월 3일(수)부터 6월 2일(금)까지 SAPPHIRE 라데온 RX 6600 PULSE D6 8GB
						Dual-X를 ㈜이엠텍아이엔씨 공식 쇼핑몰 아이바이컴과 스마트스토어 아이바이컴에서 구매 시, 레드빗 그래픽카드 지지대
						RB-2 블랙을 20개 선착순 한정수량으로 증정한다 밝혔다.</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://cdn.epnc.co.kr/news/photo/202304/232552_233776_1842.jpg"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.04.14 / Graphic</span> <a
						href="https://www.epnc.co.kr/news/articleView.html?idxno=232552"
						class="news-title">마이크로닉스, PNY 지포스 RTX 4070 베르토 그래픽카드 출시</a>
					<p>PNY 지포스 RTX 4070 베르토 시리즈는 ‘PNY 지포스 RTX 4070 베르토 12GB 듀얼팬’과
						‘PNY XLR8 지포스 RTX 4070 베르토 에픽-X 12GB 트리플팬’ 등 두 가지다. 각각 크기와 쿨러 형상에
						따라 소비자 취향대로 선택할 수 있도록 했다.</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://www.thedailypost.kr/news/photo/202305/92716_90329_5047.jpg"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.05.02 / Game</span> <a
						href="https://www.thedailypost.kr/news/articleView.html?idxno=92716"
						class="news-title">넥슨 ‘메이플스토리’, 20주년 팬 페스트 성료…3일간 6천여명 이상 다녀가</a>
					<p>넥슨은 “지난달 28일부터 3일간 동대문디자인플라자(DDP)에서 열린 ‘메이플스토리 팬 페스트’에
						6000여명 이상이 다녀갔다”며 “어린이를 동반한 가족 단위 방문객부터 연인, 친구, 지인 등 다양한 구성의 방문객들이
						축제의 현장을 찾아 열기를 더했다”고 2일 밝혔다.</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://image.kmib.co.kr/online_image/2023/0322/2021061319234233848_1623579822_0018079427.jpg"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.03.22 / Game</span> <a
						href="https://news.kmib.co.kr/article/view.asp?arcid=0018079427&code=61151111&sid1=eco"
						class="news-title">스마일게이트, 로스트아크 공모전 올해도 연다 </a>
					<p>22일 스마일게이트에 따르면 ‘2023 로스트아크 아트 공모전’이란 명칭으로 열리는 이번 경연은 아바타, 탈
						것, 펫 등 11개 분야에서 진행한다. 각 분야별 대상 1명, 최우수상 1명, 우수상 3명 등 총 55명에게 상금과
						로스트아크 굿즈, 게임 내에서 사용할 수 있는 특별한 칭호 등을 지급한다. 상금 규모는 5500만원이다.</p>
				</div>
			</div>

			<div class="news-box">
				<div class="news-img">
					<img
						src="https://thumb.mt.co.kr/06/2023/04/2023042116164790386_1.jpg/dims/optimize/"
						alt="News" width="438px" height="230px">
				</div>
				<div class="news-text">
					<span>2023.04.23 / Game</span> <a
						href="https://news.mt.co.kr/mtview.php?no=2023042116164790386"
						class="news-title">'LoL 월드 챔피언십' 결승전, 11월 서울 고척스카이돔에서 열린다</a>
					<p>서울시는 전 세계에서 가장 인기 있는 e스포츠 종목인 '리그오브레전드(이하 롤·LoL)'의 세계 최강팀을
						가리는 '2023 롤 월드 챔피언십' 결승전이 오는 11월 19일 국내 최대 규모의 실내경기장인 서울 고척스카이돔에서
						개최된다고 23일 밝혔다.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- javascript -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>