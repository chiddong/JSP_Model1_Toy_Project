<%@page import="com.test.board.DBUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.open();
	
	String sql = "";
	
	if(session.getAttribute("lv").equals("2")) {
		sql = "select count(*) as cnt from tblSboard where seq=?";
	
		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);
		
	} else {
		sql = "select count(*) as cnt from tblSboard where seq=? and pw=?";
		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);
		stat.setString(2, pw);
	}
	
	
	rs = stat.executeQuery();
	
	int cnt = 0;
	
	if (rs.next()) {
		cnt = rs.getInt("cnt");
	}
	
	
	if (cnt == 1) {
	 	sql="delete from tblSboard where seq=?";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, seq);
		
		int result = stat.executeUpdate();
		
		if (result == 1 ){
			
			response.sendRedirect("list.jsp");
			
		} else {
			
			out.println("<script>");
			out.println("alert('failed');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
		} 
	} else {
		out.println("<script>");
		out.println("alert('비밀번호가 틀렸습니다.');");
		out.println("history.back();");
		out.println("</script>");
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