<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>서울 맛집 홈페이지입니다.</title>
<link rel="stylesheet" href="mystyle_2.css">

</head>

<body>
	<A name="top"></A>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<form action="search_result.jsp" method="post">


		<div align=center>

			<div id="logo" align=center>
				<img src="img/logo.gif">
			</div>
			<div id="se">
				<div id="main_body_5">

					<table>

						<tr>

							<td><input type="text" name="searchKey" value="키워드 검색"
								size="38"></td>

							<td><input type="submit" value=""
								style="padding: 5px 0px 0px 0px; background: URL('img/search_btn.gif'); width: 46px; height: 26px"
								onClick="this.form.action='search_result.jsp';" /></td>

							<td style="padding: 0px 0px 0px 0px"><img src="img/k1.gif"
								font size=3 title="ex) 여기 콘센트 짱 많아 / 서비스 좋다"></td>
						</tr>
					</table>

				</div>

			</div>
			<br> <br>
	</form>

	<div id="main_menu">
		<form method="post">
			<input type="submit" value="강남구" name="searchSection"
				title="강남구/서초구/송파구/강동구" style="width: 104px; height: 33px;" /> <input
				type="submit" value="강서구" name="searchSection"
				title="강서구/영등포구/관악구/구로구/금천구" style="width: 104px; height: 33px" />
			<input type="submit" value="강북구" name="searchSection"
				title="강북구/동대문구/성북구/광진구/중랑구" style="width: 104px; height: 33px" />
			<input type="submit" value="종로구" name="searchSection"
				title="종로구/서대문구/마포구/은평구/용산구" style="width: 104px; height: 33px" />


		</form>
	</div>


	<%
		request.setCharacterEncoding("euc-kr");
		Class.forName("com.mysql.jdbc.Driver");
		String searchSection = request.getParameter("searchSection");

		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/webdb", "root", "mgyj9029");
		Statement stmt = conn.createStatement();

		String sql = "select * from eatery where section in('강남구','서초구','송파구','강동구')";

		if (searchSection != null) {
			if (searchSection.equals("강남구"))
				sql = "select * from eatery where section in('강남구','서초구','송파구','강동구')";
			else if (searchSection.equals("강서구"))
				sql = "select * from eatery where section in ('강서구','영등포구','관악구','구로구','금천구')";
			else if (searchSection.equals("강북구"))
				sql = "select * from eatery where section in ('강북구','동대문구','성북구','광진구','중랑구')";
			else if (searchSection.equals("종로구"))
				sql = "select * from eatery where section in ('종로구','서대문구','마포구','은평구','용산구')";
		}

		ResultSet rs = stmt.executeQuery(sql);
	%>

	<div style="width: 643px;" align=left>

		<div id="main_body_6">
			<img src="img/chocho.jpg">
		</div>


		<%
			while (rs.next()) {
		%>


		<div id="main_body">

			<a href="User_list.jsp"><img src=<%=rs.getString("image")%>></a>
		</div>

		<ul id="li_a">
			<li>주소:<%=rs.getString("address")%></li>
			<li>가게 이름:<%=rs.getString("name")%></li>
			<li>번호:<%=rs.getString("phone")%></li>
		</ul>



		<div
			style="width: 643px; height: 245px; background-image: url(./img/main_bg.jpg); background-repeat: no-repeat;"
			align=left></div>



		<%
			}
		%>





		<div id="main_bo_1"></div>

		<div>
			<div>
				<img src="img/main_chu_2.jpg">
				<%
					String sql2 = "select * from things_to_see where section in('강남구','서초구','송파구','강동구')";
					if (searchSection != null) {
						if (searchSection.equals("강남구"))
							sql2 = "select * from things_to_see where section in('강남구','서초구','송파구','강동구')";
						else if (searchSection.equals("강서구"))
							sql2 = "select * from things_to_see where section in ('강서구','영등포구','관악구','구로구','금천구')";
						else if (searchSection.equals("강북구"))
							sql2 = "select * from things_to_see where section in ('강북구','동대문구','성북구','광진구','중랑구')";
						else if (searchSection.equals("종로구"))
							sql2 = "select * from things_to_see where section in ('종로구','서대문구','마포구','은평구','용산구')";
					}
					ResultSet rs2 = stmt.executeQuery(sql2);
				%>
				<div id="main_body_6">

					<%
						while (rs2.next()) {
					%>


					<div id="bol">

						<div>
							&nbsp;
							<button type="button" title="test"
								style="background: URL('<%=rs2.getString("image")%>'); width:136px; height: 98px"
								onclick="location.href='<%=rs2.getString("link")%>'"></button>
							&nbsp;
						</div>
						<div id="text_1">
							<tr>
								<td><%=rs2.getString("name")%></td>
							</tr>
						</div>

					</div>
				</div>

				<%
					}

					rs2.close();
					rs.close();
					stmt.close();
					conn.close();
				%>


				<div
					style="width: 643px; height: 245px; background-image: url(./img/main_chu_3.jpg); background-repeat: no-repeat;"
					align=left></div>
			</div>
		</div>
	</div>
	</div>
	<p align=center>
		<A href="#top">Top</A>
	</p>


</body>
</html>