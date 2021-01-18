package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MartDAO;
import model.StockVO;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		MartDAO dao = new MartDAO();
		List<StockVO> list = dao.getAllList();
//		for(int i = 0; i<list.size(); i++) {
//			System.out.println(list.get(i).toString());
//		}
		RequestDispatcher rd = request.getRequestDispatcher("/view/inventory.jsp");
		request.setAttribute("list", list);
		rd.forward(request, response);
	}
}
