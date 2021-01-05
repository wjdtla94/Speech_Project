package dto;


public class Weather {
	
	private int sky;
	private String baseDate;
	private String baseTime;
	private double t3h;
	
	public Weather() {
		
	}
	
	public Weather(int sky  ,String baseDate, String baseTime, Double t3h) {
		this.sky = sky;
		this.baseDate = baseDate;
		this.baseTime = baseTime;
		this.t3h = t3h;
	
	}



	public int getSky() {
		return sky;
	}

	public void setSky(int sky) {
		this.sky = sky;
	}

	public double getT3h() {
		return t3h;
	}

	public void setT3h(double t3h) {
		this.t3h = t3h;
	}

	public String getBaseDate() {
		return baseDate;
	}

	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}

	public String getBaseTime() {
		return baseTime;
	}

	public void setBaseTime(String baseTime) {
		this.baseTime = baseTime;
	}

	

	
}
