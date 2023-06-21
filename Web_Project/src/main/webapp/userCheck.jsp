<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String inputUserID = request.getParameter("userID");
	UserDAO userDAO = new UserDAO();
	int result = userDAO.checkID(inputUserID);
	if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('중복된 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		// 중복 아이디 없음
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('사용 가능한 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>