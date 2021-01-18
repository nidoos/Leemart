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

		var ret = prompt("���ڵ带 �Է����ּ���");
		var res = ret.split("\n");
		if (res[0].length == 0) {
			alert("�Է��� �����ʾҽ��ϴ�.")
		} else {
			//console.log(res[0])
			console.log(res[0])
			alert("�����͸� �����߽��ϴ�.")
			name = document.getElementById('name').value;
			kind = document.getElementById('kind').value;
			count = document.getElementById('count').value;
			price = document.getElementById('price').value;
			lim_date = document.getElementById('lim').value;
			event = document.getElementById('event').value;
			var f = document.createElement("form"); // form ������Ʈ ���� 
			f.setAttribute("method", "post"); // method �Ӽ��� post�� ����
			f.setAttribute("action", "/Leemart/instock.do"); // submit���� �� ���� ������ �� ������ ����
			document.body.appendChild(f); // ���� �������� form ������Ʈ �߰� 
			var a = document.createElement("input"); // input ������Ʈ ���� 
			a.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			a.setAttribute("name", "name");
			a.setAttribute("value", name); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(a); // form ������Ʈ�� input ������Ʈ �߰� 

			var b = document.createElement("input"); // input ������Ʈ ���� 
			b.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			b.setAttribute("name", "kind");
			b.setAttribute("value", kind); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(b); // form ������Ʈ�� input ������Ʈ �߰� 
			var c = document.createElement("input"); // input ������Ʈ ���� 
			c.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			c.setAttribute("name", "b_num");
			c.setAttribute("value", res[0]); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(c); // form ������Ʈ�� input ������Ʈ �߰� 
			var d = document.createElement("input"); // input ������Ʈ ���� 
			d.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			d.setAttribute("name", "count");
			d.setAttribute("value", count); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(d); // form ������Ʈ�� input ������Ʈ �߰� 
			var e = document.createElement("input"); // input ������Ʈ ���� 
			e.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			e.setAttribute("name", "price");
			e.setAttribute("value", price); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(e); // form ������Ʈ�� input ������Ʈ �߰� 
			var g = document.createElement("input"); // input ������Ʈ ���� 
			g.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			g.setAttribute("name", "lim");
			g.setAttribute("value", lim_date); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(g); // form ������Ʈ�� input ������Ʈ �߰� 
			var h = document.createElement("input"); // input ������Ʈ ���� 
			h.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			h.setAttribute("name", "event");
			h.setAttribute("value", event); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(h); // form ������Ʈ�� input ������Ʈ �߰� 

			//console.log(name + kind + res + count + price + lim_date + event);

			f.submit(); // form �±� ����� ����
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

/* �ؽ�Ʈ ����ũ ȿ�� */
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
												<th>�̸�</th>
												<th>����</th>
												<th>����</th>
												<th>����</th>
												<th>�������</th>
												<th>�̺�Ʈ</th>
												<th>���ڵ�</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="text" id="name"></td>
												<td><select id="kind">
														<option value="none">����</option>
														<option value="snack">����</option>
														<option value="fruit">û��</option>
														<option value="bakery">����</option>
														<option value="furniture">����</option>
												</select></td>
												<td><input type="text" id="count"></td>
												<td><input type="text" id="price"></td>
												<td><input type="date" id='lim'></td>
												<td><select id="event">
														<option value="N/A">���þ���</option>
														<option value="���÷�����">1+1</option>
														<option value="����">30%</option>
												</select></td>
												<td><button onclick="insertobj()">���ڵ��Է�</button></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="table-wrapper">
									<table class="fl-table" style="margin-top: 100px;">
										<thead>
											<tr>
												<th>�̸�</th>
												<th>����</th>
												<th>���ڵ�</th>
												<th>����</th>
												<th>����</th>
												<th>�԰�¥</th>
												<th>�������</th>
												<th>�̺�Ʈ</th>
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
												alert('��������� �󸶳��� ���� ��ǰ�� �ֽ��ϴ�.');
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
