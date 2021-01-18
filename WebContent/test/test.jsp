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
		var rfid = prompt("결제할 rfid번호 입력");
		if(rfid == ""){
			alert("rfid 번호를 입력해주세요");
		}else{
			var f = document.createElement("form"); // form 엘리멘트 생성 
			f.setAttribute("method", "post"); // method 속성을 post로 설정
			f.setAttribute("action", "/Leemart/cal.do"); // submit했을 때 무슨 동작을 할 것인지 설정
			document.body.appendChild(f); // 현재 페이지에 form 엘리멘트 추가
			var a = document.createElement("input"); // input 엘리멘트 생성 
			a.setAttribute("type", "hidden"); // type 속성을 hidden으로 설정
			a.setAttribute("name", "rfid");
			a.setAttribute("value", rfid); // value 속성을 neilong에 담겨있는 값으로 설정 
			f.appendChild(a);
			f.submit();
		}
		
	}
</script>
</head>
<body>
	<input type = button value = "weblist" onclick ="weblistFn()">
	
	<button onclick="cal()">결제</button>


</body>
</html>