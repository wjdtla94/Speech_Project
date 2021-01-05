package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dto.Weather;

/**
 * Servlet implementation class WeatherServlet
 */
@WebServlet("/view/weather.do")
public class WeatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeatherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=6Fc3xHNmMAkMNmkO%2FHC%2FXanofkWN9Nt2xVz9ASgr%2BySpM1F95JCCDCNQx4iCSJ4u%2BzX9l5md6BvNgABibsBUbg%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("9", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode("20201207", "UTF-8")); /*20년 10월 26일발표  24시간 전 데이터 까지만 볼수 있음*/
	        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0800", "UTF-8")); /*3시간 단위 02:00 - 05:00 - 08:00 - 11:00 - 14:00 - 17:00 - 20:00 - 23:00*/
	        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("61", "UTF-8")); /*예보지점 X 좌표값*/
	        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("129", "UTF-8")); /*예보지점의 Y 좌표값*/
	        
	        /*
			 * GET방식으로 전송해서 파
			 * 라미터 받아오기
			 */
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
	        //--------------------------------------- Json parser를 만들어 만들어진 문자열 데이터를 객체화 ----------------------------
			JSONParser parser = new JSONParser();
			JSONObject obj;
			try {
				obj = (JSONObject) parser.parse(sb.toString());
				JSONObject parse_response = (JSONObject) obj.get("response"); 
				// response 로 부터 body 찾기
				JSONObject parse_body = (JSONObject) parse_response.get("body"); 
				// body 로 부터 items 찾기 
				JSONObject parse_items = (JSONObject) parse_body.get("items");
				
				// items로 부터 itemlist 를 받기 
				JSONArray parse_item = (JSONArray) parse_items.get("item");
				String category;
				JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용
				Weather we = new Weather();
				// 카테고리와 값만 받아오기
				String day="";
				String time="";
				for(int i = 0 ; i < parse_item.size(); i++) {
					weather = (JSONObject) parse_item.get(i);
					//Object fcstValue = weather.get("fcstValue");
					Object fcstDate = weather.get("fcstDate");
					Object fcstTime = weather.get("fcstTime");
					//double형으로 받고싶으면 아래내용 주석 해제
					double fcstValue = Double.parseDouble(weather.get("fcstValue").toString());
					category = (String)weather.get("category"); 
					// 출력
					if(!day.equals(fcstDate.toString())) {
						day=fcstDate.toString();
					}
					if(!time.equals(fcstTime.toString())) {
						time=fcstTime.toString();
						System.out.println(day+"  "+time);
					}
					System.out.print("\tcategory : "+ category);
					System.out.print(", fcst_Value : "+ fcstValue);
					System.out.print(", fcstDate : "+ fcstDate);
					System.out.println(", fcstTime : "+ fcstTime);
					if(category.equals("SKY")) {
						we.setSky((int)Math.round(fcstValue));
					}else if(category.equals("T3H")) {
						we.setBaseDate(fcstDate.toString());
						we.setBaseTime(fcstTime.toString());
						we.setT3h(fcstValue);
						
					}
				}
				//----------------------------객체 저장--------------------------------------
				RequestDispatcher rd1 = request.getRequestDispatcher("/view/index.jsp");
				request.setAttribute("weather", we);
				rd1.forward(request, response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	      
	}

}
