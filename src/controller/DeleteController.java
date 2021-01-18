package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MartDAO;
import model.StockVO;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_num = request.getParameter("b_num");
		System.out.println(b_num);
		MartDAO dao = new MartDAO();
		int cnt = dao.del_s(b_num);
		if(cnt>0) {
			response.sendRedirect("/Leemart/list.do");
		}else {
			throw new ServletException("error");
		}
	
			
	}

}
