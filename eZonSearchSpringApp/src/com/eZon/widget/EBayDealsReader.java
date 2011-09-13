package com.eZon.widget;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;



public class EBayDealsReader {
	public static void main(String[] args) {
		try{
			
			/*HttpClient client = new HttpClient();
		    GetMethod method = new GetMethod("http://deals.ebay.com/feeds/xml");
		      int returnCode = client.executeMethod(method);
		      System.out.println(returnCode);
		      System.err.println(method.getResponseBodyAsString());
		      method.releaseConnection();*/
		      
		      /*URL url = new URL("http://deals.ebay.com/feeds/xml");
		        URLFetchService urlFetchService =URLFetchServiceFactory.getURLFetchService();
		        HTTPRequest httpRequest = new HTTPRequest(url,HTTPMethod.GET);
		        HTTPResponse resp = urlFetchService.fetch(httpRequest);
		        System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%");
		        System.out.println(resp.toString());
		        */
		        URL url = new URL("http://deals.ebay.com/feeds/xml");
	            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
	            String line;

	            while ((line = reader.readLine()) != null) {
	               System.out.println(line);
	            }
	            reader.close();
		      
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse("http://deals.ebay.com/feeds/xml");
        for(int i=0;i<10;i++){
        	System.out.println(doc.getElementsByTagName("Title").item(i).getTextContent());
        	System.out.println(doc.getElementsByTagName("PictureURL").item(i).getTextContent());
        	System.out.println(doc.getElementsByTagName("DealURL").item(i).getTextContent());
        	System.out.println(doc.getElementsByTagName("SmallPictureURL").item(i).getTextContent());
        	System.out.println(doc.getElementsByTagName("ConvertedCurrentPrice").item(i).getTextContent());
        	System.out.println(doc.getElementsByTagName("MSRP").item(i).getTextContent());
        	System.out.println(doc.getElementsByTagName("SavingsRate").item(i).getTextContent());
        	System.out.println("***********************");
        }
		}catch (Exception e) {
			
		}        
	}
	
	public List<DealsDO> getDeals(){
		List<DealsDO> dealsList = new ArrayList<DealsDO>();
		try{		      
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	        DocumentBuilder db = dbf.newDocumentBuilder();
	        URL url = new URL("http://deals.ebay.com/feeds/xml");
	        URLConnection con = url.openConnection();
	        con.setConnectTimeout(10000);
	        Document doc = db.parse(con.getInputStream());
	        
	        for(int i=1;i<=10;i++){
	        	DealsDO dealsDO = new DealsDO();
	        	dealsDO.setTitle(doc.getElementsByTagName("Title").item(i).getTextContent());
	        	dealsDO.setImgURL(doc.getElementsByTagName("PictureURL").item(i).getTextContent());
	        	dealsDO.setSmallImgURL(doc.getElementsByTagName("SmallPictureURL").item(i).getTextContent());
	        	
	        	dealsDO.setDealURL(doc.getElementsByTagName("DealURL").item(i).getTextContent());
	        	dealsDO.setOriginalPrice(doc.getElementsByTagName("MSRP").item(i).getTextContent());
	        	dealsDO.setSavings(doc.getElementsByTagName("SavingsRate").item(i).getTextContent());
	        	dealsDO.setCurrentPrice(doc.getElementsByTagName("ConvertedCurrentPrice").item(i).getTextContent());
	        	dealsDO.setCssClassName("p"+i);
	        	dealsList.add(dealsDO);
	        }
			}catch (Exception e) {
			System.out.println("Error in fecthing deals");	
			}
		
		return dealsList;
		
		
	}
}
