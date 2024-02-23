package com.eyevel.vo;
//CLS-006 관광지 이미지 테이블
public class AreaImg {
	
	private int areaNo;
	private int weather;
	private String img;
	
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public int getWeather() {
		return weather;
	}
	public void setWeather(int weather) {
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
		return "AreaImg [areaNo=" + areaNo + ", weather=" + weather + ", img=" + img + "]";
	}
	
	
}
