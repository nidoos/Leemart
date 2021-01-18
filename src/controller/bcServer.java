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

/// ��ǰ ���ڵ� �ν� ó�� Servlet 
@WebServlet("/bacode")
public class bcServer extends HttpServlet {
	Calendar calender = Calendar.getInstance();
	int total = 0; //��Ż ��
	int time=0; // �� ��(����, ȯ�� üũ��)
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
		if(cal.getEvent() != null) {//�̺�Ʈ ó�� ���ǹ�
			if(cal.getEvent().equals("���÷�����")) {
				int cnt = cal.getCount();
				int pr = cal.getPrice();
				System.out.print(cnt+pr);
				cal.setTotal(cnt*pr);
				cal.setCount(cal.getCount()+1);
				System.out.println("���ÿ�"+cal.toString());
			}
			else if(cal.getEvent().equals("����")) {
				cal.setPrice((int)(cal.getPrice()*0.7));
				int cnt = cal.getCount();
				int pr = cal.getPrice();
				cal.setTotal(cnt*pr);
				System.out.println("����"+cal.toString());
			}
		}
		System.out.println(cal.toString());
		//��ǰ ���� ���� �ڵ����
		if(cal.getKind() == null | cal.getName() ==null | cal.getPrice() == 0) {
			out.print("Dont exist Object");}
		else {
			System.out.println(t_time +" "+time);
			if(calda.searCal(cal)) { // ������Ʈ
				int cnt =1;
				System.out.println("������Ʈ!!");
				if(time ==0) {
					System.out.println("�ʱ�ȭ");
				}
				else if(t_time -time >1) {
					System.out.println("��ǰ..");
					cnt =-1; 
				}else {
					System.out.println("�߰� ����!!");
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
