<%@page import="model.CalVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List"%>
<%
	List<CalVO> list = (List<CalVO>) request.getAttribute("list");
	String rfid = (String)request.getAttribute("rfid");
	int total=0;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function final_c(){
	var f = document.createElement("form"); // form ������Ʈ ���� 
	f.setAttribute("method", "post"); // method �Ӽ��� post�� ����
	f.setAttribute("action", "/Leemart/final.do"); // submit���� �� ���� ������ �� ������ ����
	document.body.appendChild(f); // ���� �������� form ������Ʈ �߰�
	var a = document.createElement("input"); // input ������Ʈ ���� 
	a.setAttribute("type", "hidden"); // type �Ӽ��� hidden���� ����
	a.setAttribute("name", "rfid");
	a.setAttribute("value", <%=rfid%>); // value �Ӽ��� neilong�� ����ִ� ������ ����
	f.appendChild(a);
	f.submit();
	
}

</script>



<body>
	<table border="1px">
	<tr>
		<td>�̸�</td>
		<td>����</td>
		<td>����</td>
		<td>�Ѿ�</td>
	</tr>
	<%for (CalVO vo : list) {
		%>
	
	<tr>
		<td><%=vo.getName()%></td>
		<td><%=vo.getPrice()%></td>
		<td><%=vo.getCount()%></td>
		<td><%=vo.getPrice()*vo.getCount() %></td>
		<%total+=vo.getPrice()*vo.getCount();%>
	</tr>
	<%}%>
	
	<tr>
	<td colspan=2 align="right" id ="toto"><%=total%></td>
	<td colspan="2" align = "right"><button onclick="final_c()">����</button></td>
	
	</tr>
	</table>
	
	
	
</body>
</html>