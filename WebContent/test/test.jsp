<%@page import="model.CalVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	CalVO vo = (CalVO)request.getAttribute("vo");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

	function weblistFn(num){
		location.href="/Leemart/list.do";
	}
	
	function cal(){
		var rfid = prompt("������ rfid��ȣ �Է�");
		if(rfid == ""){
			alert("rfid ��ȣ�� �Է����ּ���");
		}else{
			var f = document.createElement("form"); // form ������Ʈ ���� 
			f.setAttribute("method", "post"); // method �Ӽ��� post�� ����
			f.setAttribute("action", "/Leemart/cal.do"); // submit���� �� ���� ������ �� ������ ����
			document.body.appendChild(f); // ���� �������� form ������Ʈ �߰�
			var a = document.createElement("input"); // input ������Ʈ ���� 
			a.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
			a.setAttribute("name", "rfid");
			a.setAttribute("value", rfid); // value �Ӽ��� neilong�� ����ִ� ������ ���� 
			f.appendChild(a);
			f.submit();
		}
		
	}
</script>
</head>
<body>
	<input type = button value = "weblist" onclick ="weblistFn()">
	
	<button onclick="cal()">����</button>


</body>
</html>