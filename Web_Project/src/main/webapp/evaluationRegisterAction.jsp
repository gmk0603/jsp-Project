<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
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

	String gameName= null;
	String gameManufacturers= null;
	int evalYear = 0;
	String evalQuarter= null;
	String gameGenre= null;
	int playTimeHour = 0;
	int playTimeMin = 0;
	int playTimeSec = 0;
	String evaluationTitle= null;
	String evaluationContent= null;
	String totalScore= null;
	String graphicScore= null;
	String storyScore= null;
	String controlScore= null;
	
	String userPassword = null;
	String userEmail = null;
	if(request.getParameter("gameName") != null){
		gameName = request.getParameter("gameName");
	}
	if(request.getParameter("gameManufacturers") != null){
		gameManufacturers = request.getParameter("gameManufacturers");
	}
	if(request.getParameter("evalYear") != null){
		try{
			evalYear = Integer.parseInt(request.getParameter("evalYear"));
		} catch (Exception e) {
			System.out.println("데이터 오류");
		}
		
	}
	if(request.getParameter("evalQuarter") != null){
		evalQuarter = request.getParameter("evalQuarter");
	}
	if(request.getParameter("gameGenre") != null){
		gameGenre = request.getParameter("gameGenre");
	}
	if(request.getParameter("playTimeHour") != null){	
		try{
			playTimeHour = Integer.parseInt(request.getParameter("playTimeHour"));
		} catch (Exception e) {
			System.out.println("플레이 타임 시간(hour) 오류");
		}
	}
	if(request.getParameter("playTimeMin") != null){
		try{
			playTimeMin = Integer.parseInt(request.getParameter("playTimeMin"));
		} catch (Exception e) {
			System.out.println("플레이 타임 분(minute) 오류");
		}
	}
	if(request.getParameter("playTimeSec") != null){
		try{
			playTimeSec = Integer.parseInt(request.getParameter("playTimeSec"));
		} catch (Exception e) {
			System.out.println("플레이 타임 초(second) 오류");
		}
	}
	if(request.getParameter("evaluationTitle") != null){
		evaluationTitle = request.getParameter("evaluationTitle");
	}
	if(request.getParameter("evaluationContent") != null){
		evaluationContent = request.getParameter("evaluationContent");
	}
	if(request.getParameter("totalScore") != null){
		totalScore = request.getParameter("totalScore");
	}
	if(request.getParameter("graphicScore") != null){
		graphicScore = request.getParameter("graphicScore");
	}
	if(request.getParameter("storyScore") != null){
		storyScore = request.getParameter("storyScore");
	}
	if(request.getParameter("controlScore") != null){
		controlScore = request.getParameter("controlScore");
	}
	
	if(gameName == null || gameManufacturers == null || evalYear == 0 || evalQuarter == null || gameGenre == null || 
			playTimeHour == 0 || playTimeMin == 0 || playTimeSec == 0 || evaluationTitle == null || evaluationContent == null || 
			totalScore == null || graphicScore == null || storyScore == null || controlScore == null || 
			evaluationTitle.equals("") || evaluationContent.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	int result = evaluationDAO.write(new EvaluationDTO(0, userID, gameName, gameManufacturers, evalYear, evalQuarter, gameGenre, playTimeHour, playTimeMin, playTimeSec, evaluationTitle, evaluationContent, totalScore, graphicScore, storyScore, controlScore, 0));
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게임 평가 등록 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'gameEval.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>