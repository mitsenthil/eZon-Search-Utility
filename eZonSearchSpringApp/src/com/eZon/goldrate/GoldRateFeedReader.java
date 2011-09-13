package com.eZon.goldrate;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class GoldRateFeedReader {

	public static List<String> getGoldRate() throws IOException {
		List<String> rateList = new ArrayList<String>();
		XmlReader reader = null;
		try {
			URL url = new URL("http://feeds2.feedburner.com/indiangoldrates/D365");
			reader = new XmlReader(url);
			SyndFeed feed = new SyndFeedInput().build(reader);
			for (Iterator i = feed.getEntries().iterator(); i.hasNext();) {

				SyndEntry entry = (SyndEntry) i.next();
				String fullTitle = entry.getTitle();
				String title = fullTitle.substring(fullTitle.indexOf("-") + 1).trim();
				rateList.add(title);

				String desc = entry.getDescription().getValue();
				String[] descArray = desc.split("<br /><br />");
				for (int k = 0; k < 2; k++) {
					String rate =descArray[k].replace("<b>", "");
					rateList.add(rate);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (reader != null)
				reader.close();
		}
		return rateList;
	}
	
	public static void main(String[] args) {
		try {
			List rates = getGoldRate();
			System.out.println(rates.get(0));
			System.out.println(rates.get(1));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
