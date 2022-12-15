<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<meta charset="UTF-8">
<title>익명 게시판</title>

<%@ include file="inc/asset.jsp" %>

<style>
	fieldset {
		padding: 30px;
		width: 250px;
		margin: 20px auto;
		margin-top: 50px;
		text-align: center;
	}
	
	.btn {
		width: 100px;
	}
</style>

</head>
<body>

	<%@ include file="inc/header.jsp" %>

	<fieldset>
		<legend>로그인</legend>
		<form method="POST" action="loginok.jsp">
			<table>
				<tr>
					<td>사번</td>
					<td><input type="text" name="id" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" required></td>
				</tr>
			</table>
			<div>
				<input class="btn" type="submit" value="로그인">
			</div>
		</form>
	</fieldset>

</body>
</html>












