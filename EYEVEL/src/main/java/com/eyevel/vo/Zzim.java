package com.eyevel.vo;
//CLS-003 찜 테이블
public class Zzim {

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
		return "Zzim [areaNo=" + areaNo + ", weather=" + weather + ", img=" + img + "]";
	}
	
	
}
