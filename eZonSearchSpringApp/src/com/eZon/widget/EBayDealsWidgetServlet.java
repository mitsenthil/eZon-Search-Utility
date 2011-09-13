package com.eZon.widget;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class EBayDealsWidgetServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		    EBayDealsReader reader = new EBayDealsReader();
		   List<DealsDO> dealsDO = reader.getDeals();
		   req.setAttribute("dealsList", dealsDO);
		
			try {
				RequestDispatcher dispatcher =
					  getServletContext().getRequestDispatcher("/dealswidget.jsp");
				dispatcher.forward(req, resp);
			} catch (ServletException e) {
				e.printStackTrace();
			}
	}
}
