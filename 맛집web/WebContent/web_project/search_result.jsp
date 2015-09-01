<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서울 맛집 홈페이지입니다.</title>
<link rel="stylesheet" href="mystyle_2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<form action="User_view.jsp" method="post">

		<%
			request.setCharacterEncoding("euc-kr");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/webdb", "root", "mgyj9029");
			Statement stmt = conn.createStatement();
			String searchKey = request.getParameter("searchKey");

			String sql = "select num,content,title,score,image,name from user where title like '%"
					+ searchKey + "%';";

			ResultSet rs = stmt.executeQuery(sql);
		%>

		<input type="hidden" value=<%=searchKey%> name="search">
		<div align=center>

			<div id="logo" align=center>
				<img src="img/logo.gif">
			</div>

			<div
				style="width: 640px; height: 470px; background-image: url(./img/list_bg.gif); background-repeat: no-repeat;"
				align=left>
				<%
					while (rs.next()) {
				%>
				<div>
					<div id="main_body">
						<img src=<%=rs.getString("image")%>>
					</div>



					<ul id="li_a">
						<li>키워드&nbsp; : &nbsp;<%=rs.getString("title")%></li>

						<li>이름&nbsp; : &nbsp;<%=rs.getString("name")%></li>

						<li>내용 &nbsp;:&nbsp; <%=rs.getString("content")%></li>
						<br>
						<br>
						<li>평점 &nbsp;: &nbsp;<%=rs.getString("score")%></li>
					</ul>
					<div
						style="width: 643px; height: 245px; background-image: url(./img/main_bg.jpg); background-repeat: no-repeat;"
						align=left></div>

					<%
						}
					%>


				</div>


				<div></div>
			</div>
		</div>
	</form>
</body>
</html>