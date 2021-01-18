package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CalVO;
import model.MartDAO;
@WebServlet("/cal.do")
public class CalculateController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
		String rfid = request.getParameter("rfid");
		//�̸� ���� ����
		MartDAO dao = new MartDAO();
		List<CalVO> list=new ArrayList<CalVO>();
		RequestDispatcher rd = request.getRequestDispatcher("/view/payment.jsp");
		list= dao.cal(rfid);	
		request.setAttribute("list", list);
		request.setAttribute("rfid",rfid);
		rd.forward(request, response);
		/* if(dao.use_rf(rfid)) { */
			
		/*}else
		{
			response.getWriter().print("<script type=\"text/javascript\">");
			response.getWriter().print("alert(\"�������� RFID ������ �ƴմϴ�!!\"); location.href = \"/Leemart/view/main.jsp\";");
			response.getWriter().print("</script>");
		}*/
	}
}
