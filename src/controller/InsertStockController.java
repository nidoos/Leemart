package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MartDAO;
import model.StockVO;

@WebServlet("/instock.do")
public class InsertStockController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");	
		
		String name=request.getParameter("name");
		String kind = request.getParameter("kind");
		String b_num = request.getParameter("b_num").toString();
		System.out.println(b_num.length());
		int count=Integer.parseInt(request.getParameter("count"));
		int price=Integer.parseInt(request.getParameter("price"));
		String event = request.getParameter("event");
		String lim_date = request.getParameter("lim");
		int cnt=0;
		
		//System.out.println(name+kind+b_num+count+price+event+lim_date);
		
		StockVO vo = new StockVO(name, kind, b_num, count, price,event,lim_date);
		
		//System.out.println(vo.toString());
		
		MartDAO dao = new MartDAO();
		if(kind.equals("furniture")) {
			cnt = dao.ins_f(vo);
			if(cnt>0) {
				response.sendRedirect("/Leemart/list.do");
			}else {
				throw new ServletException("error");	//서버예외
			}
		}else {
			cnt= dao.ins_s(vo);
			if(cnt>0) {
				response.sendRedirect("/Leemart/list.do");
			}else {
				throw new ServletException("error");	//서버예외
			}
		}
		
		
		
		
	}
	

}
