<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="model.StockVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	List<StockVO> list = (List<StockVO>) request.getAttribute("list");
boolean ok = false;
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>Lee Mart</title>
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script type="text/javascript" src="./js/jquery.1.12.4.js"></script>
<script>
	document.getElementById('lim').value = new Date().toISOString().substring(0, 10);
</script>
</head>
<script type="text/javascript">
	function insertobj() {

		var ret = prompt("바코드를 입력해주세요");
		var res = ret.split("\n");
		if (res[0].length == 0) {
			alert("입력을 하지않았습니다.")
		} else {
			//console.log(res[0])
			console.log(res[0])
			alert("데이터를 전송했습니다.")
			name = document.getElementById('name').value;
			kind = document.getElementById('kind').value;
			count = document.getElementById('count').value;
			price = document.getElementById('price').value;
			lim_date = document.getElementById('lim').value;
			event = document.getElementById('event').value;
			var f = document.createElement("form"); // form 엘리멘트 생성 
			f.setAttribute("method", "post"); // method 속성을 post로 설정
			f.setAttribute("action", "/Leemart/instock.do"); // submit했을 때 무슨 동작을 할 것인지 설정
			document.body.appendChild(f); // 현재 페이지에 form 엘리멘트 추가 
			var a = document.createElement("input"); // input 엘리멘트 생성 
			a.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			a.setAttribute("name", "name");
			a.setAttribute("value", name); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(a); // form 엘리멘트에 input 엘리멘트 추가 

			var b = document.createElement("input"); // input 엘리멘트 생성 
			b.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			b.setAttribute("name", "kind");
			b.setAttribute("value", kind); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(b); // form 엘리멘트에 input 엘리멘트 추가 
			var c = document.createElement("input"); // input 엘리멘트 생성 
			c.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			c.setAttribute("name", "b_num");
			c.setAttribute("value", res[0]); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(c); // form 엘리멘트에 input 엘리멘트 추가 
			var d = document.createElement("input"); // input 엘리멘트 생성 
			d.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			d.setAttribute("name", "count");
			d.setAttribute("value", count); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(d); // form 엘리멘트에 input 엘리멘트 추가 
			var e = document.createElement("input"); // input 엘리멘트 생성 
			e.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			e.setAttribute("name", "price");
			e.setAttribute("value", price); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(e); // form 엘리멘트에 input 엘리멘트 추가 
			var g = document.createElement("input"); // input 엘리멘트 생성 
			g.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			g.setAttribute("name", "lim");
			g.setAttribute("value", lim_date); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(g); // form 엘리멘트에 input 엘리멘트 추가 
			var h = document.createElement("input"); // input 엘리멘트 생성 
			h.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			h.setAttribute("name", "event");
			h.setAttribute("value", event); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(h); // form 엘리멘트에 input 엘리멘트 추가 

			//console.log(name + kind + res + count + price + lim_date + event);

			f.submit(); // form 태그 서브밋 실행
		}

	}
</script>
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
	background-image: url('./images/bg_rotate01.png');
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
									<table class="fl-table" style="margin-top: 100px;" >
										<thead>
											<tr>
												<th>이름</th>
												<th>종류</th>
												<th>개수</th>
												<th>가격</th>
												<th>유통기한</th>
												<th>이벤트</th>
												<th>바코드</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" id="name"></td>
												<td><select id="kind">
														<option value="none">선택</option>
														<option value="snack">과자</option>
														<option value="fruit">청과</option>
														<option value="bakery">제과</option>
														<option value="furniture">가구</option>
												</select></td>
												<td><input type="text" id="count"></td>
												<td><input type="text" id="price"></td>
												<td><input type="date" id='lim'></td>
												<td><select id="event">
														<option value="N/A">선택안함</option>
														<option value="원플러스원">1+1</option>
														<option value="할인">30%</option>
												</select></td>
												<td><button onclick="insertobj()">바코드입력</button></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="table-wrapper">
									<table class="fl-table" style="margin-top: 100px;">
										<thead>
											<tr>
												<th>이름</th>
												<th>종류</th>
												<th>바코드</th>
												<th>가격</th>
												<th>개수</th>
												<th>입고날짜</th>
												<th>유통기한</th>
												<th>이벤트</th>
											</tr>
										</thead>

										<tbody>
											<%
												for (StockVO vo : list) {
											%>
											<%
												SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
											Date lim_date = fm.parse(vo.getLim_date());
											Date now = new Date();
											%>
											<%
												if (lim_date.compareTo(now) < 0) {
												ok = true;
											}
											%>
											<tr >
												<td><a
													href="/Leemart/content.do?b_num=<%=vo.getB_num()%>"><%=vo.getName()%></a></td>
												<td><%=vo.getKind()%></td>
												<td><%=vo.getB_num()%></td>
												<td><%=vo.getPrice()%></td>
												<td><%=vo.getCount()%></td>
												<td><%=vo.getIn_date()%></td>
												<td><%=vo.getLim_date()%></td>
												<td><%=vo.getEvent()%></td>
											</tr>
											<%
												}
											%>
											<%
												if (ok) {
											%>
											<script>
												alert('유통기한이 얼마남지 않은 상품이 있습니다.');
											</script>
											<%
												}
											%>
										<tbody>
									</table>
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
