package singleton;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class BrowserSingleton {
	static WebDriver driver = null;
	static String WEB_DRIVER_ID = "webdriver.chrome.driver";
	static String WEB_DRIVER_PATH = "C:/work/chromedriver.exe";

	public static WebDriver getBrowser() {
		if (driver == null) {
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
			driver = new ChromeDriver();
			driver.manage().window().maximize();
		}
		return driver;
	}
}
