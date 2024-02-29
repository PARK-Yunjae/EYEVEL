package com.eyevel.vo;

//CLS-006 관광지 이미지 테이블
public class AreaImg {

	private int area_no;
	private String weather;
	private String img;


	public int getArea_no() {
		return area_no;
	}

	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "AreaImg [area_no=" + area_no + ", weather=" + weather + ", img=" + img + "]";
	}

}
