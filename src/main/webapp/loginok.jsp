<%@page import="com.test.board.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	
	//로그인 SQL
	String sql = "select * from tblSboard where id=? and pw=?";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, id);
	stat.setString(2, pw);
	
	rs = stat.executeQuery();
	
	if(rs.next()) {
		
		//로그인 성공 인증티켓
		session.setAttribute("auth", id);
		
		session.setAttribute("name", rs.getString("name"));
		session.setAttribute("lv", rs.getString("lv"));
		session.setAttribute("pw", rs.getString("pw"));
		session.setAttribute("seq", rs.getString("seq"));
		
		response.sendRedirect("list.jsp");
		
	} else {
		
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset='UTF-8'>");
		out.print("</head>");
		out.print("<body>");
		out.print("<script>");
		out.print("alert('아이디 혹은 비밀번호를 확인하세요.');");
		out.print("location.href='main.jsp';");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
		
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<meta charset="UTF-8">
<title>익명 게시판</title>

<%@ include file="inc/asset.jsp" %>

</head>
<body>

</body>
</html>










