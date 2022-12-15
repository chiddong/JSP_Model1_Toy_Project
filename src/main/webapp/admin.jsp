<%@page import="com.test.board.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	
	if (session.getAttribute("auth") == null
			|| session.getAttribute("lv").equals("1")) {
		
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset='UTF-8'>");
		out.print("</head>");
		out.print("<body>");
		out.print("<script>");
		out.print("alert('관리자만 접근 가능합니다.');");
		out.print("location.href='main.jsp';");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();	
		
	}
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	
	String sql = "select * from tblSboard order by seq asc";
	
	stat = conn.createStatement();
	
	rs = stat.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<meta charset="UTF-8">
<title>익명 게시판</title>

<%@ include file="inc/asset.jsp" %>

<style>
	.btns {
		width: 700px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
	}
	
	#list {
		width: 700px;
		margin: 20px auto;
		border-collapse: collapse;
	}
	
	#list th, #list td {
		height: 30px;
		text-align: center;
		border: 1px solid #CCC;
	}
	#list th {
		background-color: #F1F4FF;
	}
	
	#list td:nth-child(1) { width: 40px; }
	#list td:nth-child(2) { width: 120px; }
	#list td:nth-child(3) { width: auto; }
	#list td:nth-child(4) { width: 70px; }
	#list td:nth-child(5) { width: 150px; }
	
	a {
		text-decoration: none;
	}
	
	a:hover {
		color: gold;
	}
</style>

</head>
<body>

	<%@ include file="inc/header.jsp" %>


	<div class="btns">
		<a href="list.jsp"><input type="button" class="btn" value="돌아가기"></a>
		<button class="btn" type="button" onclick="location.href='admindelok.jsp';">선택삭제</button>
	</div>	


	<table id="list">
		<tr>
			<th>선택</th>
			<th>게시물 번호</th>
			<th>게시물 제목</th>
			<th>작성자</th>
			<th>작성 날짜</th>
		</tr>

		<% while(rs.next()) { %>
		<tr>
			<td><input type="checkbox" name="cb"></td>
			<td><%= rs.getString("seq") %></td>
			<% if(rs.getString("content").length() > 10) { %>
			<td><a href="detail.jsp?seq=<%= rs.getString("seq") %>"><%= rs.getString("content").substring(0, 10) + " .." %>.</a></td>
			<% } else { %>
			<td><a href="detail.jsp?seq=<%= rs.getString("seq") %>"><%= rs.getString("content") %></a></td>
			<% } %>
			<td><%= rs.getString("name") %></td>
			<td><%= rs.getString("regdate") %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>
