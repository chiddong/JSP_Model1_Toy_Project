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
	String regdate = "";
	String id = "";
	
	if (rs.next()) {
		
		content = rs.getString("content");
		regdate = rs.getString("regdate");
		id = rs.getString("id");
		
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
	
	#list tr:nth-child(2) td:nth-child(1) { width: 120px; }
	#list tr:nth-child(2)  td:nth-child(2) { width: auto; }
	#list tr:nth-child(2)  td:nth-child(3) { width: 150px; }
	
	
	
</style>

</head>
<body>

	<header>
		익명게시판 <i class="fa-solid fa-keyboard"></i>
	</header>

	<table id="list">
		<tr>
			<th>게시물 번호</th>
			<th>게시물 제목</th>
			<th>작성 날짜</th>
		</tr>

		<tr>
			<td><%= seq %></td>
			<% if(content.length() > 10) { %>
			<td><%= content.substring(0, 10) + " .." %></td>
			<% } else { %>
			<td><%= content %></td>
			<% } %>
			<td><%= regdate %></td>
		</tr>

		<tr>
			<td colspan="3"><%= content %></td>
		</tr>

	</table>


	<% if (session.getAttribute("auth").equals(id)) { %>
	<div class="btns">
		<div>
			<button class="btn" onclick="location.href='del.jsp?seq=<%= seq %>';">삭제하기</button>
			<button class="btn" onclick="location.href='edit.jsp?seq=<%= seq %>';">수정하기</button>
		</div>
		<button class="btn" onclick="location.href='list.jsp';">돌아가기</button>
	</div>
	<% } else if(session.getAttribute("lv").equals("2")) { %>
	<div class="btns">
		<button class="btn" onclick="location.href='del.jsp?seq=<%= seq %>';">삭제하기</button>
		<button class="btn" onclick="location.href='list.jsp';">돌아가기</button>
	</div>
	<% } else { %>
	<div class="btns">
		<span></span>
		<button class="btn" onclick="location.href='list.jsp';">돌아가기</button>
	</div>
	<% } %>	


</body>
</html>


