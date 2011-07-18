package com.eZon.search.domain;

import java.util.ArrayList;
import java.util.List;

import com.ebay.services.client.ClientConfig;
import com.ebay.services.client.FindingServiceClientFactory;
import com.ebay.services.finding.FindItemsByKeywordsRequest;
import com.ebay.services.finding.FindItemsByKeywordsResponse;
import com.ebay.services.finding.FindingServicePortType;
import com.ebay.services.finding.PaginationInput;
import com.ebay.services.finding.SearchItem;

public class FindItemUtil {
	
	public static void main(String[] args) {
		getSearchResults("shoes",10);
	}

	
	public static List<ItemDO> getSearchResults(String keyword,int noOfItems){
		List<SearchItem> items = new ArrayList<SearchItem>();
		List<ItemDO> itemDOList =  new ArrayList<ItemDO>();
		try {
			ClientConfig config = new ClientConfig();
			config.setApplicationId("Mindtree-d6a2-4f12-92b8-732c46adf2fd");
			FindingServicePortType serviceClient = FindingServiceClientFactory.getServiceClient(config);
			FindItemsByKeywordsRequest request = new FindItemsByKeywordsRequest();
			request.setKeywords(keyword);
			PaginationInput pi = new PaginationInput();
			pi.setEntriesPerPage(noOfItems);
			request.setPaginationInput(pi);
			FindItemsByKeywordsResponse result = serviceClient.findItemsByKeywords(request);
			items = result.getSearchResult().getItem();			
			for(SearchItem item:items){
				ItemDO itemDO = new ItemDO();
				itemDO.setItemID(item.getItemId());
				itemDO.setItemImage(item.getGalleryURL());
				itemDO.setItemTitle(item.getTitle());
				itemDO.setViewItemUrl(item.getViewItemURL());
				itemDOList.add(itemDO);
			}
		} catch (Exception ex) {
		}
		return itemDOList;
	}
}
