package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CalVO;
import model.MartDAO;
@WebServlet("/final.do")
public class FinalCalController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rfid = request.getParameter("rfid");
		int total=0;
		MartDAO dao = new MartDAO();
		List<CalVO> list = dao.cal(rfid);
		for(CalVO vo:list) {
			total += vo.getPrice()*vo.getCount();
			if(dao.down_s(vo)>0) {
				continue;
			}else {
				System.out.println("계산오류");
				break;
			}
		}
		System.out.println(total);
		dao.up_rfid(rfid);
		if(dao.saleday()) { // 업데이트
			System.out.println("오늘의 손님~!!");
			dao.up_sal(total);
		}else { // 인서트
			System.out.println("첫번쨰 손님!!!");
			dao.in_sal(total);
		}
		if(dao.del_c(rfid) > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("/cal.do");
			request.setAttribute("rfid", rfid);
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/cal.do");
			request.setAttribute("rfid", rfid);
			rd.forward(request, response);
		}
		
		
	}
}
