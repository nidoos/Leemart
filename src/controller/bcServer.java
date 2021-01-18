package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CalVO;
import model.MartDAO;

/// 물품 바코드 인식 처리 Servlet 
@WebServlet("/bacode")
public class bcServer extends HttpServlet {
	Calendar calender = Calendar.getInstance();
	int total = 0; //토탈 값
	int time=0; // 분 값(구매, 환불 체크용)
	MartDAO calda = new MartDAO();
	CalVO cal = new CalVO();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String bacode = request.getParameter("b_num");
		String r_num = request.getParameter("r_num");
		int t_time = Integer.parseInt(request.getParameter("time"));
		cal = calda.selStock(bacode,r_num);
		cal.setB_num(bacode);
		cal.setR_num(r_num);
		if(cal.getEvent() != null) {//이벤트 처리 조건문
			if(cal.getEvent().equals("원플러스원")) {
				int cnt = cal.getCount();
				int pr = cal.getPrice();
				System.out.print(cnt+pr);
				cal.setTotal(cnt*pr);
				cal.setCount(cal.getCount()+1);
				System.out.println("원플원"+cal.toString());
			}
			else if(cal.getEvent().equals("할인")) {
				cal.setPrice((int)(cal.getPrice()*0.7));
				int cnt = cal.getCount();
				int pr = cal.getPrice();
				cal.setTotal(cnt*pr);
				System.out.println("할인"+cal.toString());
			}
		}
		System.out.println(cal.toString());
		//제품 정보 리턴 코드시작
		if(cal.getKind() == null | cal.getName() ==null | cal.getPrice() == 0) {
			out.print("Dont exist Object");}
		else {
			System.out.println(t_time +" "+time);
			if(calda.searCal(cal)) { // 업데이트
				int cnt =1;
				System.out.println("업데이트!!");
				if(time ==0) {
					System.out.println("초기화");
				}
				else if(t_time -time >1) {
					System.out.println("반품..");
					cnt =-1; 
				}else {
					System.out.println("추가 구매!!");
				}
				if(calda.upcal(cal, cnt)>0) {
					total+= cal.getTotal();
					out.print(cal.getName()+" "+cal.getPrice()+" "+cal.getEvent());
					out.print(","+total);
				}else {
					total+= cal.getTotal();
					out.print(cal.getName()+" "+cal.getPrice()+" "+cal.getEvent());
					out.print(","+total);
				}
			}
			else if(cal.getName().equals("Exit")) {
				out.print(cal.getName()+" "+cal.getPrice()+" "+cal.getEvent());
			}
			else { //
				System.out.println("Insert!!");
				if(calda.incal(cal)>0) {
					total+= cal.getPrice();
					out.print(cal.getName()+" "+cal.getPrice()+" "+cal.getEvent());
					out.print(","+total);
				}else {
					total+= cal.getPrice();
					out.print(total);
				}
			}
			time = t_time;
		}
//		 if(calda.insObj(bacode)) { 
//			 System.out.println("ok"); 
//		 }
//		 
	}	
}
