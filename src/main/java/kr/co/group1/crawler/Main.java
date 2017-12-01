package kr.co.group1.crawler;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriver;


public class Main {

	public static void main(String[] args) throws Exception {

		/*System.setProperty("phantomjs.binary.path", "libs/phantomjs.exe");
		WebDriver ghost = new PhantomJSDriver();
		ghost.get("http://www.ticketmonster.co.kr/deallist/57090000");
		Document doc = 
				Jsoup.parse(ghost.getPageSource());
		Elements imgs = doc.select(".thumb > img");
		System.out.println(imgs.size());
		int i = 1;
		for(Element img : imgs) {
			URL url = new URL(img.attr("src"));
			BufferedImage image = ImageIO.read(url);
			if(image != null)
				ImageIO.write(image, "png", new File("D:\\images\\appliance\\life\\"+ (i++) + ".png"));
		}
	
		ghost.quit();*/
		LocalDate today = LocalDate.now();
		today.minusMonths(3);
		System.out.println(today.minusMonths(3));
		LocalDateTime now = LocalDateTime.now();
		System.out.println(now);
		Date date = new Date();
		System.out.println(date);
		System.out.println(date.toInstant());
		
	}
}
