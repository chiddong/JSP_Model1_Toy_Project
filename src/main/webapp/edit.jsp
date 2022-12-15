<%@page import="com.test.board.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String seq = request.getParameter("seq");
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	
	String sql = "select * from tblSboard where seq = ?";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, seq);
	
	rs = stat.executeQuery();
	
	String content = "";
	String id = "";
	String pw = "";
	
	if (rs.next()) {
		
		content = rs.getString("content");
		id = rs.getString("id");
		pw = rs.getString("pw");
		
	}
	
	rs.close();
	stat.close();
	conn.close();
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
		margin: 0 auto;
		margin-top: 50px;
	}
	
	
	#list th, #list td{
		border: 1px solid #CCC;
		text-align: center;
	}
	
	#list th {
		background-color: #F1F4FF;
	}
	
	#list tr:nth-child(3) {
		height: 200px;
	}
	
	.btns {
		width: 700px;
		margin: auto;
		display: flex;
		justify-content: space-between;
	}
	
	#list tr:nth-child(3){
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


	<h2 align="center">게시물 수정하기</h2>
	<hr style="width: 200px; border: 1px solid #CCC;">

	<form method="POST" action="editok.jsp?seq=<%= seq %>">
	<table id="list">
		<tr>
			<th>게시물 내용</th>
		</tr>

		<tr>
			<td>
				<textarea class="txt" name="content" placeholder="내용을 입력하세요." required><%= content %></textarea>
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인: <input type="password" name="pw" required> </td>
		</tr>

	</table>

	<div class="btns">
		<div>
			<button type="submit" class="btn">수정완료</button>
			<button type="button" class="btn" onclick="location.href='list.jsp';">돌아가기</button>
		</div>
	</div>

	</form>


</body>
</html>






