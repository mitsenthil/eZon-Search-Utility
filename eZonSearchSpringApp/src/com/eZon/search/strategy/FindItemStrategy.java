package com.eZon.search.strategy;

import java.util.List;

import com.eZon.search.domain.FindItemUtil;
import com.eZon.search.domain.ItemDO;

public class FindItemStrategy implements SearchStrategy{

	@Override
	public List<ItemDO> getSearchResults(String keyword) {
	int noOfItems =10;
	List<ItemDO> searchResults = FindItemUtil.getSearchResults(keyword, noOfItems);
	return searchResults;
	}

}
