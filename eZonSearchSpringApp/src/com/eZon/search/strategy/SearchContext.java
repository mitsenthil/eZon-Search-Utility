package com.eZon.search.strategy;

import java.util.List;

import com.eZon.search.domain.ItemDO;

public class SearchContext {
	
	private SearchStrategy strategy;
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public SearchContext(SearchStrategy strategy) {
		this.strategy = strategy;
	}
	
	public List<ItemDO> getSearchResults(){
		return strategy.getSearchResults(keyword);
	}
	
	
	
	
}
