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
@WebServlet("/content.do")
public class ContentController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		String b_num = request.getParameter("b_num");
		MartDAO dao = new MartDAO();
		StockVO vo = dao.list(b_num);
		request.setAttribute("vo",vo);
		RequestDispatcher rd = request.getRequestDispatcher("/view/content.jsp");
		rd.forward(request, response);
		
		
	
	}

}
