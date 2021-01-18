<%@page import="model.StockVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	List<StockVO> list = (List<StockVO>) request.getAttribute("list");
boolean ok = false;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<body>

	<table border="1px">
		<tr>
			<td>이름</td>
			<td>종류</td>
			<td>개수</td>
			<td>가격</td>
			<td>유통기한</td>

			<td>이벤트</td>
			<td rowspan="2"><button onclick="insertobj()">바코드 입력</button></td>
		</tr>

		<tr>
			<td><input type=text id="name"></td>
			<td><select id="kind">
					<option value="none">선택</option>
					<option value="snack">과자</option>
					<option value="fruit">청과</option>
					<option value="bakery">제과</option>
					<option value="furniture">가구</option>
			</select></td>
			<td><input type=text id="count"></td>
			<td><input type=text id="price"></td>
			<td><input type='date' id='lim'></td>
			<td><select id="event">
					<option value="null">선택안함</option>
					<option value="원플러스원">1+1</option>
					<option value="할인">30%</option>
			</select></td>

		</tr>

	</table>




	<table border="1px">

		<tr>
			<td>이름</td>
			<td>종류</td>
			<td>바코드</td>
			<td>가격</td>
			<td>개수</td>
			<td>입고날짜</td>
			<td>유통기한</td>
			<td>이벤트</td>
		</tr>


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
		<tr>
			<td><a href="/Leemart/content.do?b_num=<%=vo.getB_num()%>"><%=vo.getName()%></a></td>
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

	</table>
	
	

</body>
</html>