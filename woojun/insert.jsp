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

form {
	display: flex;
	justify-content: center;
}
#dnwns {
	text-align: center;
}
</style>
<script type="text/javascript">
	function dd() {
		var p_number = document.frm.p_number.value;
		var customerid = document.frm.customerid.value;
		var visitdate = document.frm.visitdate.value;
		
		if(p_number == "") {
			alert("번호가 입력되지 않았습니다!");
			document.frm.p_number.focus();
		}
		else if(customerid == "") {
			alert("고객아이디 입력되지 않았습니다!");
			document.frm.customerid.focus();
		}
		else if(visitdate == "") {
			alert("방문일자가 입력되지 않았습니다!");
			document.frm.visitdate.focus();
		}
		else {
			alert("네일실적정보가 정상적으로 등록 되었습니다!");
			document.frm.submit();
		}
	}
</script>
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
	<h2>네일실적 등록</h2>
	<form name="frm" action="insert_process.jsp" method="post">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><input type="text" name="p_number">예)1</td>
			</tr>
			<tr>
				<th>고객아이디</th>
				<td><input type="text" name="customerid">예)C001</td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td><select name="grade">
						<option value="V">[V]우수고객</option>
						<option value="S">[S]학생고객</option>
						<option value="G">[G]일반고객</option>
				</select>예)[V]우수고객</td>
			</tr>
			<tr>
				<th>네일코드</th>
				<td><select name="menucode_1">
						<option value="N00">[N00]해당없음</option>
						<option value="N01">[N01]풀코트</option>
						<option value="N02">[N02]아트/라인아트</option>
						<option value="N03">[N03]굴리트</option>
						<option value="N04">[N04]글라데이션</option>
						<option value="N05">[N05]프렌치</option>
				</select>예)[N01]풀코트</td>
			</tr>
			<tr>
				<th>패디코드</th>
				<td><select name="menucode_2">
						<option value="P00">[P00]해당없음</option>
						<option value="P01">[P01]풀코트</option>
						<option value="P02">[P02]아트/라인아트</option>
						<option value="P03">[P03]굴리트</option>
						<option value="P04">[P04]글라데이션</option>
						<option value="P05">[P05]프렌치</option>
				</select>예)[P01]풀코트</td>
			</tr>
			<tr>
				<th>기타</th>
				<td><select name="menucode_3">
						<option value="E00">[E00]해당없음</option>
						<option value="E01">[E01]손/발 기본 케어</option>
				</select>예)[E00]해당없음</td>
			</tr>
			<tr>
				<th>방문일자</th>
				<td><input type="text" name="visitdate">예)230801</td>
			</tr>
			<tr>
			<td colspan="2" id="dnwns">
			<button type="button" onclick="dd()">등록</button>
			<button type="reset">다시쓰기</button>
			</td>
			</tr>
		</table>
	</form>
	<footer> Copyright @ 2023 All right reserved HRD </footer>
</body>
</html>