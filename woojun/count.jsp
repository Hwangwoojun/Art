<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
}
h1 {
	background-color: black;
	color: white;
	width: 100%;
	height: 70px;
	padding-top: 10px;
	text-align: center;
	
}
nav {
	width: 100%;
	height: 40px;
	padding-top: 4px;
	background-color: gray;
}
a {
	margin-left: 10px;
	font-size: 20px;
	color: white;
	font-weight: bold;
	text-decoration: none;
}
footer {
	background-color: gray;
	width: 100%;
	height: 60px;
	padding-top: 7px;
	font-size: 25px;
	font-weight: bold;
	position: fixed;
	bottom: 0;
	text-align: center;
	color: white;	
}
h2 {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
table {
	text-align: center;
}
div {
	display: flex;
	justify-content: center;
}
</style>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<header>
<h1>네일아트관리 프로그램</h1>
<nav>
<a href="view.jsp">네일메뉴조회</a>
<a href="insert.jsp">네일실적등록</a>
<a href="vieww.jsp">네일실적조회</a>
<a href="count.jsp">네일아트통계</a>
<a href="index.jsp">홈으로</a>
</nav>
</header>
<h2>방문일자별 네일아트(네일)통계</h2>
	<div>
	<table border="1">
	<tr>
	<th>방문일자</th>
	<th>총건수</th>
	<th>총가격</th>
	</tr>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	
	String sql = "SELECT p.visitdate, "
			+ " COUNT(*) as total, "
			+ " TO_CHAR(SUM(CASE "
			+ " WHEN p.grade = 'V' THEN m1.price * 0.9 "
			+ " WHEN p.grade = 'S' THEN m1.price * 0.8 "
			+ " ELSE m1.price end), '999,999,999') as to_total "
			+ " from tbl_performance p "
			+ " join tbl_menu m1 on p.menucode_1 = m1.menucode "
			+ " where m1.menutype = 'N' "
			+ " group by p.visitdate "
			+ " order by p.visitdate";
	
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next()) {
	%>
	<tr>
	<td>20<%=rs.getString("visitdate").substring(0,2)%>/<%=rs.getString("visitdate").substring(2,4)%>/<%=rs.getString("visitdate").substring(4,6)%></td>
	<td><%= rs.getString("total") %>건</td>
	<td>₩<%= rs.getString("to_total") %></td>
	</tr>
	<%
	}
	%>
	</table>
	</div>

<footer>
Copyright @ 2023 All right reserved HRD
</footer>
</body>
</html>