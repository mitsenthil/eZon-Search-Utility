package com.eZon.search.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ItemSearchUtil {
	private static final String AWS_ACCESS_KEY_ID = "AKIAIBUP7WUEPIQOLYTA";
	private static final String AWS_SECRET_KEY = "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";
	private static final String ENDPOINT = "ecs.amazonaws.com";
	public static void main(String[] args) {
		List<ItemDO> items = new ItemSearchUtil().getItemSearchResults("shoes",10);
		System.out.println(items.get(0).getItemTitle());
		System.out.println(items.get(0).getItemImage());
		System.out.println(items.get(0).getItemID());
        
	}
	
	public List<ItemDO> getItemSearchResults(String keyword,int noOfItems){
		List<ItemDO> itemDOList= new ArrayList<ItemDO>();
		SignedRequestsHelper helper;
        try {
            helper = SignedRequestsHelper.getInstance(ENDPOINT, AWS_ACCESS_KEY_ID, AWS_SECRET_KEY);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        String requestUrl = null;
        Map<String, String> params = new HashMap<String, String>();
        params.put("Service", "AWSECommerceService");
        params.put("Version", "2009-03-31");
        params.put("Operation", "ItemSearch");
        params.put("Keywords", keyword);
        params.put("ResponseGroup", "Medium");
        params.put("SearchIndex", "All");
        requestUrl = helper.sign(params);
        //System.out.println(requestUrl);
        fetchValues(requestUrl,itemDOList,noOfItems);        
        return itemDOList;
	}
	
	 private List<ItemDO> fetchValues(String requestUrl,List<ItemDO> itemDOList,int noOfItems) {
		 try {
	            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	            DocumentBuilder db = dbf.newDocumentBuilder();
	            Document doc = db.parse(requestUrl);
	            for(int i=0;i<noOfItems;i++){
	            	ItemDO itemDo = new ItemDO();
	            	itemDo.setItemTitle(doc.getElementsByTagName("Title").item(i).getTextContent());
	            	itemDo.setItemImage(processImage(doc,i));
	            	//itemDo.setItemImage(doc.getElementsByTagName("MediumImage").item(i).getFirstChild().getTextContent());
	            	itemDo.setItemID(doc.getElementsByTagName("ASIN").item(i).getTextContent());
	            	itemDo.setViewItemUrl(doc.getElementsByTagName("DetailPageURL").item(i).getTextContent());	            	
	            	itemDOList.add(itemDo);
	            }
	        } catch (Exception e) {
	            throw new RuntimeException(e);
	        }
		 return itemDOList;
	 }
	 
	 private String processImage(Document doc,int index){
		 
		 String imageurl = null;
		 Node node = doc.getElementsByTagName("Item").item(index);
		 NodeList list =node.getChildNodes();
		 for(int i = 0 ; i < list.getLength();i++) {
			 if(list.item(i).getNodeName().equalsIgnoreCase("MediumImage")){
				 imageurl=list.item(i).getFirstChild().getTextContent();
			 }
		 }
			 
		 return imageurl;
	 }
		 
	 
}
