<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href = 'gameEval.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	String userPassword = null;
	String userEmail = null;
	String userName = null;
	String userBirth = null;
	String gender = null;
	String userPhone = null;
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail") != null){
		userEmail = request.getParameter("userEmail");
	}
	if(request.getParameter("userName") != null){
		userName = request.getParameter("userName");
	}
	if(request.getParameter("userBirth") != null){
		userBirth = request.getParameter("userBirth");
		userBirth = userBirth.replaceAll("-", "");
	}
	if(request.getParameter("gender") != null){
		gender = request.getParameter("gender");
		if(gender.equals("남성")) {
			gender = "M";
		}
		if(gender.equals("여성")) {
			gender = "F";
		}
	}
	if(request.getParameter("userPhone") != null){
		userPhone = request.getParameter("userPhone");
	}
	if(userID == null || userPassword == null || userEmail == null || userName == null ||
			userBirth == null || gender == null || userPhone == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false, userName, userBirth, gender, userPhone));
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		// 타 브라우저에서 인증 메일을 시도할 시 세션 아이디 저장이 불가능해 이는 application으로 영역을 넓히면 됨
		// 동일한 브라우저(크롬에서 회원가입 하고 크롬에서 이메일을 받아 인증할 경우)에서 실행할 경우 session을 사용해도됨
		application.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>