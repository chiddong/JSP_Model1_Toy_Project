<%@page import="com.test.board.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement stat = null;	
	
	conn = DBUtil.open();
	
 	String sql="insert into tblSboard(seq, name, id, pw, content, lv, regdate) values(seqSboard.nextVal, ?, ?, ?, ?, ?, default)";
	
	stat = conn.prepareStatement(sql);
	
	stat.setString(1, (String)session.getAttribute("name"));
	stat.setString(2, (String)session.getAttribute("auth"));
	stat.setString(3, (String)session.getAttribute("pw"));
	stat.setString(4, content);
	stat.setString(5, (String)session.getAttribute("lv"));
	
	int result = stat.executeUpdate();
	
	if (result == 1 ){
		
		response.sendRedirect("list.jsp");
		
	} else {
		
		out.println("<script>");
		out.println("alert('failed');");
		out.println("</script>");
		out.close();	//이후의 HTML을 실행하지 않는다.
		
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