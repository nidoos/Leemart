package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;

import model.MartDAO;
import model.StockVO;

@WebServlet("/place.do")
public class PlaceController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		MartDAO dao = new MartDAO();
		StockVO vo = new StockVO(name);
		vo = dao.place(vo);
		String kind = vo.getKind();
		System.out.println(kind);
		response.getWriter().print(kind);

	}

}
