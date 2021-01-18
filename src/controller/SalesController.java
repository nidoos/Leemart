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
import model.salesVO;

//�ֱ� ��ĥ���� ��Ʈ ���� ������ �������� ����
@WebServlet("/salelist")
public class SalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/view/management.jsp");
		MartDAO dao = new MartDAO();
		List<salesVO> list = dao.getSales();
		request.setAttribute("list", list);
		rd.forward(request, response);
	}
}