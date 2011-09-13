package com.eZon.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.eZon.search.domain.ItemDO;
import com.eZon.search.strategy.FindItemStrategy;
import com.eZon.search.strategy.ItemSearchStrategy;
import com.eZon.search.strategy.SearchContext;
import com.google.appengine.repackaged.com.google.common.base.StringUtil;

public class EZonController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		
		String option = req.getParameter("option");
		String keyword = req.getParameter("kw");
		String error = null;
		
		
		
		if(StringUtil.isEmptyOrWhitespace(option)){
			error = "Please select an Option";
		}
		
		if(StringUtil.isEmptyOrWhitespace(keyword)){
			error = "Please enter a keyword";
		}
		
		Map<String,Object> attrMap = new HashMap<String, Object>();
		
		if(StringUtil.isEmptyOrWhitespace(error)){
		SearchContext context = null;
		if(option.equalsIgnoreCase("eBay")){		
			context = new SearchContext(new FindItemStrategy());
		} else{
			context = new SearchContext(new ItemSearchStrategy());
		}
		context.setKeyword(keyword);
		List<ItemDO> itemList = context.getSearchResults();
		
		
		if(itemList == null || itemList.size()==0){
			error = "Zero Results Found";
		}
		attrMap.put("itemList", itemList);
		}
		
		attrMap.put("keyword", keyword);
		attrMap.put("option", option);
		attrMap.put("error", error);
		
		return new ModelAndView("search","model",attrMap);
	}
}


