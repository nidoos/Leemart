<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.StockVO"%>
<%@page import="java.util.List"%>

<%
	StockVO vo =(StockVO) request.getAttribute("vo");

%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>Lee Mart</title>
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script type="text/javascript" src="./js/jquery.1.12.4.js"></script>
<script type="text/javascript">
	function deleteFn(num){
		location.href="/Leemart/delete.do?b_num="+num;
	}
</script>
</head>
<style type="text/css">
/* common */
.wrap {
	position: relative;
	overflow: hidden;
}

.inner {
	max-width: 1100px;
	height: 100%;
	margin: 0 auto;
}

.com_tit01 {
	font-family: 'NotoB';
	font-size: 60px;
	color: #fff;
	text-align: center;
}

.com_txt01 {
	max-width: 70%;
	margin: 0 auto;
	font-family: 'NotoR';
	font-size: 24px;
	color: #fff;
	text-align: center;;
}

.header_wrap {
	position: fixed;
	left: 0;
	top: 0;
	z-index: 100;
	width: 100%;
	height: 70px;
	border-bottom: 1px solid rgba(255, 255, 255, .2);
}

.header_wrap .logo {
	margin-top: 15px;
	padding-left: 20px;
	font-size: 24px;
	color: #fff;;
}

.footer {
	position: relative;
	height: 300px;
	background: #111
}

.footer .text_area {
	position: relative;
	z-index: 20;
	padding: 20px;
}

.footer .text_area p {
	color: #fff;
	font-size: 34px;
}

.tb_row {
	display: table;
	width: 100%;
	height: 100%;
}

.tb_row .tb_cell {
	display: table-cell;
	vertical-align: middle;
}

/* 텍스트 마스크 효과 */
.sec01 {
	position: relative;
	height: 100vh;
	background: #111;
}

.sec01 .nav_list {
	position: relative;
	z-index: 20;
}

.sec01 .nav_list .list {
	
}

.sec01 .nav_list .list li {
	
}

.sec01 .nav_list .list li a {
	overflow: hidden;
	position: relative;
	display: inline-block;
	font-size: 140px;
	line-height: 1;
	color: #fff;
	transition: transform .5s;
}

.sec01 .nav_list .list li a .mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 10;
	height: 100%;
	background: #fff;
	animation: text_mask 2s 1 cubic-bezier(0.24, 0.77, 0.32, 0.95) both
		paused;
}

.sec01 .nav_list .list li a .txt {
	position: relative;
	z-index: 20;
	display: block;
	animation: text_opacity 2s 1s 1 cubic-bezier(0.24, 0.77, 0.32, 0.95)
		both paused;
}

.sec01.active .nav_list .list li a .mask {
	animation-play-state: running;
}

.sec01.active .nav_list .list li a .txt {
	animation-play-state: running;
}

.sec01 .nav_list .list li a .mask2 {
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: -1;
	width: 0%;
	height: 40%;
	background: #e9c400;
	transition: width .5s cubic-bezier(0.24, 0.77, 0.32, 0.95);
}

.sec01 .nav_list .list li a:hover {
	transform: translateX(-10px);
	-webkit-transform: translateX(-10px);
	-moz-transform: translateX(-10px);
	-o-transform: translateX(-10px);
	-ms-transform: translateX(-10px);
}

.sec01 .nav_list .list li a:hover .mask2 {
	width: 100%;
}

.sec01 .nav_list .list li a:hover {
	text-decoration: none;
}

.sec01 .nav_list .list li a:focus {
	text-decoration: none;
}

.sec01 .bg_rotate {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 10;
	width: 1200px;
	height: 1215px;
	margin-left: -357px;
	margin-top: -350px;
	background-image: url('images/bg_rotate01.png');
	background-repeat: no-repeat;
	background-size: cover;
	opacity: .15;
	animation: rotate_bg 40s infinite linear paused;
}

.sec01.active .bg_rotate {
	animation-play-state: running;
}

@
keyframes text_mask { 0%{
	width: 0%;
	transform: translateX(0%);
}

50%
{
width : 100%;
transform : translateX(0%);
}
100%{
width:100%;
transform:translateX(101%);
}
}
@keyframes text_opacity { 0%{
	opacity: 0;
	color: #3535ff;
	transform: translateX(-50%);
}

100%{
opacity:1;
color:#fff;
transform:translateX(0%);
}
}
@keyframes rotate_bg { 0%{
	transform: rotate(0deg);
}
100%{
transform:rotate(360deg);
}
}
</style>
<body>

	<div class="wrap">
		<header class="header_wrap">
			<a href="/Leemart/view/main.jsp">
				<div class="logo">LEE MART</div>
			</a>
		</header>
		<section class="sec01 active">
			<article class="inner">
				<div class="tb_row">
					<div class="tb_cell">
						<nav class="nav_list">
							<ul class="list">
								<div class="table-wrapper">
									<h2 align="center" style="font-size: 100px; color: #fff;">INVENTORY</h2>
									<form action="/Leemart/up.do?">
									<input type = hidden name = "b_num"value = <%=vo.getB_num() %>>
									<table class="fl-table" style="margin-top: 100px;" >
										<tbody>
												<tr>
													<td>이름</td>
													<td colspan="2"><%=vo.getName() %></td>
												</tr>
												<tr>
													<td>종류</td>
													<td colspan="2"><%=vo.getKind() %></td>
												</tr>
												<tr>
													<td>개수</td>
													<td colspan="2"><input type="text" style="text-align: center"   value="<%=vo.getCount() %>" name = "count"></td>
												</tr>
												<tr>
													<td>가격</td>
													<td colspan="2"><input type="text" style="text-align: center"   value="<%=vo.getPrice() %>" name = "price"></td>
												</tr>
												<tr>
													<td>유통기한</td>
													<td colspan="2"><%=vo.getLim_date() %></td>
												</tr>
												<tr>
													<td>이벤트</td>
													<td colspan="2"><select name="event">
														<option value="N/A">선택안함</option>
														<option value="원플러스원">1+1</option>
														<option value="할인">30%</option>
												</select></td>
												</tr>
												<tr>
													<td>바코드</td>
													<td colspan="2"><%=vo.getB_num() %></td>
												</tr>
												<tr>
												<td></td>
												<td align="right"><input type = "submit" value = "수정"></td>
												<td><input type = button value = "삭제" onclick ="deleteFn(<%=vo.getB_num() %>)"></td>
												</tr>
											
											</tbody>
									</table>
										</form>
								</div>
							</ul>
						</nav>
					</div>
				</div>
				<div class="bg_rotate"></div>
			</article>
		</section>
		<footer class="footer">
			<div class="text_area"></div>
		</footer>
	</div>

</body>
</html>
