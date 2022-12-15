<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String seq = request.getParameter("seq");	
%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<meta charset="UTF-8">
<title>익명 게시판</title>

<%@ include file="inc/asset.jsp" %>

<style>
	
	#list {
		border-collapse: collapse;
		width: 700px;
		margin: 30px auto
	}
	
	
	#list td{
		border: 1px solid #CCC;
		text-align: center;
	}
	
	.btns {
		width: 700px;
		margin: auto;
		display: flex;
		justify-content: space-between;
	}
	
	#list tr{
		height: 70px;
	}
	
	h2 {
		padding: 0;
		margin: 0;
		margin-top: 50px;
		color: #444;
	}
	
	.txt {
		width: 650px;
		height:	300px;
		margin: 10px auto;
	}
	
	
	
	
</style>

</head>
<body>

	<h2 align="center">게시물 삭제하기</h2>
	<hr style="width: 200px; border: 1px solid #CCC;">

	<form method="POST" action="delok.jsp?seq=<%= seq %>">
	<table id="list">

		<tr>
			<td>비밀번호 확인: <input type="password" name="pw" required> </td>
		</tr>

	</table>

	<div class="btns">
		<div>
			<button type="submit" class="btn">삭제하기</button>
			<button type="button" class="btn" onclick="location.href='list.jsp';">돌아가기</button>
		</div>
	</div>

	</form>

</body>
</html>