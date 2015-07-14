package iii.org._listener;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.jasper.tagplugins.jstl.core.Url;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WebCrawler {
	private URL webUrl;
	private Document xmlDoc;
	
	public WebCrawler(URL url) throws IOException{
		this.webUrl = url;
		this.xmlDoc =  Jsoup.parse(url, 3000); //使用Jsoup jar 去解析網頁
	}

	public WebCrawler(String url){
		
	}	
	
	public Document getXmlDoc(){
		return this.xmlDoc;
	}
	
	public static void main(String[] args) throws IOException {
		
		URL url = new URL("http://app.atmovies.com.tw/movie/movie.cfm?action=boxoffice&bo_code=TWWeekend"); 
		WebCrawler crawler = new WebCrawler(url);
		Document xmlDoc = crawler.getXmlDoc();
		Elements title = xmlDoc.select("td"); //要解析的tag元素為title
		Elements happy = xmlDoc.select("tr");  //要解析的tag元素為td
		for(Element element:happy){
			System.out.println(element.text());
		}
	}
}
