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

<body>

	<table border="1px">
		<tr>
			<td>�̸�</td>
			<td>����</td>
			<td>����</td>
			<td>����</td>
			<td>�������</td>

			<td>�̺�Ʈ</td>
			<td rowspan="2"><button onclick="insertobj()">���ڵ� �Է�</button></td>
		</tr>

		<tr>
			<td><input type=text id="name"></td>
			<td><select id="kind">
					<option value="none">����</option>
					<option value="snack">����</option>
					<option value="fruit">û��</option>
					<option value="bakery">����</option>
					<option value="furniture">����</option>
			</select></td>
			<td><input type=text id="count"></td>
			<td><input type=text id="price"></td>
			<td><input type='date' id='lim'></td>
			<td><select id="event">
					<option value="null">���þ���</option>
					<option value="���÷�����">1+1</option>
					<option value="����">30%</option>
			</select></td>

		</tr>

	</table>




	<table border="1px">

		<tr>
			<td>�̸�</td>
			<td>����</td>
			<td>���ڵ�</td>
			<td>����</td>
			<td>����</td>
			<td>�԰�¥</td>
			<td>�������</td>
			<td>�̺�Ʈ</td>
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
			alert('��������� �󸶳��� ���� ��ǰ�� �ֽ��ϴ�.');
		</script>
		<%
			}
		%>

	</table>
	
	

</body>
</html>