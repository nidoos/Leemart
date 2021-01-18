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
	var f = document.createElement("form"); // form 엘리멘트 생성 
	f.setAttribute("method", "post"); // method 속성을 post로 설정
	f.setAttribute("action", "/Leemart/final.do"); // submit했을 때 무슨 동작을 할 것인지 설정
	document.body.appendChild(f); // 현재 페이지에 form 엘리멘트 추가
	var a = document.createElement("input"); // input 엘리멘트 생성 
	a.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
	a.setAttribute("name", "rfid");
	a.setAttribute("value", <%=rfid%>); // value 속성을 neilong에 담겨있는 값으로 설정
	f.appendChild(a);
	f.submit();
	
}

</script>



<body>
	<table border="1px">
	<tr>
		<td>이름</td>
		<td>수량</td>
		<td>가격</td>
		<td>총액</td>
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
	<td colspan="2" align = "right"><button onclick="final_c()">결제</button></td>
	
	</tr>
	</table>
	
	
	
</body>
</html>