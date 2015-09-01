<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서울 맛집 홈페이지입니다.</title>
<link rel="stylesheet" href="mystyle_2.css">
</head>

<body>
	<form action="User_list.jsp" method="post">

		<%
			request.setCharacterEncoding("utf-8");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/webdb", "root", "mgyj9029");
			String sql = "insert into user values(?,?,?,?,?,?)"; // num(pw), content, title, score, image, name

			PreparedStatement stmt = conn.prepareStatement(sql);
			String pw = request.getParameter("num");
		%>
		<div align=center>
			<div id="logo" align=center>
				<img src="img/logo.gif">
			</div>

			<div
				style="width: 640px; height: 470px; background-image: url(./img/list_bg.gif); background-repeat: no-repeat;"
				align=left>

				<div>
					<div id="main_body_4">
						<ul id="li_c">
							<li><img src="<%=request.getParameter("image")%>" width=200
								height=200></li>
						</ul>

						<ul id="li_c_2">
							<li>키워드:<%=request.getParameter("title")%></li>
							<li>내용:<%=request.getParameter("content")%></li>
							<br>
							<br>
							<br>
							<br>
							<li>가게이름:<%=request.getParameter("name")%></li>
							<li>평점:<%=request.getParameter("score")%></li>
							<br>
							<br> 후기가 등록되었습니다.

						</ul>
					</div>

				</div>

				<%
					stmt.setString(1, request.getParameter("num"));
					stmt.setString(2, request.getParameter("content"));
					stmt.setString(3, request.getParameter("title"));
					stmt.setString(4, request.getParameter("score"));
					stmt.setString(5, request.getParameter("image"));
					stmt.setString(6, request.getParameter("name"));
					stmt.executeUpdate();
				%>


				<div id="main_body_7">

					<div id="main_bo_3"></div>

					<input type="hidden" name="name"
						value="<%=request.getParameter("name")%>">
					<div id="dml_btn">
						&nbsp <input type="submit" value=""
							style="padding: 5px 0px 0px 0px; background: URL('img/btn_2.jpg'); width: 88px; height: 26px"
							onClick="this.form.action='User_list.jsp';" />

					</div>
				</div>
				<%
					stmt.close();
					conn.close();
				%>
			</div>
		</div>
	</form>
</body>
</html>