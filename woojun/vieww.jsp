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
			<a href="view.jsp">네일메뉴조회</a> <a href="insert.jsp">네일실적등록</a> <a
				href="vieww.jsp">네일실적조회</a> <a href="count.jsp">네일아트통계</a> <a
				href="index.jsp">홈으로</a>
		</nav>
	</header>
	<h2>네일실적조회</h2>
	<div>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>고객아이디</th>
				<th>성명</th>
				<th>주소</th>
				<th>고객등급</th>
				<th>네일</th>
				<th>패디</th>
				<th>기타</th>
				<th>방문일자</th>
			</tr>
			<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

			String sql = "SELECT p.p_number, p.customerid, c.name, c.address, p.menucode_1, p.menucode_2, p.menucode_3, p.visitdate, m.menuname, "
					+ " m2.menuname as voel, m3.menuname as zlxk, p.grade " + " FROM tbl_customer c "
					+ " join tbl_performance p on c.customerid = p.customerid " + " join tbl_menu m on p.menucode_1 = m.menucode "
					+ " join tbl_menu m2 on p.menucode_2 = m2.menucode " + " join tbl_menu m3 on p.menucode_3 = m3.menucode "
					+ " order by p.p_number asc ";

			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
			%>
			<%
			String ddd = "";

			if (rs.getString("grade").equals("V")) {
				ddd = "우수고객";
			} else if (rs.getString("grade").equals("S")) {
				ddd = "학생고객";
			} else {
				ddd = "일반고객";
			}
			%>
			<tr>
				<td><%=rs.getString("p_number")%></td>
				<td><%=rs.getString("customerid")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("address")%></td>
				<td><%=ddd%></td>
				<td><%=rs.getString("menuname")%></td>
				<td><%=rs.getString("voel")%></td>
				<td><%=rs.getString("zlxk")%></td>
				<td>20<%=rs.getString("visitdate").substring(0,2)%>/<%=rs.getString("visitdate").substring(2,4)%>/<%=rs.getString("visitdate").substring(4,6)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<footer> Copyright @ 2023 All right reserved HRD </footer>
</body>
</html>