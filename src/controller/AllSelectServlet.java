package controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import model.MartDAO;

@WebServlet("/cart")
public class AllSelectServlet extends HttpServlet {
	MartDAO dao = new MartDAO();
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String rfid = request.getParameter("rfid");
		String check = dao.allSelect(rfid);
		PrintWriter out = response.getWriter();
		System.out.println(check);
		out.print(check);
		
	}
}