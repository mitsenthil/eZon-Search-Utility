package com.eZon.goldrate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoldRateServlet extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		List<String> rateList = GoldRateFeedReader.getGoldRate();
		PrintWriter out = response.getWriter();
		
		out.print("<br/>");
		out.print("<b>");
		out.print("Updated on:");
		out.print("</b>");
		out.print(rateList.get(0));		
		for(int i=1;i<rateList.size();i++){
		out.print("<br/>");
		out.println(rateList.get(i));
		}
	}
}
