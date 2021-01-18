package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MartDAO;
import model.StockVO;

@WebServlet("/up.do")
public class UpdateController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("b_num");
		int count = Integer.parseInt(request.getParameter("count"));
		int price = Integer.parseInt(request.getParameter("price"));
		String event = request.getParameter("event");
		System.out.println(event);
		MartDAO dao = new MartDAO();
		StockVO vo = new StockVO();
		vo.setB_num(name);
		vo.setCount(count);
		vo.setPrice(price);
		vo.setEvent(event);
		int cnt = dao.up_s(vo);
		if(cnt>0) {
			response.sendRedirect("/Leemart/list.do");
		}else {
			 throw new ServletException("error");
		}
	}

}
