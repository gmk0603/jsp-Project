<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String home = request.getParameter("home");
		if(home.equals("anyang")){
			response.sendRedirect("https://www.anyang.ac.kr/main/index.do");
		}
		else if(home.equals("blog")){
			response.sendRedirect("https://blog.naver.com/ppo0603");
		}
		else if(home.equals("facebook")){
			response.sendRedirect("https://www.facebook.com/profile.php?id=100009463239038");
		}
	%>
</body>
</html>