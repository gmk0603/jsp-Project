<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<script>
	function pValue(){
		document.getElementById("inputId").value = opener.document.joinForm.userID.value;
	}
	
	function sendCheckValue(){
		opener.document.joinForm.userID.value = document.getElementById("inputId").value;
		
		if(opener != null) {
			opener.chkForm = null;
			self.close();
		}
	}
</script>
</head>
<body onload="pValue()">
	<div id="wrap">
		<br>
		<b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form action="userCheck.jsp" name="checkForm">
				<input type="text" name="userID" id="inputId">
				<input type="submit" value="중복확인">
			</form>
			<br>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
			<input id="userBtn" type="button" value="사용하기" onclick="sendCheckValue()">
		</div>
	</div>
</body>
</html>