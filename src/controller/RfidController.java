package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MartDAO;

@WebServlet("/rfid")
public class RfidController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String r_num = request.getParameter("rfid");
		MartDAO dao = new MartDAO();
		if (dao.sel_rfid(r_num)) {
			response.getWriter().print("able");
			dao.upd_rfid(r_num);
			} else {
				response.getWriter().print("Using");

			}
		}
	}
