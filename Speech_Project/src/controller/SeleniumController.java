package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.sun.java.swing.plaf.windows.resources.windows;

import dao.MyBatisDao;
import dto.Keyword;
import dto.User;
import setting.Component;
import setting.Controller;
import setting.DataBinding;
import singleton.BrowserSingleton;
import singleton.MyBatisConnectionFactory;

@Component("/view/speech.do")
public class SeleniumController implements Controller, DataBinding {
	private WebDriver driver;
	private WebElement element;

	@Override
	public Object[] getDataBinders() {
		// TODO Auto-generated method stub
		return new Object[] { "keyword", dto.Keyword.class};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = (HttpSession) model.get("session");
		User user = (User) session.getAttribute("loginuser");
		Keyword keyword = (Keyword) model.get("keyword");
		keyword.setEmail(user.getEmail());
		String[] words = keyword.getKeyword().split("\\s");


		try {
			if(keyword.getKeyword().contains("켜")) {
				
				String url = new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).select_url(words[0]);
				if(url != null) {
				driver = BrowserSingleton.getBrowser();
				driver.get(url);
				}else {
					model.put("Message"	, "다시 말해 주세요");
				}
				// get방식으로 url 요청
			}else if(keyword.getKeyword().contains("검색")) {
				new MyBatisDao(MyBatisConnectionFactory.getSqlSessionFactory()).insert_word(keyword);
				if(driver.getCurrentUrl().contains("google")) {
				// 검색 name
				element = driver.findElement(By.name("q"));
				Thread.sleep(500);
				}else if(driver.getCurrentUrl().contains("naver")) {
					element = driver.findElement(By.name("query"));
					Thread.sleep(500);
				}
				element.clear();
				// 검색할 내용
				element.sendKeys(words[0]);
				// 검색 버튼
				element.submit();
				
				
				// 설명 div.classname
//				element = driver.findElement(By.className("kno-rdesc"));
//				model.put("element", element.getText());
			}else if(keyword.getKeyword().contains("서비스")) {
				driver.quit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return "include:/view/index.jsp";

	}

}
