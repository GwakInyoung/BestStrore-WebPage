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

	<!-- enctype="multipart/form-data" -->
	<form action="User_add.jsp" method="post"
		onsubmit="return validLogin();">
		<div align=center>

			<div id="logo" align=center>
				<img src="img/logo.gif">
			</div>


			<div
				style="width: 640px; height: 470px; background-image: url(./img/list_bg.gif); background-repeat: no-repeat;"
				align=left>


				<div>

					<ul id="li_d">

						<div id="main_body_5">

							<table>
								<tr>
									<td>키워드 : <input type="text" name="title" size="52"></td>
									<td style="padding: 0px 0px 0px 0px"><img src="img/k1.gif"
										font size=3 title="ex) 여기 콘센트 짱 많아 / 서비스 좋다"></td>
								</tr>
								<td></td>
								<tr>
									<td>첨부 : &nbsp;&nbsp;&nbsp; <input type="file"
										name="image" size="36"></td>
								</tr>
								<td></td>
								<tr>

									<td>내용 : &nbsp;&nbsp;&nbsp; <textarea rows="8" cols="40"
											type="text" name="content"></textarea></td>
								</tr>
								<td></td>
								<tr>
									<td>가게이름 : &nbsp;&nbsp;&nbsp; <input type="text"
										name="name" size="45"></td>
								</tr>
								<td></td>
								<tr>
									<td>평점 : &nbsp;&nbsp;&nbsp; <select name="score">
											<option>좋아요!</option>
											<option>보통이요!</option>
											<option>싫어요!</option>
									</select>
									</td>
								</tr>
								<td></td>
								<tr>
									<td>글 비밀번호 : &nbsp;&nbsp;&nbsp; <input type="password"
										name="num" size="10"></td>
								</tr>
							</table>
						</div>

					</ul>
				</div>

				<div id="main_body">

					<div id="main_bo_4"></div>

					<input type="submit" value=""
						style="padding: 5px 0px 0px 0px; background: URL('img/write_btn.gif'); width: 46px; height: 26px"
						onClick="this.form.action='User_add.jsp';" />


				</div>
			</div>

		</div>

	</form>

</body>
</html>