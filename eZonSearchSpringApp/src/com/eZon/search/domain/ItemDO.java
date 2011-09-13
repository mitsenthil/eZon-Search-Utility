package com.eZon.search.domain;

public class ItemDO {

	private String itemID;
	
	private String itemTitle;
	
	private String itemImage;
	
	private String viewItemUrl; 

	public String getViewItemUrl() {
		return viewItemUrl;
	}

	public void setViewItemUrl(String viewItemUrl) {
		this.viewItemUrl = viewItemUrl;
	}

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

	public String getItemTitle() {
		return itemTitle;
	}

	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	
	
}
