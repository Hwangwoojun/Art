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
<h2>네일메뉴조회</h2>
	<div>
	<table border="1">
	<tr>
	<th>메뉴코드</th>
	<th>메뉴명</th>
	<th>메뉴타입</th>
	<th>가격</th>
	</tr>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	
	String sql = "SELECT menucode, menuname, menutype, "
			+ " TO_CHAR(price, '999,999,999') as price_price "
			+ " FROM tbl_menu ";
	
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next()) {
	%>
	<%
	String ddd = "";
	
	if (rs.getString("menutype").equals("N")) {
		ddd = "네일";
	}
	else if (rs.getString("menutype").equals("P")) {
		ddd = "패디";
	}
	else {
		ddd = "기타";
	}
	%>
	<tr>
	<td><%= rs.getString("menucode") %></td>
	<td><%= rs.getString("menuname") %></td>
	<td><%= ddd %></td>
	<td>₩<%= rs.getString("price_price") %></td>
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