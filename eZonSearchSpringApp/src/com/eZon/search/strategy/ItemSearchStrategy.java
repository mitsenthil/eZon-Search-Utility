package com.eZon.search.strategy;

import java.util.List;

import com.eZon.search.domain.ItemDO;
import com.eZon.search.domain.ItemSearchUtil;

public class ItemSearchStrategy implements SearchStrategy{

	@Override
	public List<ItemDO> getSearchResults(String keyword) {
		int noOfItems =10;
		List<ItemDO> searchResults = new ItemSearchUtil().getItemSearchResults(keyword, noOfItems);
		return searchResults;
	}

}
