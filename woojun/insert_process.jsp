<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String p_number = request.getParameter("p_number");
String customerid = request.getParameter("customerid");
String grade = request.getParameter("grade");
String menucode_1 = request.getParameter("menucode_1");
String menucode_2 = request.getParameter("menucode_2");
String menucode_3 = request.getParameter("menucode_3");
String visitdate = request.getParameter("visitdate");

int result = 0;

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "insert into tbl_performance values(?, ?, ?, ?, ?, ?, ?)";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, p_number);
pstmt.setString(2, customerid);
pstmt.setString(3, grade);
pstmt.setString(4, menucode_1);
pstmt.setString(5, menucode_2);
pstmt.setString(6, menucode_3);
pstmt.setString(7, visitdate);

result = pstmt.executeUpdate();

if (result > 0) {
%>
<script type="text/javascript">
	window.location.href = "index.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
	history.back();
</script>
<%
}
%>

