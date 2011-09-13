package com.eZon.search.strategy;

import java.util.List;

import com.eZon.search.domain.ItemDO;

public interface SearchStrategy {

	public List<ItemDO> getSearchResults(String keyword);
}
