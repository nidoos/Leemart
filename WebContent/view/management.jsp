
<%@page import="model.salesVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<%
	List<salesVO> list = (List<salesVO>)request.getAttribute("list");
	String[] days = new String[7];
	int[] peoples = new int[7];
	int[] sums = new int[7];
	for(int i=0; i<days.length; i++){
		days[i] = list.get(i).getDate();
		peoples[i] =list.get(i).getPeople();
		sums[i] =list.get(i).getSum();
	}
%> 
<meta charset="utf-8">
<meta http-equiv="X-UA-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>Lee Mart</title>
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script type="text/javascript" src="./js/jquery.1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
</head>
<style type="text/css">
/* common */
.wrap {position:relative; overflow: hidden;}
.inner {max-width:1100px; height: 100%;  margin: 0 auto;}
.com_tit01 {font-family: 'NotoB'; font-size:60px; color:#fff; text-align: center;}
.com_txt01 {max-width:70%; margin:0 auto; font-family: 'NotoR'; font-size:24px; color:#fff; text-align: center;;}
.header_wrap {position: fixed; left:0; top:0; z-index:100; width:100%; height:70px; border-bottom:1px solid rgba(255,255,255,.2);}
.header_wrap .logo {margin-top:15px; padding-left:20px; font-size:24px; color:#fff;;}
.footer {position:relative; height:300px; background: #111}
.footer .text_area {position: relative; z-index: 20; padding:20px;}
.footer .text_area p {color:#fff; font-size:34px;}
.tb_row {display: table; width:100%; height: 100%;}
.tb_row .tb_cell {display: table-cell; vertical-align: middle;}

/* 텍스트 마스크 효과 */
.sec01 {position:relative; height:100vh; background: #111;}
.sec01 .nav_list {position: relative; z-index:20;}
.sec01 .nav_list .list {}
.sec01 .nav_list .list li {}
.sec01 .nav_list .list li a {overflow:hidden; position:relative; display:inline-block; font-size:140px; line-height: 1; color:#fff; transition:transform .5s;}
.sec01 .nav_list .list li a .mask {position:absolute; left:0; top:0; z-index:10; height:100%; background: #fff; animation:text_mask 2s 1 cubic-bezier(0.24, 0.77, 0.32, 0.95) both paused;}
.sec01 .nav_list .list li a .txt {position:relative; z-index:20; display: block; animation:text_opacity 2s 1s 1 cubic-bezier(0.24, 0.77, 0.32, 0.95) both paused;}
.sec01.active .nav_list .list li a .mask {animation-play-state: running;}
.sec01.active .nav_list .list li a .txt {animation-play-state: running;}

.sec01 .nav_list .list li a .mask2 {position:absolute; left:0; bottom:0; z-index:-1; width:0%; height:40%; background: #e9c400; transition:width .5s cubic-bezier(0.24, 0.77, 0.32, 0.95);}
.sec01 .nav_list .list li a:hover {transform:translateX(-10px); -webkit-transform:translateX(-10px); -moz-transform:translateX(-10px); -o-transform:translateX(-10px); -ms-transform:translateX(-10px);}
.sec01 .nav_list .list li a:hover .mask2 {width:100%;}
.sec01 .nav_list .list li a:hover {text-decoration: none;}
.sec01 .nav_list .list li a:focus {text-decoration: none;}

.sec01 .bg_rotate {position:absolute; left:50%; top:50%; z-index:10; width:1200px; height:1215px; margin-left:-357px; margin-top:-350px; background-image:url('images/bg_rotate01.png'); background-repeat: no-repeat; background-size:cover; opacity: .15; animation:rotate_bg 40s infinite linear paused;}
.sec01.active .bg_rotate {animation-play-state: running;}

@keyframes text_mask {
    0%{
        width: 0%;
        transform:translateX(0%);
    }
    50%{
        width: 100%;
        transform:translateX(0%);
    }
    100%{
        width: 100%;
        transform:translateX(101%);
    }
}

@keyframes text_opacity {
    0%{
        opacity: 0;
        color:#3535ff;
        transform:translateX(-50%);
    }
    100%{
        opacity: 1;
        color:#fff;
        transform:translateX(0%);
    }
}

@keyframes rotate_bg {
    0%{
        transform:rotate(0deg);
    }
    100%{
        transform:rotate(360deg);
    }
}

</style>
<body>
    <div class="wrap">
        <header class="header_wrap">
            <a href="/Leemart/view/main.jsp"> <div class="logo">LEE MART</div></a>
        </header>
        <section class="sec01 active">
            <article class="inner">
                <div class="tb_row">
                    <div class="tb_cell">
                        <nav class="nav_list">
                            <ul class="list">
								<div class="table-wrapper">
									<h2 align="center" style="font-size: 100px; color: #fff;">MANAGEMENT</h2>
									<table class="fl-table" style="margin-top: 50px;">
										<div class="container">
												<tr >
													<td colspan="3" bgcolor="#313131"><canvas id="myChart" style="height:25vh; width:50vw"></canvas></td>
												</tr>
												<tr >
													<td colspan="3" bgcolor="#313131"><canvas id="myChart2" style="height:25vh; width:50vw"></canvas></td>
												</tr>
												<tr>
													<td><b>날짜</b></td>
													<td><b>인원 수</b></td>
													<td><b>총 이득</b></td>
												</tr>
												<tr>
													<td><%=days[6]%></td>
													<td><%=peoples[6]%></td>
													<td><%=sums[6]%></td>
												</tr>
										</div>
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
            <div class="text_area">   
            </div>
        </footer>
    </div>

    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script> 
var ctx = document.getElementById('myChart').getContext('2d'); 
var chart = new Chart(ctx, { 
	type: 'line',data: 
	{ labels: [<%=days[5]%>,<%=days[4]%>,<%=days[3]%>,<%=days[2]%>,<%=days[1]%>,<%=days[0]%>],
		datasets: [{ 
			label: '당일 수입액', 
			backgroundColor: 'transparent', 
			borderColor: 'red',
			data: [<%=sums[5]%>,<%=sums[4]%>,<%=sums[3]%>,<%=sums[2]%>,<%=sums[1]%>,<%=sums[0]%>]
		}]
	}
});
var ctx2 = document.getElementById('myChart2').getContext('2d'); 
var chart2 = new Chart(ctx2, { 
	type: 'line',data: 
	{ labels: [<%=days[5]%>,<%=days[4]%>,<%=days[3]%>,<%=days[2]%>,<%=days[1]%>,<%=days[0]%>],
		datasets: [{ 
			label: '방문 고객 수', 
			backgroundColor: 'transparent', 
			borderColor: 'Yellow', 
			data: [<%=peoples[5]%>,<%=peoples[4]%>,<%=peoples[3]%>,<%=peoples[2]%>,<%=peoples[1]%>,<%=peoples[0]%>]
		}]
	}
});
</script>

</body>
</html>
